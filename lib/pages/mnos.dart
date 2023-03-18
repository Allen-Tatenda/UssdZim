import 'dart:convert';

import 'package:dating/pages/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/get_services.dart';
import '../utils/mno_list.dart';


class MnosPage extends StatefulWidget {
  const  MnosPage({Key? key}) : super(key: key);

  @override
  State< MnosPage> createState() => _MnosPageState();
}

class _MnosPageState extends State< MnosPage> {

  List mnos = [];

  Future<void> readMnos() async{
    final String response = await rootBundle.loadString('lib/json/mno.json');
    final data = await json.decode(response);

    setState((){
      mnos = data["mnos"];
    });

  }

  @override
  void initState(){
    super.initState();
    readMnos();
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
                        'MNOs',
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

                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ServicePage())
                            );
                            GetServices('econet');
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
                                    image: AssetImage("lib/images/econet.png"),
                                    //fit: ,
                                    width: 70,
                                  ),
                                  SizedBox(height: 6,),
                                  Text(
                                    'Econet',
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
                        'Select MNO',
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
                          itemCount: mnos.length,
                            itemBuilder: (context,index) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: MNOList(
                                    key: ValueKey(mnos[index]["id"]),
                                    mno_name: (mnos[index]["name"]),
                                    mno_image: (mnos[index]["image"]),
                                    mno_id:(mnos[index]["id"]) ,
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
