// ignore_for_file: use_key_in_widget_constructors, unused_element, slash_for_doc_comments, unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:thinkit/Components/question_page/answer_button.dart';
import 'package:thinkit/Components/question_page/question_format.dart';
import 'package:thinkit/Components/question_page/quiz_outroduction.dart';
import 'package:thinkit/Components/question_page/quiz_introduction.dart';
import 'package:thinkit/Components/question_page/question_resources.dart';
import 'package:thinkit/Pages/ResultsPage.dart';

//firebase libs
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:thinkit/firebase_options.dart';

class QuestionImplementation extends StatefulWidget {
  @override
  State<QuestionImplementation> createState() => _QuestionImplementationState();
}

class _QuestionImplementationState extends State<QuestionImplementation> {
  int _displayText = 1;
  final _database = FirebaseDatabase.instance.reference();
  late StreamSubscription _Stream;

  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    _Stream = _database.child("test").onValue.listen((event) {
      final int description = event.snapshot.value as int;
      setState(() {
        _displayText = description;
      });
    });
  }
/***************************VARIABLE INITIALIZATIONS***************************/

  // question and answer index variables to explore both lists
  var _questionIndex = 0;
  var _answerIndex = 0;
  // thinking styles counter variables
  var _synthesistCounter = 0;
  var _idealistCounter = 0;
  var _pragmatistCounter = 0;
  var _analystCounter = 0;
  var _realistCounter = 0;
  // end quiz variables
  // endOfQuiz will be used to determine visibility of widgets when quiz ends
  // isQuizVisible will be used for quiz visibility
  var _isIntroVisible = true;
  var _endOfQuiz = false;
  var _isQuizVisible = false;
  // variables that will be pushed to the results page
  var synthesistPercentage = 0;
  var idealistPercentage = 0;
  var pragmatistPercentage = 0;
  var analystPercentage = 0;
  var realistPercentage = 0;

  final _questionsTotal = Resources.questionList.length;

/**********************END VARIABLE INITIALIZATIONS****************************/

/*************************QUESTIONS HELPER FUNCTIONS***************************/
/**
 * Each of the functions below aids with the question and answer portion of 
 * the quiz. 
 * When a thinking style is selected, all the counters inside it go up by 1
 * The question and answer counters stop working when the questions number
 * matches the length of the list 
 */

  void _beginQuiz() {
    setState(() {
      // begin quiz
      // set introduction visibility to false
      _isIntroVisible = false;
      // set quiz visibility to true
      _isQuizVisible = true;
    });
  }

  void _answerSynthetist() {
    setState(() {
      // incremement all counters only if the question counter is less
      // than the length of the list
      // else increment just the pushed button counter
      // increment the synthetist counter
      if (_questionIndex + 1 < _questionsTotal) {
        _synthesistCounter = _synthesistCounter + 1;
        _questionIndex = _questionIndex + 1;
        _answerIndex = _answerIndex + 5;
      } else {
        // increment just the pushed button
        _synthesistCounter = _synthesistCounter + 1;
        // end quiz
        _endOfQuiz = true;
        // set widget to invisible
        _isQuizVisible = false;
      }
    });
  }

  void _answerIdealist() {
    setState(() {
      // increment the idealist counter
      if (_questionIndex + 1 < _questionsTotal) {
        _idealistCounter = _idealistCounter + 1;
        _questionIndex = _questionIndex + 1;
        _answerIndex = _answerIndex + 5;
      } else {
        // increment just the pushed button
        _idealistCounter = _idealistCounter + 1;
        // end quiz
        _endOfQuiz = true;
        // set widget to invisible
        _isQuizVisible = false;
      }
    });
  }

  void _answerPragmatist() {
    setState(() {
      // increment the pragmatist counter
      if (_questionIndex + 1 < _questionsTotal) {
        _pragmatistCounter = _pragmatistCounter + 1;
        _questionIndex = _questionIndex + 1;
        _answerIndex = _answerIndex + 5;
      } else {
        // increment just the pushed button
        _pragmatistCounter = _pragmatistCounter + 1;
        // end quiz
        _endOfQuiz = true;
        // set widget to invisible
        _isQuizVisible = false;
      }
    });
  }

  void _answerAnalyst() {
    setState(() {
      // increment the analyst counter
      if (_questionIndex + 1 < _questionsTotal) {
        _analystCounter = _analystCounter + 1;
        _questionIndex = _questionIndex + 1;
        _answerIndex = _answerIndex + 5;
      } else {
        // increment just the pushed button
        _analystCounter = _analystCounter + 1;
        // end quiz
        _endOfQuiz = true;
        // set widget to invisible
        _isQuizVisible = false;
      }
    });
  }

  void _answerRealist() {
    setState(() {
      // increment the realist counter
      if (_questionIndex + 1 < _questionsTotal) {
        _realistCounter = _realistCounter + 1;
        _questionIndex = _questionIndex + 1;
        _answerIndex = _answerIndex + 5;
      } else {
        // increment just the pushed button
        _realistCounter = _realistCounter + 1;
        // end quiz
        _endOfQuiz = true;
        // set widget to invisible
        _isQuizVisible = false;
      }
    });
  }

  /*
  // get results in percentages
  void _getResults() {
    setState(() {
      synthesistPercentage = (_synthesistCounter * 100) ~/ 10;
      idealistPercentage = (_idealistCounter * 100) ~/ 10;
      pragmatistPercentage = (_pragmatistCounter * 100) ~/ 10;
      analystPercentage = (_analystCounter * 100) ~/ 10;
      realistPercentage = (_realistCounter * 100) ~/ 10;
    });
  }
  */
  List<int> get quizResults {
    final List<int> resultList = [
      synthesistPercentage = (_synthesistCounter * 100) ~/ 10,
      idealistPercentage = (_idealistCounter * 100) ~/ 10,
      pragmatistPercentage = (_pragmatistCounter * 100) ~/ 10,
      analystPercentage = (_analystCounter * 100) ~/ 10,
      realistPercentage = (_realistCounter * 100) ~/ 10,
    ];
    return resultList;
  }

/***********************END QUESTIONS HELPER FUNCTIONS*************************/
  @override
  Widget build(BuildContext context) {
    // Designs the entire page
    // The first child contains the wallpaper
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/thinkit_bg.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        // Scroll view implementation to allow for a more dynamic page that
        // changes based on screen resolutions.
        child: SingleChildScrollView(
          // Every widget is implemented in a column (top - down)
          child: Column(
            children: [
              // quiz introduction is implemented here
              Visibility(
                visible: _isIntroVisible,
                // Quiz introduction container
                child: Container(
                  width: 1100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Introduction(),
                      OutlinedButton(
                        onPressed: () {
                          _beginQuiz();
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: const BorderSide(color: Colors.pinkAccent),
                        ),
                        child: Text(
                          "I Understand! Start The Quiz",
                          style: GoogleFonts.architectsDaughter(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              // Quiz is visible until all the questions are done
              // At the end, the quiz widget should disappear
              Visibility(
                visible: _isQuizVisible,
                // Container that designs the look of the holding area for the
                // quiz question, answers, and answer counter
                child: Container(
                  width: 1100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  // Column containing the question, answers, and counters
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Question(
                        Resources.questionList[_questionIndex],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Answer(
                        Resources.answerList[_answerIndex],
                        _answerSynthetist,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Answer(
                        Resources.answerList[_answerIndex + 1],
                        _answerIdealist,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Answer(
                        Resources.answerList[_answerIndex + 2],
                        _answerPragmatist,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Answer(
                        Resources.answerList[_answerIndex + 3],
                        _answerAnalyst,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Answer(
                        Resources.answerList[_answerIndex + 4],
                        _answerRealist,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // The question counter is housed here inside the Padding
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text(
                          '${(_questionIndex + 1).toString()}/${_questionsTotal.toString()}',
                          style: GoogleFonts.architectsDaughter(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // This controls the visibility of the end quiz section
              Visibility(
                visible: _endOfQuiz,
                child: Material(
                  color: Colors.transparent,
                  // This container uses a similar design as the quiz format
                  // container. It houses the end quiz outroduction and
                  // results button.
                  child: Container(
                    width: 1100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      // A column for the outroduction and view results button
                      children: [
                        Outroduction(),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 500,
                          height: 60,
                          // This button will take us to the next page
                          child: OutlinedButton(
                            onPressed: () {
                              // Call quiz end function
                              // The values here will be pushed to the results
                              // page
                              //_getResults();
                              print(quizResults);

                              //increment the counter on the database
                              DatabaseReference _testRef = FirebaseDatabase
                                  .instance
                                  .reference()
                                  .child("test");
                              _testRef.set(_displayText + 1);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        resultsPage(quizResults)),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              side: const BorderSide(color: Colors.pinkAccent),
                            ),
                            child: Text(
                              "Click To View Results",
                              style: GoogleFonts.architectsDaughter(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _Stream.cancel();
    super.deactivate();
  }
}
