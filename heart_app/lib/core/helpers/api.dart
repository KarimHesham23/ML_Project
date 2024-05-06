import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> post({
    required String url,
    @required dynamic body,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            "there is a problem,this is status code ${response.statusCode} and this is body ${jsonDecode(response.body)}");
      }
    } on SocketException {
      throw Exception("No internet connection");
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }
}
