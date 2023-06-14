import 'package:blink/lesson/take_lesson_page.dart';
import 'package:blink/models/challenges_model.dart';
import 'package:blink/models/lessons_model.dart';
import 'package:blink/services/challenges_reposiotries.dart';
import 'package:blink/services/service_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/challenges_bloc_bloc.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LessonBlocBloc>(
          create: (BuildContext context) => LessonBlocBloc(LessonRepository()),
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
                                    text: "       ትምህርት ይጀምሩ!",
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
      create: (context) => LessonBlocBloc(
        LessonRepository(),
      )..add(
          LoadLessonsEvent(),
        ),
      child: BlocBuilder<LessonBlocBloc, LessonsBlocState>(
        builder: (context, state) {
          if (state is LessonsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LessonsErrorState) {
            return Center(
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<LessonBlocBloc>(context)
                      .add(LoadLessonsEvent());
                },
                icon: Icon(Icons.replay_outlined),
              ),
            );
          }
          if (state is LessonsLoadedState) {
            List<LessonModel> challengeList = state.lessons;
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
                      return _buildChallengeListUnlocked(challengeList[index]);
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

  Widget _buildChallengeListUnlocked(LessonModel lesson) {
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
                  Icons.arrow_drop_down_rounded,
                  color: Color.fromRGBO(51, 53, 123, 0.7),
                ),
                title: Center(
                  child: Text(
                    lesson.name,
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
                                builder: (context) => TakeLessonPage(
                                      currentChallenge: lesson,
                                    )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(
                              51, 53, 123, 1), // Background color
                        ),
                        child: Text("ይጀምሩ"),
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
}
