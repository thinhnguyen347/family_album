import 'dart:convert' as convert;

import 'package:home_album/models/phone_details.dart';
import 'package:home_album/models/photo_details.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseURL = "https://family-album-admin.vercel.app";

  Future<List<PhoneDetails>?> getPhoneNumber() async {
    http.Response response;

    try {
      response = await http.get(Uri.parse("$baseURL/phone"));
    } catch (e) {
      throw Exception('Error: $e');
    }

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      // var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
    } else {
      // print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }

  Future<List<PhotoDetails>> getAlbum(String target) async {
    http.Response response;
    List<PhotoDetails> phoneList = [];

    try {
      response = await http.get(Uri.parse("$baseURL/$target"));
    } catch (e) {
      throw Exception('Error: $e');
    }

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      // print('Number of books about http: $itemCount.');
    } else {
      // print('Request failed with status: ${response.statusCode}.');
    }
    return phoneList;
  }
}
