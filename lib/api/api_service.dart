import 'dart:core';

import 'package:home_album/models/phone_details.dart';
import 'package:home_album/models/photo_details.dart';

class ApiService {
  List<PhoneDetails> getPhoneNumber() {
    List<Map<String, dynamic>> phones = [
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

    List<PhoneDetails> phoneList = [];

    for (int i = 0; i < phones.length; i++) {
      PhoneDetails phoneItem = PhoneDetails.fromJson(phones[i]);
      phoneList.add(phoneItem);
    }

    return phoneList;
  }

  List<PhotoDetails> getAlbum(String target) {
    List<PhotoDetails> photoList = [];
    dynamic album = {
      "collective": [
        {"id": 0, "title": "001", "link": "assets/images/gen/z412.jpg"},
        {"id": 1, "title": "002", "link": "assets/images/gen/5999.jpg"},
        {"id": 2, "title": "003", "link": "assets/images/gen/175230.jpg"},
        {"id": 3, "title": "004", "link": "assets/images/gen/IMG-0249.jpg"},
        {"id": 4, "title": "005", "link": "assets/images/gen/IMG-7784.jpg"},
        {"id": 5, "title": "006", "link": "assets/images/gen/IMG-7785.jpg"},
        {"id": 6, "title": "007", "link": "assets/images/gen/IMG-7792.jpg"},
        {"id": 7, "title": "008", "link": "assets/images/gen/IMG-7793.jpg"},
        {"id": 8, "title": "009", "link": "assets/images/gen/IMG-7795.jpg"},
        {"id": 9, "title": "010", "link": "assets/images/gen/IMG-7797.jpg"},
        {"id": 10, "title": "011", "link": "assets/images/gen/IMG-7805.jpg"},
        {"id": 11, "title": "012", "link": "assets/images/gen/m2.jpg"},
        {"id": 12, "title": "013", "link": "assets/images/gen/m3.jpg"},
        {"id": 13, "title": "014", "link": "assets/images/gen/mam.jpg"},
        {"id": 14, "title": "015", "link": "assets/images/gen/z405.jpg"},
        {"id": 15, "title": "016", "link": "assets/images/gen/388.jpg"},
        {"id": 16, "title": "017", "link": "assets/images/gen/z413.jpg"},
        {"id": 17, "title": "018", "link": "assets/images/gen/z41399.jpg"}
      ],
      "banoi": [
        {"id": 0, "title": "Cụ và Mỡ (chụp 1/8/2019)", "link": "assets/images/ba/IMG-0007.jpg"},
        {"id": 1, "title": "Cụ và Mỡ (chụp 1/8/2019)", "link": "assets/images/ba/IMG-0008.jpg"},
        {"id": 2, "title": "001", "link": "assets/images/ba/IMG-0106.jpg"},
        {"id": 3, "title": "002", "link": "assets/images/ba/IMG-0107.jpg"},
        {"id": 4, "title": "003", "link": "assets/images/ba/IMG-1465.jpg"},
        {"id": 5, "title": "Cụ và Mỡ (2/9/2019)", "link": "assets/images/ba/IMG-2094.jpg"},
        {"id": 6, "title": "Cụ và Mỡ (2/9/2019)", "link": "assets/images/ba/IMG-2095.jpg"},
        {"id": 7, "title": "Tết Quý Mão 2023", "link": "assets/images/ba/z46b1fe.jpg"},
        {"id": 8, "title": "Tết Quý Mão 2023", "link": "assets/images/ba/z413bf2.jpg"}
      ],
      "thu": [
        {"id": 20, "title": "Thu lúc chưa biết lẫy", "link": "assets/images/thu/7026725323-fc12340922-o.jpg"},
        {"id": 21, "title": "Thu lúc chưa biết lẫy 2", "link": "assets/images/thu/6880627018-2992190c7a-o.jpg"},
        {"id": 0, "title": "Chị Trang bế Thu xinh", "link": "assets/images/thu/aAijxey.jpeg"},
        {"id": 1, "title": "Ảnh chụp 30/07/2012", "link": "assets/images/thu/P28-07-12-11-29.jpg"},
        {"id": 2, "title": "Ảnh chụp 30/07/2012", "link": "assets/images/thu/P28-07-12-11-25.jpg"},
        {"id": 3, "title": "Ảnh chụp 30/07/2012", "link": "assets/images/thu/P28-07-12-11-24-1.jpg"},
        {"id": 5, "title": "Ảnh chụp 30/07/2012", "link": "assets/images/thu/P28-07-12-11-26.jpg"},
        {"id": 6, "title": "Ảnh chụp 20/02/2013", "link": "assets/images/thu/200220131.jpg"},
        {"id": 7, "title": "Ảnh chụp 20/02/2013", "link": "assets/images/thu/200220132.jpg"},
        {"id": 8, "title": "Ảnh chụp 20/02/2013", "link": "assets/images/thu/200220133.jpg"},
        {"id": 9, "title": "Ảnh chụp 20/02/2013", "link": "assets/images/thu/20170129-170515.jpg"},
        {"id": 10, "title": "Ảnh chụp tại chùa Hương 2017", "link": "assets/images/thu/20170212-123522.jpg"},
        {"id": 11, "title": "Tết 2017", "link": "assets/images/thu/20170129-161324.jpg"},
        {"id": 12, "title": "Tết 2017", "link": "assets/images/thu/20170129-150021.jpg"},
        {"id": 13, "title": "27-10-2012", "link": "assets/images/thu/P27-10-12-13-16.jpg"},
        {"id": 14, "title": "27-10-2012", "link": "assets/images/thu/P27-10-12-13-16-1.jpg"},
        {"id": 15, "title": "27-10-2012", "link": "assets/images/thu/P27-10-12-13-17.jpg"},
        {"id": 16, "title": "27-10-2012", "link": "assets/images/thu/P27-10-12-13-17-1.jpg"},
        {"id": 17, "title": "27-10-2012", "link": "assets/images/thu/P27-10-12-14-11.jpg"},
        {"id": 18, "title": "Đi đò suối Yến 2017", "link": "assets/images/thu/32867235816-0443d08a33-o.jpg"},
        {"id": 19, "title": "Đi đò suối Yến 2017", "link": "assets/images/thu/32065020034-ed02e9137a-o.jpg"}
      ],
      "hang": [
        {"id": 1, "title": "Hằng lúc mới biết bò", "link": "assets/images/hang/hang1t.jpg"},
        {"id": 2, "title": "1 tuổi", "link": "assets/images/hang/60399-104268952971442-2107407-n.jpg"},
        {"id": 10, "title": "Ảnh chụp 15/02/2013", "link": "assets/images/hang/P15-02-13-15-22.jpg"},
        {"id": 11, "title": "Ảnh chụp 15/02/2013", "link": "assets/images/hang/P15-02-13-15-23.jpg"},
        {"id": 5, "title": "Tết 2017", "link": "assets/images/hang/20170129-161141.jpg"},
        {"id": 6, "title": "Tết 2017", "link": "assets/images/hang/20170129-164910.jpg"},
        {"id": 7, "title": "Tết 2017", "link": "assets/images/hang/20170129-161055.jpg"},
        {"id": 8, "title": "Tết 2017", "link": "assets/images/hang/20170129-114529.jpg"},
        {"id": 13, "title": "Tết 2017", "link": "assets/images/hang/20170129-145919.jpg"},
        {"id": 9, "title": "Ảnh du lịch Quảng Ninh", "link": "assets/images/hang/33451634381-d1b215bffb-o.jpg"},
        {"id": 12, "title": "Ảnh du lịch Quảng Ninh", "link": "assets/images/hang/20170321-094730.jpg"},
        {"id": 14, "title": "Ảnh du lịch Quảng Ninh", "link": "assets/images/hang/33601619565-18c7d48eb6-o.jpg"},
        {"id": 15, "title": "Ảnh du lịch Quảng Ninh", "link": "assets/images/hang/33444972942-8279e60745-o.jpg"},
        {"id": 16, "title": "Ảnh du lịch Quảng Ninh", "link": "assets/images/hang/33459323932-d010e491f7-o.jpg"},
        {"id": 17, "title": "Ảnh du lịch Quảng Ninh", "link": "assets/images/hang/33444970722-3592f0cbe1-o.jpg"}
      ],
      "sushi": [
        {"id": 1, "title": "001", "link": "assets/images/sushi/IMG-5277.jpg"},
        {"id": 2, "title": "002", "link": "assets/images/sushi/IMG-6008.jpg"},
        {"id": 3, "title": "003", "link": "assets/images/sushi/IMG-5892.jpg"},
        {"id": 4, "title": "004", "link": "assets/images/sushi/IMG-5891.jpg"},
        {"id": 5, "title": "005", "link": "assets/images/sushi/IMG-5890.jpg"},
        {"id": 6, "title": "006", "link": "assets/images/sushi/IMG-5889.jpg"},
        {"id": 7, "title": "007", "link": "assets/images/sushi/IMG-5888.jpg"},
        {"id": 8, "title": "008", "link": "assets/images/sushi/IMG-5887.jpg"},
        {"id": 9, "title": "009", "link": "assets/images/sushi/IMG-5886.jpg"},
        {"id": 10, "title": "010", "link": "assets/images/sushi/IMG-4679.jpg"},
        {"id": 11, "title": "011", "link": "assets/images/sushi/IMG-4562.jpg"},
        {"id": 12, "title": "012", "link": "assets/images/sushi/IMG-6010.jpg"},
        {"id": 13, "title": "013", "link": "assets/images/sushi/IMG-6053.jpg"}
      ],
    };

    List<dynamic> photos = album[target];

    for (int i = 0; i < photos.length; i++) {
      PhotoDetails photoItem = PhotoDetails.fromJson(photos[i]);
      photoList.add(photoItem);
    }

    return photoList;
  }
}
