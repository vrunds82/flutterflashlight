
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flashlight/flashlight.dart';




class MyApplight extends StatefulWidget {
  @override
  _MyApplightState createState() => _MyApplightState();
}

class _MyApplightState extends State<MyApplight> {
  bool _hasFlashlight = false;
  Timer timer;

  @override
  initState() {
    super.initState();
    initFlashlight();
    startTimer();
  }

  initFlashlight() async {

    print("Device has flash ? $_hasFlashlight");


    if(_hasFlashlight){
      _hasFlashlight=false;
      Flashlight.lightOff();

    }else{
      _hasFlashlight=true;
      Flashlight.lightOn();

    }


    setState(() {

    });
  }

  void startTimer() {
    // Start the periodic timer which prints something every 1 seconds
    timer=  new Timer.periodic(new Duration(milliseconds: 100), (time) {
      initFlashlight();
      setState(() {

      });
    });
  }

  var  buttonclr = Colors.blue;
  var  offclr = Color(0xff97BC62FF);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: ExactAssetImage('assets/images/bg.jpg'),
                fit: BoxFit.fitHeight,
              ),),
          child: Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  GestureDetector(onTap: (){

                    timer.cancel();
                    Flashlight.lightOff();

                  },
                    child: Card(
                        color: Colors.black,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50),
                              bottomLeft:Radius.circular(50),
                              topLeft: Radius.circular(50)),
                        ),
                        child:Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Icon(Icons.stop,color: Colors.white,size: 40,)
                        )
                    ),
                  ),

                  SizedBox(height: 25,),

                  GestureDetector(onTap: (){
                    startTimer();
                  },
                    child: Card(color: Colors.black,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                topRight: Radius.circular(50),
                            bottomLeft:Radius.circular(50),
                            topLeft: Radius.circular(50)),
                            ),
                        child:Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Icon(Icons.highlight,size: 40,color: Colors.white,)
                        )
                    ),
                  ),
                  SizedBox(height: 20,),

                ],
              )),
        ),
      ),
    );
  }
}