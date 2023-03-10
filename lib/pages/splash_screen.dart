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
        decoration: BoxDecoration(
          color: Colors.black87
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:   [




              SizedBox(height: 20,),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            topLeft:Radius.circular(100),
                            bottomRight: Radius.elliptical(300, 400)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                            image: AssetImage("lib/images/ussd.png"),
                            width: 100,
                            height: 100,
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "UssdZim",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                fontFamily: "PlayFair",
                                letterSpacing: 7,
                                  foreground: Paint()..shader = LinearGradient(
                                      colors: <Color>[
                                        Colors.orange,
                                        Colors.blue,
                                        Colors.red
                                      ]
                                  ).createShader(Rect.fromLTWH(600, 200, 400, 200))
                              ),
                            ),
                            Text(
                              "All USSD codes in one App!",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "PlayFair",
                                letterSpacing: 1,
                                  foreground: Paint()..shader = LinearGradient(
                                      colors: <Color>[
                                        Colors.orange,
                                        Colors.green,
                                        Colors.red
                                      ]
                                  ).createShader(Rect.fromLTWH(170, 190, 100, 200))
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
