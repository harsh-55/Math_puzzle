import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mathpuzzle2/continuepage.dart';
import 'package:mathpuzzle2/puzzlespage.dart';
import 'package:mathpuzzle2/slash_screen.dart';
import 'package:neon/neon.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(GetMaterialApp(
    title: "Math Puzzle",
    home: splashscreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class mainpage extends StatefulWidget {
  static List<String> statuslist = [];

  static SharedPreferences? prefs;

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataget();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  dataget() async {
    mainpage.prefs = await SharedPreferences.getInstance();
    setState(() {
      level = mainpage.prefs!.getInt('level') ?? 0;
    });

    for (int i = 0; i < 75; i++) {
      String levelstatus = mainpage.prefs!.getString("status$i") ?? "pending";
      mainpage.statuslist.add(levelstatus);
      //  print(mainpage.statuslist);
    }
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return WillPopScope(child: Scaffold(
      body: Container(
        height: theight,
        width: twidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("photos/back.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(height: theight * 0.09),
            Container(
              child: Text("MATH PUZZLE",
                  style: TextStyle(
                      fontSize: theight * 0.045,
                      color: Colors.white.withOpacity(0.8),
                      fontFamily: 'f1',
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: theight * 0.015),
            Container(
              height: theight * 0.68,
              width: twidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("photos/blackboard_main_menu.png"),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    height: theight * 0.19,
                    width: twidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.off(() => continuepage(level!));
                          },
                          child: Neon(
                            text: 'CONTINUE',
                            color: Colors.grey,
                            font: NeonFont.Beon,
                            fontSize: theight * 0.05,
                            flickeringText: true,
                            flickeringLetters: [0, 1, 2, 3,4 ,5 ,6 ,7],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.off(() => puzzlespage());
                          },
                          child: Neon(
                            text: 'PUZZLES',
                            color: Colors.grey,
                            font: NeonFont.Beon,
                            fontSize: theight * 0.05,
                            flickeringText: true,
                            flickeringLetters: [0, 1, 2, 3,4 ,5 ,6],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Expanded(child: Container())
          ],
        ),
      ),
    ), onWillPop: () {
      return  showExitPopup(context);
    },);
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Container(
          height: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 65,
                  width: 65,
                  child: Lottie.asset("Animation/59204-sad-look.json",fit: BoxFit.fill),
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: Text(
                  "Do you want to leave?",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1.5,
              ),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: () {
                    print('Yes selected');
                    exit(0);
                  }, child: Text("Yes"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade800),
                  ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(child: ElevatedButton(onPressed: () {
                    print('Yes selected');

                    Navigator.of(context).pop();
                  },
                    child: Text('No', style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white),))
                ],
              )
            ],
          ),
        ),
      );
    },);
  }

  int? level;
}
