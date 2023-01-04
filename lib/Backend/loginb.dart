import 'dart:convert';

import 'package:http/http.dart' as http;

class Loginb{

  Future login(String name, String ph)async{
    final data;
    http.Response response = await http.post(
      Uri.parse("http://10.0.2.2:60/login"),
    headers: <String, String>{
        "Content-Type":'application/json; charset=UTF-8'
    },
    body: jsonEncode({
     "name":name,
     "ph":ph
    })
    );
    if(response.statusCode==201){
      data = jsonDecode(response.body);
      return data;
    }
    else{
      return "An network error occurred";
    }
  }
}