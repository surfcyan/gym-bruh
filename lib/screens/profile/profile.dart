import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_bruh/screens/profile/profile-logic.dart';

/// This is the stateful widget that the main application instantiates.
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Profile extends State<Profile> {
  // ProfileLogic object
  ProfileLogic _ProfileLogic = new ProfileLogic();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    run();
  }

  run() async {
    await _ProfileLogic.connectHealth();
    await _ProfileLogic.fetchSteps();
    await _ProfileLogic.fetchDistance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Center(
            child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(300),
          //   color: Colors.white,
          //   boxShadow: [
          //     BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 24),
          //   ],
          // ),
          child: Icon(
            Icons.person,
            size: 180,
          ),
        )),
        TextWidget('Kartik Gautam'),
        TextWidget('171 cm'),
        TextWidget('71 Kg'),
        ElevatedButton(
          onPressed: () {
            _ProfileLogic.connectHealth();
          },
          child: Text('Connect Health'),
        ),
        TextWidget(_ProfileLogic.steps.toString()),
        TextWidget((_ProfileLogic.steps! * 0.03829).toString()),
        TextWidget(_ProfileLogic.distance.toString()),
      ],
    );
  }

  Widget TextWidget(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black),
      textAlign: TextAlign.left,
    );
  }

  // Route routeNext(type) {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         ProfileLogic.getComponent(type),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return child;
  //     },
  //   );
  // }
}
