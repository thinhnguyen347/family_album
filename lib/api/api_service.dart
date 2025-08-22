import 'dart:convert';
import 'dart:core';

import 'package:home_album/models/phone_details.dart';
import 'package:home_album/models/photo_details.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseURL = "https://family-album-svr-j8pz.onrender.com";

  Future<List<PhoneDetails>> getPhoneNumber() async {
    var url = Uri.parse('$baseURL/phone');
    http.Response response;
    List<PhoneDetails> phoneList = [];

    try {
      response = await http.get(url);
    } catch (e) {
      throw Exception('Error: $e');
    }

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse =
          jsonDecode(response.body) as List<dynamic>;

      for (int i = 0; i < jsonResponse.length; i++) {
        PhoneDetails phoneItem =
            PhoneDetails.fromJson(jsonResponse[i]);
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
      var jsonResponse = jsonDecode(response.body) as List<dynamic>;

      for (int i = 0; i < jsonResponse.length; i++) {
        PhotoDetails photoItem =
            PhotoDetails.fromJson(jsonResponse[i]);
        photoList.add(photoItem);
      }
    }

    return photoList;
  }
}
