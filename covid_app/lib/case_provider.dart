import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CaseProvider with ChangeNotifier
{
   Map<String,Object> _data={
    'totalcases':0,
    'totaldeaths':0,
    'activecases':0,
    'recovered':0,
     'todaycases':0,
     'todaydeaths':0,
     'todayrecover':0,
  };
   Map<String,Object> get getdata{
   return _data;
}
  Future<void> fetchCountryData() async{
    final response= await http.get('https://corona.lmao.ninja/v3/covid-19/countries');
    final List<dynamic> extractedData = json.decode(response.body);
    final Map<String, Object> countryData = extractedData.firstWhere((element) => element['country'] == 'India');
    _data['totalcases']=countryData['cases'];
    _data['totaldeaths']=countryData['deaths'];
    _data['activecases']=countryData['active'];
    _data['recovered']=countryData['recovered'];
    _data['todaycases']=countryData['todayCases'];
    _data['todaydeaths']=countryData['todayDeaths'];
    _data['todayrecover']=countryData['todayRecovered'];


    notifyListeners();
    return;
  //  setState(() {
   //  countryData=json.decode(response.body);
   //});
  }

}