import 'dart:convert';
import 'dart:core';

import 'package:home_album/models/phone_details.dart';
import 'package:home_album/models/photo_details.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List<PhoneDetails> getPhoneNumber() {
    List<Map<String, dynamic>> phoneList = [
      {"id": 1, "username": "Thịnh Nguyễn", "phoneNumber": "0984018891"},
      {"id": 2, "username": "Thịnh Nguyễn", "phoneNumber": "0886718891"},
      {"id": 3, "username": "Nguyễn V. Đò", "phoneNumber": "0974012940"},
      {"id": 4, "username": "Nguyễn V. Guột", "phoneNumber": "0906111830"},
      {"id": 5, "username": "Nguyễn Lợi", "phoneNumber": "0974661340"},
      {"id": 6, "username": "Lan Anh", "phoneNumber": "0982115974"},
      {"id": 7, "username": "Nguyễn V. Đang", "phoneNumber": "0946829970"},
      {"id": 8, "username": "Ngọc Hải", "phoneNumber": "0969805260"},
      {"id": 9, "username": "Hiếu Lê", "phoneNumber": "0977585572"},
      {"id": 10, "username": "Nguyễn Hoạt", "phoneNumber": "0366258992"},
      {"id": 11, "username": "Nguyễn Lán", "phoneNumber": "0356571646"},
      {"id": 12, "username": "Ngọc Linh", "phoneNumber": "0977883913"},
      {"id": 13, "username": "Loan", "phoneNumber": "0856898445"},
      {"id": 14, "username": "Lê Minh", "phoneNumber": "0936848876"},
      {"id": 15, "username": "Nguyễn Bẩy", "phoneNumber": "0969492553"},
      {"id": 16, "username": "Nguyễn Yến", "phoneNumber": "0852760341"},
      {"id": 17, "username": "Trang Lê", "phoneNumber": "0392278089"},
      {"id": 18, "username": "Hoàng Thường", "phoneNumber": "0352379147"},
      {"id": 19, "username": "Nguyễn V. Quyền", "phoneNumber": "0392741724"}
    ];

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
        PhotoDetails photoItem = PhotoDetails.fromJson(jsonResponse[i]);
        photoList.add(photoItem);
      }
    }

    return photoList;
  }
}
