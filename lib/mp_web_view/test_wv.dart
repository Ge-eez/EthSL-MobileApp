import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  bool _isLoading = true;
  bool _isTest = false;
  bool _isRecording = false;
  List recorded_results = [];
  late InAppWebViewController _webViewController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Free practice'),
        backgroundColor: Color.fromRGBO(51, 53, 123, 1),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                mediaPlaybackRequiresUserGesture: false,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
              _webViewController.addJavaScriptHandler(
                handlerName: "getLandmarks",
                callback: (args) async {
                  if (_isRecording) {
                    recorded_results.add(args[0]);
                  }
                  if (recorded_results.length == 50) {
                    //print(recorded_results);
                    var url = 'https://flask-dtw.onrender.com/process';
                    Map data = {"results": recorded_results};
                    var body = json.encode(data);
                    var response = await http.post(Uri.parse(url),
                        headers: {"Content-Type": "application/json"},
                        body: body);
                    print("${response.statusCode}");
                    print("${response.body}");
                    _isRecording = !_isRecording;
                    recorded_results = [];
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
              _webViewController.loadFile(
                  assetFilePath: 'assets/www/index.html');
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
          Positioned(
            bottom: 0,
            child: Container(
              height: 173,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.2,
                    0.5,
                    0.6,
                  ],
                  colors: [
                    Color.fromRGBO(51, 53, 123, 1),
                    Color.fromRGBO(51, 53, 123, 0.938),
                    Color.fromRGBO(51, 53, 123, 0.952),
                  ],
                ),
              ),
            ),
          ),
          if (!_isLoading) ...[
            Positioned(
              top: 5,
              right: 15,
              child: Icon(
                Icons.online_prediction_rounded,
                size: 40,
                color:
                    _isTest ? Colors.red : Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Positioned(
              left: 155,
              bottom: 115,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(51, 53, 123, 1), width: 2),
                ),
                width: 100,
                height: 130,
                child: FittedBox(
                  child: Image.asset(
                    "assets/hah.PNG",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              left: 2,
              right: 2,
              bottom: 15, //MediaQuery.of(context).size.height / 6,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.online_prediction_rounded,
                        size: 22, color: Color.fromARGB(255, 255, 255, 255)),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      side: const BorderSide(width: 2, color: Colors.white),
                      padding: EdgeInsets.all(20),
                      minimumSize: Size(25, 25),
                      backgroundColor:
                          Color.fromRGBO(51, 53, 123, 1), // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isTest = !_isTest;
                      });
                    },
                    child: Icon(Icons.fiber_manual_record,
                        size: 20, color: Color.fromARGB(0, 244, 67, 54)),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      side: const BorderSide(
                          width: 4, color: Color.fromARGB(255, 255, 255, 255)),
                      padding: EdgeInsets.all(20),
                      minimumSize: Size(70, 70),
                      backgroundColor:
                          Color.fromRGBO(239, 76, 98, 1), // <-- Button color
                      foregroundColor:
                          Color.fromARGB(239, 76, 98, 62), // <-- Splash color
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.skip_next_rounded,
                        size: 22, color: Color.fromARGB(255, 255, 255, 255)),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      side: const BorderSide(width: 2, color: Colors.white),
                      padding: EdgeInsets.all(20),
                      minimumSize: Size(25, 25),
                      backgroundColor:
                          Color.fromRGBO(51, 53, 123, 1), // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (_isLoading) ...[
            Center(
              child: Image.asset(
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
