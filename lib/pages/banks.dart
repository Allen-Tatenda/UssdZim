import 'dart:convert';

import 'package:dating/utils/call.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/bank_list.dart';


class BanksPage extends StatefulWidget {
  const BanksPage({Key? key}) : super(key: key);

  @override
  State<BanksPage> createState() => _BanksPageState();
}

class _BanksPageState extends State<BanksPage> {

  List banks = [];

  Future<void> readJson() async{
    final String response = await rootBundle.loadString('lib/json/banks.json');
    final data = await json.decode(response);

    setState((){
      banks = data["banks"];
    });

  }

  @override
  void initState(){
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

      body: SafeArea(
        child: Column(
          children: [

            Container(
              decoration: const BoxDecoration(

              ),
              child:
              Column(
                children: [
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [

                      Text(
                        'Banks',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          fontFamily: "PlayFair",
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Popular',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Abel",
                              letterSpacing: 1.3
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap:(){
                            MakePhoneCall('*223#');
                        },

                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Image(
                                    image: AssetImage("lib/images/posb.png"),
                                    //fit: ,
                                    width: 60,
                                  ),
                                  SizedBox(height: 6,),
                                  Text(
                                    'POSB',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      fontFamily: "Abel",
                                        letterSpacing: 1.3
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        InkWell(
                          onTap:(){
                            MakePhoneCall('*230#');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Image(
                                    image: AssetImage("lib/images/cbz.png"),
                                    //fit: ,
                                    width: 60,
                                  ),
                                  SizedBox(height: 6,),
                                  Text(
                                    'Cbz',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      fontFamily: "Abel",
                                        letterSpacing: 1.3
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(

                decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(100),
                        bottomRight: Radius.elliptical(300, 400)
                    )
                ),
                padding: const EdgeInsets.all(10),

                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Select Bank',
                        style: TextStyle(
                            color: Colors.grey[100],
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          fontFamily: "PlayFair",
                        ),
                      ),
                    ),

                    Expanded(
                      child:ListView.builder(
                        itemCount: banks.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: BankList(
                              key: ValueKey(banks[index]["id"]),

                                bank_image: banks[index]["image"],
                                bank_name: banks[index]["name"],
                                ussd_code: banks[index]["ussd"],
                              ),
                          );

                        },

                    )

                    )
                  ],
                ),
              ),
            )

          ],
        ),

      ),
    );
  }
}
