import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thinkit/Pages/HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(thinkit());
}

class thinkit extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Think It!',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Error");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage(
              title: 'Flutter Demo',
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
