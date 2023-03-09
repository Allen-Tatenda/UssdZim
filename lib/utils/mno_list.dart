import 'package:flutter/material.dart';

import '../pages/services.dart';
import 'get_services.dart';

class MNOList extends StatelessWidget {
  final String mno_name;
  final String mno_image;
  final String mno_id;


  const MNOList({
    Key? key,
    required this.mno_name, required this.mno_image, required this.mno_id,
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
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServicePage())
           );
           GetServices(mno_id);
        },

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:  [
                  Image(
                    image: AssetImage(mno_image),
                    //fit: ,
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 15,),
                  Text(
                    mno_name,
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
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
