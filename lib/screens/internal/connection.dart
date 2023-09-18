import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Connection {
  String config_host = "http://192.168.1.2:1337";
  @override
  Future<Object> fetchCourse() async {

    var response = await http.get(Uri.parse(config_host+"/api/courses?populate=video"));
    // Await the http get response, then decode the json-formatted response.

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['meta']['pagination']['page'];
      return jsonResponse;
    }
    return response.statusCode.toString();
  }
   @override
  Future<Object> fetchVideo(String url) async {

    var response = await http.get(Uri.parse(config_host+url));
    // Await the http get response, then decode the json-formatted response.

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['meta']['pagination']['page'];
      return jsonResponse;
    }
    return response.statusCode.toString();
  }
}