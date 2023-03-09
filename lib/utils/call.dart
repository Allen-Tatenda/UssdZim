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
  await launchUrl(launchUri);
}
