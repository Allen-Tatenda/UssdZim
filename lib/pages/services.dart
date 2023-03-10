import 'package:flutter/material.dart';
import '../utils/bank_list.dart';
import '../utils/get_services.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

  List service = selectedServices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,

      body: SafeArea(
        child: Column(
          children: [

            Container(
             
              child:
              Column(
                children: [
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:   [

                      Text(
                        serviceProvider.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: "PlayFair",
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
SizedBox(height: 10,),
            Expanded(
              child: Container(

                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(100),
                        bottomRight: Radius.elliptical(300, 400)
                    )
                ),
                padding: EdgeInsets.all(10),

                child:Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Select Service',
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
                          itemCount: selectedServices.length,
                            itemBuilder: (context, index){

                             return Padding(
                               padding: const EdgeInsets.all(3.0),
                               child: BankList(
                                  bank_name: selectedServices[index]["name"],
                                  bank_image: selectedServices[index]["image"],
                                  ussd_code: selectedServices[index]["ussd"],
                                ),
                             );
                            }
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
