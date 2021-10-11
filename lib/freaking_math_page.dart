import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FreakingMathPage extends StatefulWidget {
  const FreakingMathPage({Key? key}) : super(key: key);

  @override
  _FreakingMathPageState createState() => _FreakingMathPageState();
}

class _FreakingMathPageState extends State<FreakingMathPage> {
  late var width;
  late var number1, number2 ;
  late var isTrue;
  late var indexCalculator;
  String result = "";
  var stringCalculator = "";
  Random random = Random();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    randomCalculator();
  }

  void randomCalculator(){
    // random number
    number1 = random.nextInt(10) + 1;
    number2 = random.nextInt(10) + 1;

    // random isTrue
    isTrue = random.nextBool();
    if (!isTrue){
      result = (random.nextInt(10) + 1).toString();
    }else{
      result = "0";
    }

    // random calculator
    // 0 -> +
    // 1 -> -
    // 2 -> *
    // 3 -> ~/
    indexCalculator = random.nextInt(4);

    switch(indexCalculator){
      case 0 :
        stringCalculator = "+";
        result = (number1 + number2 + int.parse(result)).toString();
        break;
      case 1 :
        stringCalculator = "-";
        result = (number1 - number2 + int.parse(result)).toString();
        break;
      case 2 :
        stringCalculator = "*";
        result = (number1 * number2 + int.parse(result)).toString();
        break;
      case 3 :
        stringCalculator = "/";
        result = (number1.toDouble() / number2.toDouble() + int.parse(result)).toStringAsFixed(1);
        break;
    }






  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.orange,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                    child: Text("0",
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
                        onPressed: () {},
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
                        onPressed: () {},
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
