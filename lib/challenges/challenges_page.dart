import 'package:blink/challenges/take_challenge_page.dart';
import 'package:blink/models/challenges_model.dart';
import 'package:blink/services/challenges_reposiotries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/challenges_bloc_bloc.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({super.key});

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChallengesBlocBloc>(
          create: (BuildContext context) =>
              ChallengesBlocBloc(ChallengeRepository()),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90), // Set this height
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: "            ፈተና ሞክር!",
                                    style: TextStyle(
                                      color: Color.fromRGBO(51, 53, 123, 0.7),
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: blocBody()),
      ),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => ChallengesBlocBloc(
        ChallengeRepository(),
      )..add(
          LoadChallengesEvent(),
        ),
      child: BlocBuilder<ChallengesBlocBloc, ChallengesBlocState>(
        builder: (context, state) {
          if (state is ChallengesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ChallengesErrorState) {
            return Center(
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<ChallengesBlocBloc>(context)
                      .add(LoadChallengesEvent());
                },
                icon: Icon(Icons.replay_outlined),
              ),
            );
          }
          if (state is ChallengesLoadedState) {
            List<ChallengeModel> challengeList = state.challenges;
            return Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      color: Color.fromRGBO(51, 53, 123, 0.7),
                      height: double.infinity,
                      width: 3,
                    ),
                  ),
                  ListView.builder(
                    itemCount: challengeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < 3) {
                        return _buildChallengeListUnlocked(
                            challengeList[index]);
                      }
                      return _buildChallengeListlocked(challengeList[index]);
                    },
                  ),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget _buildChallengeListUnlocked(ChallengeModel challenge) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Card(
              child: ExpansionTile(
                textColor: Color.fromRGBO(51, 53, 123, 0.7),
                trailing: const Icon(
                  Icons.lock_open,
                  color: Color.fromRGBO(51, 53, 123, 0.7),
                ),
                title: Center(
                  child: Text(
                    challenge.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(51, 53, 123, 0.7),
                    ),
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      height: 40,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TakeChallengePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(
                              51, 53, 123, 1), // Background color
                        ),
                        child: Text("Start"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 18,
            left: -9,
            child: Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Color.fromRGBO(51, 53, 123, 0.7)),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengeListlocked(ChallengeModel challenge) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Card(
              child: ExpansionTile(
                textColor: Color.fromRGBO(51, 53, 123, 0.7),
                trailing: const Icon(
                  Icons.lock,
                  color: Color.fromRGBO(51, 53, 123, 0.7),
                ),
                title: Center(
                  child: Text(
                    challenge.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(51, 53, 123, 0.7),
                    ),
                  ),
                ),
                children: <Widget>[],
              ),
            ),
          ),
          Positioned(
            top: 18,
            left: -9.5,
            child: Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Color.fromRGBO(51, 53, 123, 0.7)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
