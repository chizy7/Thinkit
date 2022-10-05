import 'dart:js';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:thinkit/Components/navbar.dart';
import 'package:thinkit/Pages/question_implementation.dart';
import "package:thinkit/Pages/introPage.dart";

class HomeIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width),
          );
        } else {
          return Column(children: pageMobile(constraints.biggest.width));
        }
      },
    );
  }

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
          padding: const EdgeInsets.all(50.0),
          // color: Colors.amber,
          width: width,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/thinkit_logo.png',
                        // height: 200,
                        width: 500,
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      // color: Colors.red,
                      child: const AutoSizeText(
                        "Test The Way You Think!",
                        style: TextStyle(
                            fontFamily: 'Aleo',
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      // color: Colors.blue,
                      child: const AutoSizeText(
                        "How does your brain work at solving problems?",
                        style: TextStyle(
                            fontFamily: 'Aleo',
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Colors.black),
                        // maxLines: 3,
                      ),
                    ),
                    Container(
                      // color: Colors.green,
                      child: const AutoSizeText(
                        "Take our quiz to find out.",
                        style: TextStyle(
                            fontFamily: 'Aleo',
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Colors.black),
                        // maxLines: 3,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      // color: Colors.orange,
                      // alignment: Alignment.topLeft,
                      // decoration: BoxDecoration(color: Colors.green),
                      // padding: const EdgeInsets.all(15.0),
                      child: Builder(builder: (context) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IntroPage()),
                            );
                          },
                          child: Image.asset(
                            'assets/images/startbutton.png',
                            width: 300.0,
                            height: 210.75,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  // margin: const EdgeInsets.all(50.0),
                  // color: Colors.white,
                  child: Lottie.network(
                    'https://assets8.lottiefiles.com/packages/lf20_uio5iafn.json',
                  ),
                ),
              )
              // Container(
              //     child: GestureDetector(
              //   onTap: () {}, // Image tapped
              //   child: Image.asset(
              //     'assets/startbutton.png',
              //     width: 250,
              //     height: 140.5,
              //   ),
              // )),
            ],
          )),
    ];
  }
}

List<Widget> pageMobile(double width) {
  return <Widget>[
    Container(
        padding: const EdgeInsets.all(50.0),
        // color: Colors.amber,
        width: width,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/thinkit_logo.png',
                      // height: 200,
                      width: 250,
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    // color: Colors.red,
                    child: const AutoSizeText(
                      "Test The Way You Think!",
                      style: TextStyle(
                          fontFamily: 'Aleo',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    child: const AutoSizeText(
                      "How does your brain work at solving problems?",
                      style: TextStyle(
                          fontFamily: 'Aleo',
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.black),
                      // maxLines: 3,
                    ),
                  ),
                  Container(
                    // color: Colors.green,
                    child: const AutoSizeText(
                      "Take our quiz to find out.",
                      style: TextStyle(
                          fontFamily: 'Aleo',
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.black),
                      // maxLines: 3,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    // color: Colors.orange,
                    // alignment: Alignment.topLeft,
                    // decoration: BoxDecoration(color: Colors.green),
                    // padding: const EdgeInsets.all(15.0),
                    child: Builder(builder: (context) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuestionImplementation()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/startbutton.png',
                          width: 150.0,
                          height: 100.75,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Container(
            //     // margin: const EdgeInsets.all(50.0),
            //     // color: Colors.white,
            //     child: Lottie.network(
            //       'https://assets8.lottiefiles.com/packages/lf20_uio5iafn.json',
            //     ),
            //   ),
            // )
            // Container(
            //     child: GestureDetector(
            //   onTap: () {}, // Image tapped
            //   child: Image.asset(
            //     'assets/startbutton.png',
            //     width: 250,
            //     height: 140.5,
            //   ),
            // )),
          ],
        )),
  ];
}
