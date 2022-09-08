import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

class SquareProgress extends StatefulWidget {
  const SquareProgress({Key? key}) : super(key: key);

  @override
  State<SquareProgress> createState() => _SquareProgressState();
}

class _SquareProgressState extends State<SquareProgress> {

  int value = 0;
  Timer ? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 50), (Timer t) {
      setState(() {
        value = (value + 1) % 100;
      });
    });
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.042,
              height: screenHeight * 0.042,
              child: SvgPicture.asset("assets/images/insta.svg",
                  color: Colors.grey),
            ),
            SizedBox(
              width:screenWidth*0.02,
            ),
            const Text("basic_flutter",style: TextStyle(color: Colors.grey),),
          ],
        ),
        centerTitle: true,
      ),

      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: screenWidth*0.45,
              height: screenWidth*0.45,
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius:const BorderRadius.all(Radius.circular(11)),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black87,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, -2), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.grey[800]!,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset:const Offset(0, 1), // changes position of shadow
                    ),
                  ]

              ),
            ),
            Container(
              width: screenWidth*0.4,
              height: screenWidth*0.4,
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius:const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black87,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.grey[800]!,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset:const Offset(0, -1), // changes position of shadow
                    ),
                  ]

              ),
            ),
            SquarePercentIndicator(
              width: screenWidth*0.43,
              height: screenWidth*0.43,
              // startAngle: StartAngle.bottomRight,
              reverse: true,
              borderRadius: 12,
              shadowWidth: 1.5,
              progressWidth: 10,
              shadowColor: Colors.transparent,
              progressColor: Colors.cyan,
              progress: value / 100,
              child: Center(
                  child: Text(
                    "$value %",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.cyan),
                  )),

            ),
          ],
        ),
      ),
    );
  }
}