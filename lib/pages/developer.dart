import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/call.dart';



class DeveloperPage extends StatefulWidget {
  const  DeveloperPage({Key? key}) : super(key: key);

  @override
  State< DeveloperPage> createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State< DeveloperPage> {

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
                        'Njiva Allen T',
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
                          'Developer',
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
                        Container(
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
                                  image: AssetImage("lib/images/yt.png"),
                                  //fit: ,
                                  width: 70,
                                ),
                                SizedBox(height: 6,),
                                Text(
                                  'whyteeonit',
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
                        'Socials/Contacts',
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "PlayFair",
                        ),
                      ),
                    ),

                    Expanded(
                        child:ListView(
                          children: [
                            InkWell(
                              onTap: (){
                                MakePhoneCall('+263772504909');
                              },
                              child: Container(
                        decoration: BoxDecoration(
                        color: Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Row(
                                children:  const [
                                  Icon(
                                      Icons.phone,
                                    size: 40,
                                    color: Colors.white,
                                  ),

                                  SizedBox(width: 15,),
                                  Text(
                                    "+263 772 504 909",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: "Abel",
                                      letterSpacing: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.dialpad,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                    ),
                            ),
                            const SizedBox(height: 18,),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children:  const [
                                        Icon(
                                          Icons.alternate_email,
                                          size: 40,
                                          color: Colors.white,
                                        ),

                                        SizedBox(width: 15,),
                                        Text(
                                          "anjiva7@gmail.com",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: "Abel",
                                            letterSpacing: 1.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 18,),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children:  const [
                                        Icon(
                                          Icons.facebook,
                                          size: 40,
                                          color: Colors.white,
                                        ),

                                        SizedBox(width: 15,),
                                        Text(
                                          "Allen Tatenda Young Tee",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: "Abel",
                                            letterSpacing: 1.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
