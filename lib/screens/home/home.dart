import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_bruh/constants.dart';
import 'package:gym_bruh/screens/exercises/exercises.dart';
import 'package:gym_bruh/screens/home/home-logic.dart';
import 'package:gym_bruh/screens/proglog/proglog.dart';

/// This is the stateful widget that the main application instantiates.
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Home extends State<Home> {
  // HomeLogic object
  HomeLogic homeLogic = new HomeLogic();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: ListView(
        children: <Widget>[
          // Day Heading
          Text(
            homeLogic.getDayOfWeek(),
            style: TextStyle(
                fontSize: 48, color: blackColor, fontWeight: FontWeight.bold),
          ),
          // Day of Gym
          Text(
            homeLogic.getGymDay(),
            style: TextStyle(
                fontSize: 18, color: LblackColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          // for (var category in home_categories)
          for (int i = 0; i < home_categories.length; i++)
            GestureDetector(
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: [
                    Image.network(
                      home_categories[i]['bg_img'],
                      fit: BoxFit.fill,
                    ),
                    Container(
                      margin: EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            home_categories[i]['title'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => homeLogic.getComponent(i)));
              },
            )
        ],
      ),
    );
  }

  // Route routeNext(type) {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         homeLogic.getComponent(type),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return child;
  //     },
  //   );
  // }
}
