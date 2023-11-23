import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muslim_app/data/model/RadiosModel.dart';
class ApiMAnager{
 static Future<List<Radios>?> getRadios() async{
    try{
      final url =Uri.http("mp3quran.net","/api/v3/radios");
      http.Response response =await http.get(url);
      RadiosModel radiosModel =RadiosModel.fromJson(jsonDecode(response.body));
      return radiosModel.radios;
    }catch(e){
      print(e);
    }
}
}