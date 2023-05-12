import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathpuzzle2/main.dart';
import 'package:mathpuzzle2/winpage.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:neon/neon.dart';

class continuepage extends StatefulWidget {
  int level;

  continuepage(this.level);

  @override
  State<continuepage> createState() => _continuepageState();
}

class _continuepageState extends State<continuepage> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return WillPopScope(onWillPop: () {
     return backscreen();
    },
      child: Scaffold(
        body: SafeArea(
            child: Container(
              height: theight,
              width: twidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("photos/gameplaybackground.jpg"),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Container(
                    height: theight * 0.1,
                    width: twidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            mainpage.statuslist[widget.level] = "skip";
                            mainpage.prefs!
                                .setString("status${widget.level}", "skip");
                            setState(() {
                              widget.level++;
                            });
                            mainpage.prefs!.setInt("level", widget.level);
                            Get.off(() => continuepage(widget.level));
                          },
                          child: Container(
                            height: theight * 0.1,
                            width: twidth * 0.11,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('photos/skip.png'))),
                          ),
                        ),
                        Container(
                          height: theight * 0.07,
                          width: twidth * 0.55,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('photos/level_board.png'),
                                  fit: BoxFit.fill)),
                          child: Align(
                              child: Neon(
                                text: 'Puzzle ${widget.level + 1}',
                                color: Colors.blueGrey,
                                font: NeonFont.NightClub70s,
                                fontSize: theight * 0.045,
                              ),
                          ),
                        ),
                        Container(
                          height: theight * 0.1,
                          width: twidth * 0.11,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('photos/hint.png'))),
                          child: InkWell(onTap: () async {
                            return showDialog(builder: (context) {
                              return AlertDialog(
                                title: Center(child: Text('Hint'),),
                                content: Text(anslist[widget.level]),
                                actions: [
                                  TextButton(onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  }, child: Text('ok'))
                                ],
                              );
                            },context: context,);
                          }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: theight * 0.6,
                    width: twidth * 0.93,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "levelphotos/p${widget.level + 1}.png"),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: theight * 0.15,
                    width: twidth,
                    color: Colors.white.withOpacity(0.5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: theight * 0.08,
                              width: twidth * 0.62,
                              color: Colors.black45,
                              child: Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(" $a",
                                    style: TextStyle(
                                        fontSize: theight * 0.04,
                                        color: Colors.white)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (a.length > 0) {
                                    a = a.substring(0, a.length - 1);
                                  }
                                });
                              },
                              child: Container(
                                height: theight * 0.08,
                                width: twidth * 0.14,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('photos/delete.png'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (a == anslist[widget.level]) {
                                  String levelstatus =
                                  mainpage.statuslist[widget.level];
                                  if (levelstatus == "clear") {
                                    Get.off(() => winpage(widget.level));
                                  } else if (levelstatus == "skip") {
                                    mainpage.statuslist[widget.level] = "skip";
                                    mainpage.prefs!.setString(
                                        "status${widget.level}", "skip");

                                    Get.off(() => winpage(widget.level));
                                  } else {
                                    mainpage.statuslist[widget.level] = "clear";
                                    mainpage.prefs!.setString(
                                        "status${widget.level}", "clear");
                                    setState(() {
                                      widget.level++;
                                    });
                                    mainpage.prefs!.setInt("level", widget.level);
                                    Get.off(() => winpage(widget.level));
                                  }
                                } else {
                                  MotionToast.error(
                                      description: Text(
                                        "WRONG ANSWER",
                                        style: TextStyle(fontSize: 20),
                                      )).show(context);
                                }
                              },
                              child: Container(
                                height: theight * 0.08,
                                width: twidth * 0.24,
                                color: Colors.black54,
                                child: Center(
                                  child: Neon(
                                    text: 'SUBMIT',
                                    color: Colors.grey,
                                    font: NeonFont.TextMeOne,
                                    fontSize: theight * 0.029,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: theight * 0.07,
                          width: twidth,
                          child: GridView.builder(
                              itemCount: buttonnumber.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      a = a + buttonnumber[index];
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(
                                            color: Colors.red, width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                        child: Neon(
                                          text:  buttonnumber[index],
                                          color: Colors.blue,
                                          font: NeonFont.Beon,
                                          fontSize: theight * 0.04,
                                        ),
                                  ),
                                  ),
                                );
                              },
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 10, childAspectRatio: 0.7)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  String a = "";

  List buttonnumber = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ];
  List anslist = [
    "10",
    "25",
    "6",
    "14",
    "128",
    "7",
    "50",
    "1025",
    "100",
    "3",
    "212",
    "3011",
    "14",
    "16",
    "1",
    "2",
    "44",
    "45",
    "625",
    "1",
    "13",
    "47",
    "50",
    "34",
    "6",
    "41",
    "16",
    "126",
    "82",
    "14",
    "7",
    "132",
    "34",
    "48",
    "42",
    "288",
    "45",
    "4",
    "111",
    "47",
    "27",
    "87",
    "22",
    "253",
    "12",
    "38",
    "178",
    "1",
    "6",
    "10",
    "2",
    "20",
    "7",
    "511",
    "143547",
    "84",
    "11",
    "27",
    "3",
    "5",
    "39",
    "31",
    "10",
    "130",
    "22",
    "3",
    "14",
    "42",
    "164045",
    "11",
    "481",
    "86",
    "84",
    "13",
    "8"
  ];
  Future<bool> backscreen() async {


    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO_REVERSED,
      borderSide: const BorderSide(
        color: Colors.green,
        width: 2,
      ),
      width: 300,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Exit Main Page',
      desc: 'Are You Sure Main Page',
      showCloseIcon: true,
      btnCancelOnPress: () {

      },
      btnOkOnPress: () {
        Get.off(() => mainpage());
      },
    ).show();
    return Future.value(true);
  }
}
