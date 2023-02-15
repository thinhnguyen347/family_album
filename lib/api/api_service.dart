import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:home_album/models/phone_details.dart';
import 'package:home_album/models/photo_details.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseURL = "https://family-album-svr.onrender.com";

  Future<List<PhoneDetails>> getPhoneNumber() async {
    var url = Uri.parse("https://family-album-svr.onrender.com/phone");
    http.Response response;
    List<PhoneDetails> phoneList = [];

    try {
      response = await http.get(url);
    } catch (e) {
      throw Exception('Error: $e');
    }

    if (response.statusCode == 200) {

      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var data = jsonResponse['results'];

      if (kDebugMode) {
        print(response.body.toString());
      }

      for (int i = 0; i < data.length; i++) {
        PhoneDetails phoneItem =
            PhoneDetails.fromJson(jsonResponse['results'][i]);
        phoneList.add(phoneItem);
      }


    }



    return phoneList;
  }

  Future<List<PhotoDetails>> getAlbum(String target) async {
    http.Response response;
    List<PhotoDetails> photoList = [];

    try {
      response = await http.get(Uri.parse("$baseURL/$target"));
    } catch (e) {
      throw Exception('Error: $e');
    }

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      for (int i = 0; i < jsonResponse['results'].length; i++) {
        PhotoDetails photoItem =
            PhotoDetails.fromJson(jsonResponse['results'][i]);
        photoList.add(photoItem);
      }
    }

    return photoList;
  }
}
