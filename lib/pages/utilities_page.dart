import 'dart:convert';

import 'package:dating/utils/call.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/bank_list.dart';


class UtilitiesPage extends StatefulWidget {
  const UtilitiesPage({Key? key}) : super(key: key);

  @override
  State<UtilitiesPage> createState() => _UtilitiesPageState();
}

class _UtilitiesPageState extends State<UtilitiesPage> {

  List banks = [];

  Future<void> readJson() async{
    final String response = await rootBundle.loadString('lib/json/services.json');
    final data = await json.decode(response);

    setState((){
      banks = data["utilities"];
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
                        'More',
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
                            MakePhoneCall('*569#');
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
                                    image: AssetImage("lib/images/innbucks2.png"),
                                    //fit: ,
                                    width: 60,
                                  ),
                                  SizedBox(height: 6,),
                                  Text(
                                    'Innbucks',
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
                            MakePhoneCall('*192#');
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
                                    image: AssetImage("lib/images/cityparking.png"),
                                    //fit: ,
                                    width: 60,
                                  ),
                                  SizedBox(height: 6,),
                                  Text(
                                    'City Parking',
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
                        'Select Utility',
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
