import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathpuzzle2/main.dart';
import 'package:mathpuzzle2/continuepage.dart';
import 'package:neon/neon.dart';

class puzzlespage extends StatefulWidget {
  const puzzlespage({Key? key}) : super(key: key);

  @override
  State<puzzlespage> createState() => _puzzlespageState();
}

class _puzzlespageState extends State<puzzlespage> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      child: Scaffold(
        body: Container(
          height: theight,
          width: twidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("photos/back.jpg"), fit: BoxFit.fill)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: theight * 0.07,
                    width: twidth * 0.15,
                    child: Align(
                      alignment: Alignment.center,
                      child: IconButton(
                          onPressed: () {
                            Get.off(() => mainpage());
                          },
                          icon: Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white,
                            size: theight * 0.043,
                          ),
                          iconSize: 35),
                    ),
                  ),
                  Container(
                    height: theight * 0.07,
                    width: twidth * 0.7,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Neon(
                        text: 'SELECT PUZZLE',
                        color: Colors.red,
                        font: NeonFont.NightClub70s,
                        fontSize: theight * 0.04,
                        flickeringText: true,
                        flickeringLetters: [
                          0,
                          1,
                          2,
                          3,
                          4,
                          5,
                          7,
                          8,
                          9,
                          10,
                          11,
                          12
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
              Container(
                height: theight * 0.93,
                width: twidth * 0.93,
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: levelnumber.length,
                    itemBuilder: (context, index) {
                      String st = mainpage.statuslist[index];
                      int level = mainpage.prefs!.getInt("level") ?? 0;
                      if (st == "clear") {
                        return InkWell(
                          onTap: () {
                            Get.off(() => continuepage(index));
                          },
                          child: Container(
                            margin: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    width: 2,
                                    color: Colors.grey.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(13),
                                image: DecorationImage(
                                    image: AssetImage("photos/tick.png"))),
                            child: Center(
                              child: Neon(
                                text: levelnumber[index],
                                color: Colors.grey,
                                font: NeonFont.NightClub70s,
                                fontSize: theight * 0.04,
                              ),
                            ),
                          ),
                        );
                      } else if (st == "skip") {
                        return InkWell(
                          onTap: () {
                            Get.off(() => continuepage(index));
                          },
                          child: Container(
                            margin: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 2,
                                  color: Colors.grey.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Center(
                              child: Neon(
                                text: levelnumber[index],
                                color: Colors.grey,
                                font: NeonFont.NightClub70s,
                                fontSize: theight * 0.04,
                              ),
                            ),
                          ),
                        );
                      } else {
                        if (index == level) {
                          return InkWell(
                            onTap: () {
                              Get.off(() => continuepage(index));
                            },
                            child: Container(
                              margin: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    width: 2,
                                    color: Colors.grey.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Center(
                                child: Neon(
                                  text: levelnumber[index],
                                  color: Colors.grey,
                                  font: NeonFont.NightClub70s,
                                  fontSize: theight * 0.04,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: DecorationImage(
                                    image: AssetImage("photos/lock.png"))),
                          );
                        }
                      }
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4)),
              )
            ],
          ),
        ),
      ),
      onWillPop: () {
        return showExitPopup(context);
      },
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Use back button!! (<-)",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 28,),
                Row(
                  children: [
                    SizedBox(width: 80,),
                    ElevatedButton(
                      onPressed: () {
                        print('Yes selected');
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red.shade800),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  List levelnumber = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60',
    '61',
    '62',
    '63',
    '64',
    '65',
    '66',
    '67',
    '68',
    '69',
    '70',
    '71',
    '72',
    '73',
    '74',
    '75'
  ];
}
