import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<dynamic> get(String url) async {

    http.Response response =
    await http.get(Uri.parse(url));

    if(response.statusCode ==200){
      return jsonDecode(response.body);
    }
    else {
      throw Exception('there is a problem with status code ${response.statusCode}');
    }
  }


  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      if (token != null) 'Authorization': token, // Optional token
    };

    // Ensure the body is encoded as a JSON string
    String jsonBody = jsonEncode(body);

    http.Response response = await http.post(
      Uri.parse("https://student.valuxapps.com/api/$url"),
      body: jsonBody, // Send the JSON-encoded body
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode}, and with body: ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put ({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async{
    Map<String,String> headers={};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if(token!=null) headers.addAll({'Authorization':'Bearer $token'});
    print('url $url, body $body, token $token and headers $headers');
    http.Response response =
    await http.put(Uri.parse(url),
        body: body,
        headers:headers
        );
    if(response.statusCode==200){
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    }
    else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}, and with body: ${jsonDecode(response.body)}');

    }
  }
}