import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:thinkit/navbar/navbar.dart';

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
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                "Test The Way You Think!",
                style: TextStyle(
                    fontFamily: 'Aleo',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.black),
              ),
            ),
            Container(
              child: const Text(
                "How does your brain work at solving problems?",
                style: TextStyle(
                    // fontFamily: 'Aleo',
                    // fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.black),
              ),
            ),
            Container(
              child: const Text(
                "Take our quiz to find out.",
                style: TextStyle(
                    // fontFamily: 'Aleo',
                    // fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              // decoration: BoxDecoration(color: Colors.green),
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/startbutton.png',
                  width: 375,
                  height: 210.75,
                ),
              ),
            ),
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
        ),
      ),
    ];
  }
}
