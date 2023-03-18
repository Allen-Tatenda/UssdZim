import 'package:flutter/foundation.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

 MakePhoneCall(phone) async {

bool _hasCallSupport = false;


@override
void initState() {

  // Check for phone call support.
  canLaunchUrl(Uri(scheme: 'tel', path: phone)).then((bool result) {

      _hasCallSupport = result;
    });
}

  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phone,
  );

   bool? res = await FlutterPhoneDirectCaller.callNumber(phone);

   if(res == true){
      await FlutterPhoneDirectCaller.callNumber(phone);
   }
   else{
    await launchUrl(launchUri);
   }
}
