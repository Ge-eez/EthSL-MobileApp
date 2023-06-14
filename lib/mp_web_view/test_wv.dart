import 'dart:convert';
import 'dart:math';
import 'package:blink/models/letters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  bool _isLoading = true;
  bool _isVisible = false;
  bool _isPrediciting = false;
  Key _refreshKey = UniqueKey();
  dynamic _videoCounter = "00";
  bool _canPredict = false;
  bool _isRecording = false;
  final player = AudioPlayer();
  List recorded_results = [];
  var curr = letters[Random().nextInt(letters.length)];
  String _form = "assets/signs/1.PNG";
  String _root = "assets/signs/1.PNG";
  late InAppWebViewController _webViewController;
  @override
  void initState() {
    super.initState();
    setHint(curr);
  }

  InAppWebViewSettings settings = InAppWebViewSettings(
    mediaPlaybackRequiresUserGesture: false,
    allowFileAccessFromFileURLs: true,
    // Off by default, deprecated for SDK versions >= 30.
    allowUniversalAccessFromFileURLs: true,
    allowFileAccess: true,
    allowContentAccess: true,
    webViewAssetLoader: WebViewAssetLoader(
      domain: "my.custom.domain.com",
      pathHandlers: [AssetsPathHandler(path: '/assets/')],
    ),
  );

  void setHint(curr) {
    hints.forEach((element) {
      element.forEach((key, value) {
        if (key.contains(curr["letter"])) {
          setState(() {
            _root = "assets/signs/" + value;
            _form = "assets/signs/" + curr["form"] + ".PNG";
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: InAppWebView(
              initialSettings: settings,
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  mediaPlaybackRequiresUserGesture: false,
                  allowUniversalAccessFromFileURLs: true,
                ),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
                _webViewController.addJavaScriptHandler(
                  handlerName: "getLandmarks",
                  callback: (args) async {
                    if (_isRecording) {
                      recorded_results.add(args[0]);
                      _videoCounter = recorded_results.length;
                      setState(() {
                        _refreshKey = UniqueKey();
                      });
                    }
                    if (recorded_results.length == 15 && _canPredict) {
                      //print(recorded_results);
                      setState(() {
                        _isRecording = false;
                        _canPredict = false;
                        _isPrediciting = true;
                      });
                      var url = 'https://flask-dtw.onrender.com/process';
                      Map data = {"results": recorded_results};
                      var body = json.encode(data);
                      var response = await http.post(Uri.parse(url),
                          headers: {"Content-Type": "application/json"},
                          body: body);

                      print(response.body);
                      if (response.statusCode == 200) {
                        if (response.body == "hu") {
                          await player.play(AssetSource('bell.wav'));
                          setState(() {
                            _isPrediciting = false;
                            curr = {
                              "character": "\u{2713}",
                              "letter": "ሀ",
                              "form": "1"
                            };
                          });
                        } else {
                          setState(() {
                            _isPrediciting = false;
                            curr = {
                              "character": "\u{274C}",
                              "letter": "ሀ",
                              "form": "1"
                            };
                          });
                        }
                      } else {
                        setState(() {
                          _isPrediciting = false;
                          curr = {
                            "character": "\u{274C}",
                            "letter": "ሀ",
                            "form": "1"
                          };
                        });
                      }
                      await Future.delayed(Duration(seconds: 1));
                      setState(() {
                        curr = letters[Random().nextInt(letters.length)];
                        recorded_results = [];
                        _videoCounter = "00";
                      });
                      setHint(curr);
                    }
                  },
                );
                _webViewController.addJavaScriptHandler(
                    handlerName: "pageLoaded",
                    callback: (args) {
                      setState(() {
                        _isLoading = false;
                      });
                      args;
                      print(args);
                    });
                // _webViewController.loadFile(
                //     assetFilePath: 'assets/www/index.html');
                _webViewController.loadUrl(
                  urlRequest: URLRequest(
                      url: WebUri(
                          "https://my.custom.domain.com/assets/flutter_assets/assets/www/index.html")),
                );
              },
              androidOnPermissionRequest: (InAppWebViewController controller,
                  String origin, List<String> resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              onProgressChanged: (controller, progress) {
                print(progress);
              },
            ),
          ),
          if (!_isLoading) ...[
            Positioned(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(78, 28, 45, 43),
                ),
                width: MediaQuery.of(context).size.width,
                height: 100,
              ),
            ),
            Positioned(
              top: 58,
              left: 32,
              child: Icon(
                Icons.fiber_manual_record,
                size: 12,
                color: _isRecording
                    ? Colors.red
                    : Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Positioned(
              top: 72,
              left: 25,
              child: Text(
                "0:" + _videoCounter.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
                key: _refreshKey,
              ),
            ),
            Positioned(
              top: 50,
              right: 15,
              child: IconButton(
                iconSize: 35,
                icon: const Icon(Icons.close_rounded,
                    color: Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {
                  // ...
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              left: 15,
              right: 2,
              bottom: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(153, 28, 45, 43),
                        border: Border.all(
                            color: Color.fromRGBO(227, 227, 233, 1), width: 2),
                      ),
                      width: 100,
                      height: 130,
                      child: FittedBox(
                        //
                        fit: BoxFit.scaleDown,
                        //
                        child: Text(
                          String.fromCharCodes(Runes(curr["character"]!)),
                          style: TextStyle(
                              color: Colors.green.shade400, fontSize: 65),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(153, 28, 45, 43),
                            border: Border.all(
                                color: Color.fromRGBO(51, 53, 123, 1),
                                width: 2),
                          ),
                          width: 100,
                          height: 130,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                _root,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(153, 28, 45, 43),
                            border: Border.all(
                                color: const Color.fromRGBO(51, 53, 123, 1),
                                width: 2),
                          ),
                          width: 100,
                          height: 130,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                _form,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _isPrediciting,
              key: _refreshKey,
              child: Positioned(
                left: 15,
                bottom: 170,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 28, 45, 43),
                    border: Border.all(
                        color: Color.fromRGBO(227, 227, 233, 1), width: 2),
                  ),
                  width: 100,
                  height: 130,
                  child: Center(
                    child: Image.asset(
                      scale: 0.5,
                      "assets/PbU.gif",
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 15,
              right: 15,
              bottom: 125,
              child: Center(
                child: Text(
                  "Press letter to see hints!",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ),
            Positioned(
              left: 15,
              right: 15,
              bottom: 35, //MediaQuery.of(context).size.height / 6,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 50,
                    icon: const Icon(Icons.album_outlined,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    onPressed: () {
                      // ...
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              itemCount: letters.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      curr = letters[index];
                                    });
                                    setHint(curr);
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(153, 28, 45, 43),
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(227, 227, 233, 1),
                                          width: 0.5),
                                    ),
                                    child: FittedBox(
                                      //
                                      fit: BoxFit.scaleDown,
                                      //
                                      child: Text(
                                        String.fromCharCodes(Runes(
                                            letters[index]["character"]!)),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 25),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 80,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!_isRecording) {
                        setState(() {
                          _canPredict = !_canPredict;
                          _isRecording = true;
                        });
                      }
                    },
                    child: Icon(Icons.fiber_manual_record,
                        size: 20, color: Color.fromARGB(0, 244, 67, 54)),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      side: const BorderSide(
                          width: 4, color: Color.fromARGB(197, 161, 119, 20)),
                      padding: EdgeInsets.all(20),
                      minimumSize: Size(70, 70),
                      backgroundColor:
                          Color.fromRGBO(255, 177, 0, 1), // <-- Button color
                      foregroundColor:
                          Color.fromARGB(239, 76, 98, 62), // <-- Splash color
                    ),
                  ),
                  IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.shuffle_rounded,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    onPressed: () {
                      // ...
                      setState(() {
                        curr = letters[Random().nextInt(letters.length)];
                      });
                      setHint(curr);
                    },
                  ),
                ],
              ),
            ),
          ],
          if (_isLoading) ...[
            Center(
              child: Image.asset(
                scale: 1,
                "assets/PbU.gif",
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 3.3,
              bottom: MediaQuery.of(context).size.height / 2.8,
              child: Center(
                child:
                    Text("Please wait for my brain\n               to load..."),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
