import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Stateprovider with ChangeNotifier{
  Future<List<dynamic>> data()async{
    final response=await http.get('https://api.rootnet.in/covid19-in/unofficial/covid19india.org/statewise');
    final statedata=json.decode(response.body);
    final List<dynamic> abstactdata=statedata['data']['statewise'];
    return abstactdata;
  }
}