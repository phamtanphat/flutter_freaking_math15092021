
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';

import 'package:flutter/services.dart';

class FreakingMathPage extends StatefulWidget {
  const FreakingMathPage({Key? key}) : super(key: key);

  @override
  _FreakingMathPageState createState() => _FreakingMathPageState();
}

class _FreakingMathPageState extends State<FreakingMathPage> {
  late var width;
  late var number1, number2, score = 0;
  late var isTrue;
  late var indexCalculator;
  String result = "";
  var stringCalculator = "";
  Random random = Random();
  late Color color;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    randomCalculator();
  }

  void randomCalculator() {
    // random number
    number1 = random.nextInt(10) + 1;
    number2 = random.nextInt(10) + 1;

    // random isTrue
    isTrue = random.nextBool();
    if (!isTrue) {
      result = (random.nextInt(10) + 1).toString();
    } else {
      result = "0";
    }
    // random color
    color = Color.fromARGB(255, random.nextInt(240) + 1,
        random.nextInt(240) + 1, random.nextInt(240) + 1);

    // random calculator
    // 0 -> +
    // 1 -> -
    // 2 -> *
    // 3 -> ~/
    indexCalculator = random.nextInt(4);

    switch (indexCalculator) {
      case 0:
        stringCalculator = "+";
        result = (number1 + number2 + int.parse(result)).toString();
        break;
      case 1:
        stringCalculator = "-";
        result = (number1 - number2 + int.parse(result)).toString();
        break;
      case 2:
        stringCalculator = "*";
        result = (number1 * number2 + int.parse(result)).toString();
        break;
      case 3:
        stringCalculator = "/";
        result = (number1.toDouble() / number2.toDouble() + int.parse(result))
            .toStringAsFixed(1);
        break;
    }
  }

  void openDialog() {
    showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: Text("Bạn đã thua với $score điểm"),
            content: Text("Bạn muốn chơi lại không ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                    setState(() {
                      score = 0;
                      randomCalculator();
                    });
                  },
                  child: Text("Có")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                    if(Platform.isAndroid){
                      SystemNavigator.pop();
                    }else{
                      exit(0);
                    }
                  },
                  child: Text("Không"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: color,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                    child: Text("$score",
                        style: TextStyle(
                            color: Colors.white, fontSize: width / 15)),
                    alignment: Alignment.topRight),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$number1 $stringCalculator $number2",
                        style: TextStyle(
                            color: Colors.white, fontSize: width / 5)),
                    Text("=$result",
                        style: TextStyle(
                            color: Colors.white, fontSize: width / 5)),
                  ],
                )),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width / 2.5,
                      height: width / 2.5,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey[200];
                          }
                          return Colors.white;
                        })),
                        onPressed: () {
                          if (isTrue) {
                            setState(() {
                              score++;
                              randomCalculator();
                            });
                          } else {
                            openDialog();
                          }
                        },
                        child: Image.asset("assets/images/ic_true.png"),
                      ),
                    ),
                    Container(
                      width: width / 2.5,
                      height: width / 2.5,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey[200];
                          }
                          return Colors.white;
                        })),
                        onPressed: () {
                          if (!isTrue) {
                            setState(() {
                              score++;
                              randomCalculator();
                            });
                          } else {
                            openDialog();
                          }
                        },
                        child: Image.asset("assets/images/ic_false.png"),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
