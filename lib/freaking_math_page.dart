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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                    Text("2+2",
                        style: TextStyle(
                            color: Colors.white, fontSize: width / 5)),
                    Text("=4",
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
