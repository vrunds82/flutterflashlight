
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flashlight/flashlight.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';



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
                    child: Neumorphic(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.circle(),
                            depth: 01,intensity: 1,
                            lightSource: LightSource.topLeft,
                            shadowDarkColor: Colors.black,
                         shadowDarkColorEmboss: Colors.black,
                            color: Colors.white
                        ),
                        child:Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Icon(Icons.stop,color: Colors.black,size: 40,)
                        )
                    ),
                  ),

                  SizedBox(height: 25,),

                  GestureDetector(onTap: (){
                    startTimer();
                  },
                    child: Neumorphic(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.circle(),
                            depth: 1,intensity: 1,
                            lightSource: LightSource.topLeft,
                            color: Colors.black
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