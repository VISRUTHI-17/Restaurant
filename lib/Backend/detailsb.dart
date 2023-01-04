import 'dart:convert';

import 'package:http/http.dart' as http;

class Details {
  Future makeGetRequest(String restName) async {
    print(restName);
    final url2 = Uri.parse("http://10.0.2.2:60/restaurant/details/$restName");
    http.Response response = await http.get(url2);
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    print('Body: ${response.body}');
    List ResDetail  = [];
    List resbody = jsonDecode(response.body);
    int? len = resbody.length;
    if (response.statusCode == 200) {
      for (int i = 0; i < len; i++) {
        ResDetail.add(resbody[i]);
      }
      return ResDetail;
    }
    else {
      print("Unable to retrieve data");
      return null;
    }
  }
}