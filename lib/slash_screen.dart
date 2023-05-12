

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neon/neon.dart';

import 'main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Get.off(() => mainpage());
    });
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: BlurryContainer(
          blur: 3,
          width: twidth,
          height: theight,
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(height: theight * 0.1),
              Container(
                height: theight * 0.15,
                width: twidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(),
                      child: Neon(
                        text: 'MATH',
                        color: Colors.red,
                        font: NeonFont.Beon,
                        fontSize: theight * 0.05,
                        flickeringText: true,
                        flickeringLetters: [0, 1, 2, 3,4],
                      ),
                    ),
                    DefaultTextStyle(
                      style: TextStyle(),
                      child: Neon(
                        text: 'PUZZLES',
                        color: Colors.red,
                        font: NeonFont.Beon,
                        fontSize: theight * 0.05,
                        flickeringText: true,
                        flickeringLetters: [0, 1, 2, 3,4, 5,6],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: theight * 0.02),
              Container(
                height: theight * 0.3,
                width: twidth * 0.6,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("photos/1-removebg-preview (2).png"),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Expanded(child: Container()),
              Container(
                  height: theight * 0.2,
                  width: twidth * 0.5,
                  child: Lottie.asset("Animation/98431-loading-animation.json",fit: BoxFit.fill)),
              SizedBox(height: theight * 0.00),
              Container(
                  height: theight * 0.05,
                  width: twidth,
                  child: Lottie.asset("Animation/99740-line-loading.json",fit: BoxFit.fill))
            ],
          ),
        ),
      ),
    );
  }
}
