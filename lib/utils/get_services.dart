
import 'dart:convert';

import 'package:flutter/services.dart';

List selectedServices = [];
String serviceProvider = '';
GetServices(provider){

  List services = [];

  Future<List> readServices() async{
    final String response = await rootBundle.loadString('lib/json/services.json');
    final data = await json.decode(response);

      services = data[provider];
      selectedServices = services;
      serviceProvider = provider;
    return services;
  }
  return readServices();

}