import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_bruh/constants.dart';
import 'package:gym_bruh/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_bruh/screens/profile/profile.dart';

// void main() => runApp(const MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // if (USE_FIRESTORE_EMULATOR) {
  //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  // }
  runApp(const MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Gym Bruh';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        backgroundColor: CupertinoColors.systemYellow,
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), tooltip: 'Home', label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), tooltip: 'Profile', label: 'Home')
          ],
          backgroundColor: CupertinoColors.white,
        ),
        tabBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return CupertinoPageScaffold(
              child: Home(),
              backgroundColor: CupertinoColors.white,
              navigationBar: const CupertinoNavigationBar(
                middle: Text(
                  'Gym Bruh',
                  style: TextStyle(color: primaryTextColor, fontSize: 24),
                ),
                backgroundColor: primaryBgColor,
              ),
            );
          } else {
            return CupertinoPageScaffold(
              child: Profile(),
              backgroundColor: CupertinoColors.white,
              navigationBar: const CupertinoNavigationBar(
                middle: Text(
                  'Gym Bruh\'s Profile',
                  style: TextStyle(color: primaryTextColor, fontSize: 24),
                ),
                backgroundColor: primaryBgColor,
              ),
            );
          }
        },
        // child: Home(),
      ),
    );
  }
}
