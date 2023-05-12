import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mathpuzzle2/continuepage.dart';
import 'package:mathpuzzle2/main.dart';
import 'package:neon/neon.dart';

class winpage extends StatefulWidget {
  int level;

  winpage(this.level);

  @override
  State<winpage> createState() => _winpageState();
}

class _winpageState extends State<winpage> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: theight,
        width: twidth,
        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('photos/back.jpg'), fit: BoxFit.fill)),
        child: Column(
      children: [
        SizedBox(height: theight * 0.14,),
        Container(
            height: theight * .12,
            width: twidth,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Neon(
                text: 'PUZZLE ${widget.level} COMPLETED',
                color: Colors.grey,
                font: NeonFont.NightClub70s,
                fontSize: theight * 0.035,
              ),
            )
        ),
        Container(
          height: theight * 0.36,
          width: twidth,
         child: Lottie.asset("Animation/67230-trophy-winner.json",fit: BoxFit.cover),
        ),
        SizedBox(height: theight * 0.02,),
        Container(
          height: theight * 0.17,
          width: twidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Get.off(() => continuepage(widget.level));
                },
                child: Container(
                  height: theight * 0.065,
                  width: twidth * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 3)),
                  child: Center(
                      child: Text('CONTINUE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: theight * 0.035,
                              fontStyle: FontStyle.italic))),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.off(() => mainpage());
                },
                child: Container(
                  height: theight * 0.065,
                  width: twidth * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 3)),
                  child: Center(
                      child: Text('MAIN MENU',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: theight * 0.035,
                              fontStyle: FontStyle.italic))),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: SizedBox()),
      ],
        ),
      ),
    );
  }
}
