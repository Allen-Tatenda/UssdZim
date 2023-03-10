import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';


class MySplashScreen extends StatefulWidget
{
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
{

  startTimer()
  {
    Timer(const Duration(seconds: 3), () async
    {

        Navigator.push(context, MaterialPageRoute(builder: (c)=> Navigation()));
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context)
  {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("lib/images/ussd.png"),

              const SizedBox(height: 10,),

              const Text(
                "UssdZim",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  fontFamily: "PlayFair",
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
