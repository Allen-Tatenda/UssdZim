import 'package:dating/utils/call.dart';
import 'package:flutter/material.dart';

class BankList extends StatelessWidget {
  final String bank_name;
  final String bank_image;
  final String ussd_code;
  const BankList({
    Key? key,
    required this.bank_name, required this.bank_image, required this.ussd_code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(

        onTap: (){
         MakePhoneCall(ussd_code);
        },

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:  [
                  Image(
                    image: AssetImage(bank_image),
                    //fit: ,
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 15,),
                  Text(
                    bank_name,
                    style: const TextStyle(
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
    );
  }
}
