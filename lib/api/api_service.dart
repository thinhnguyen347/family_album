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
        {"id": 0, "title": "Huy còi và Hùng công tử", "link": "https://i.ibb.co/St0Jt0M/599917725-823319.jpg"},
        {"id": 1, "title": "Thịnh và anh Hiếu", "link": "https://i.ibb.co/n7VBk19/IMG-7792.jpg"},
        {"id": 2, "title": "Ai đây??", "link": "https://i.ibb.co/4JChnzF/IMG-7785.jpg"},
        {"id": 3, "title": "Hai chị em Mắm & Yến", "link": "https://i.ibb.co/JzZ2kqJ/m2.jpg"},
        {"id": 4, "title": "Thanh niên Mắm 4 tuổi!", "link": "https://i.ibb.co/x2VwLC8/m3.jpg"},
        {"id": 5, "title": "Thanh niên Mắm 4 tuổi!", "link": "https://i.ibb.co/92kNY7c/mam.jpg"},
        {"id": 6, "title": "Hai dì cháu! (06.02.2019)", "link": "https://i.ibb.co/hZv43md/IMG-0249.jpg"},
        {"id": 7, "title": "Hai chị em Thịnh & Trang", "link": "https://i.ibb.co/ncfvPmR/IMG-7784.jpg"},
        {"id": 8, "title": "Tắm biển Sầm Sơn", "link": "https://i.ibb.co/7SRxTjJ/IMG-7795.jpg"},
        {"id": 9, "title": "Tắm biển Sầm Sơn (2)", "link": "https://i.ibb.co/Jnz54x1/IMG-7805.jpg"},
        {"id": 10, "title": "Thịnh chụp với xe Wave của bác Đang", "link": "https://i.ibb.co/By7mQ7g/IMG-7793.jpg"},
        {"id": 11, "title": "Tỷ thí", "link": "https://i.ibb.co/TRbhCcv/175230-139849546080049-7955934-o.jpg"},
        {"id": 12, "title": "Không cảm xúc!", "link": "https://i.ibb.co/q0RsNf9/38869061821-690cfd4ff5-o.jpg"},
        {"id": 13, "title": "Cử nhân mẫu giáo Quang Huy", "link": "https://i.ibb.co/F3wnw4g/IMG-7797.jpg"},
        {"id": 14, "title": "Tết Quý Mão 2023", "link": "https://i.ibb.co/2tZvtRT/z4139919316728-4439b7fdc1179f6c4e23ea1191e01a7c.jpg"},
        {"id": 15, "title": "Tết Quý Mão 2023", "link": "https://i.ibb.co/r3y7q6N/z4139919262316-f549590bda1715012cd15dc9e2b01391.jpg"},
        {"id": 16, "title": "Tết năm nào đó", "link": "https://i.ibb.co/6s3szXK/z4139919267726-25136505e66c2f231c9b34b5a56150e2.jpg"},
        {"id": 17, "title": "Tết Quý Mão 2023", "link": "https://i.ibb.co/JmK8jfb/z4057614098895.jpg"}
      ],
      "banoi": [
        {"id": 0, "title": "Cụ và Mỡ (chụp 1/8/2019)", "link": "https://i.ibb.co/bggcGk6/IMG-0007.jpg"},
        {"id": 1, "title": "Cụ và Mỡ (chụp 1/8/2019)", "link": "https://i.ibb.co/gJDzgyF/IMG-0008.jpg"},
        {"id": 2, "title": "Hai bà khoe nhau áo đẹp", "link": "https://i.ibb.co/5TXP18X/IMG-2094.jpg"},
        {"id": 3, "title": "Hai bà khoe nhau áo đẹp 2", "link": "https://i.ibb.co/WkzYb2c/IMG-2095.jpg"},
        {"id": 4, "title": "Các ông bà", "link": "https://i.ibb.co/ZSq86N9/IMG-1465.jpg"},
        {"id": 5, "title": "Cụ và Mỡ (2/9/2019)", "link": "https://i.ibb.co/6tRDzH6/IMG-0106.jpg"},
        {"id": 6, "title": "Cụ và Mỡ (2/9/2019)", "link": "https://i.ibb.co/Lk6stT7/IMG-0107.jpg"},
        {"id": 7, "title": "Tết Quý Mão 2023", "link": "https://i.ibb.co/2Y29MQs/z4139919252409-d5a0248d4844cf280c31b47e79251bf2.jpg"},
        {"id": 8, "title": "Tết Quý Mão 2023", "link": "https://i.ibb.co/6vvwdYx/z4139919258845-b584001f9add370f15bcad5b19f6b1fe.jpg"}
      ],
      "thu": [
        {"id": 20, "title": "Thu lúc chưa biết lẫy", "link": "https://i.ibb.co/bN8Tn2z/7026725323-fc12340922-o.jpg"},
        {"id": 21, "title": "Thu lúc chưa biết lẫy 2", "link": "https://i.ibb.co/Q85RTjr/6880627018-2992190c7a-o.jpg"},
        {"id": 0, "title": "Chị Trang bế Thu xinh", "link": "https://i.imgur.com/aAijxey.jpg"},
        {"id": 1, "title": "Ảnh chụp 30/07/2012", "link": "https://i.ibb.co/XbDwc8c/P28-07-12-11-29.jpg"},
        {"id": 2, "title": "Ảnh chụp 30/07/2012", "link": "https://i.ibb.co/2hbkHgk/P28-07-12-11-25.jpg"},
        {"id": 3, "title": "Ảnh chụp 30/07/2012", "link": "https://i.ibb.co/1LY0jdH/P28-07-12-11-24-1.jpg"},
        {"id": 5, "title": "Ảnh chụp 30/07/2012", "link": "https://i.ibb.co/rM657Wd/P28-07-12-11-26.jpg"},
        {"id": 6, "title": "Ảnh chụp 20/02/2013", "link": "https://i.ibb.co/WprkvCz/200220131.jpg"},
        {"id": 7, "title": "Ảnh chụp 20/02/2013", "link": "https://i.ibb.co/Rp0Yrkv/200220132.jpg"},
        {"id": 8, "title": "Ảnh chụp 20/02/2013", "link": "https://i.ibb.co/Sf8k6Rt/200220133.jpg"},
        {"id": 9, "title": "Ảnh chụp 20/02/2013", "link": "https://i.ibb.co/yYBjZ9q/20170129-170515.jpg"},
        {"id": 10, "title": "Ảnh chụp tại chùa Hương 2017", "link": "https://i.ibb.co/qY1jQN5/20170212-123522.jpg"},
        {"id": 11, "title": "Tết 2017", "link": "https://i.ibb.co/MckYjfb/20170129-161324.jpg"},
        {"id": 12, "title": "Tết 2017", "link": "https://i.ibb.co/brKq4Gq/20170129-150021.jpg"},
        {"id": 13, "title": "27-10-2012", "link": "https://i.ibb.co/DVZNTQB/P27-10-12-13-16.jpg"},
        {"id": 14, "title": "27-10-2012", "link": "https://i.ibb.co/9nn7R9F/P27-10-12-13-16-1.jpg"},
        {"id": 15, "title": "27-10-2012", "link": "https://i.ibb.co/wrC0yjr/P27-10-12-13-17.jpg"},
        {"id": 16, "title": "27-10-2012", "link": "https://i.ibb.co/MZqrdZQ/P27-10-12-13-17-1.jpg"},
        {"id": 17, "title": "27-10-2012", "link": "https://i.ibb.co/42yfTn0/P27-10-12-14-11.jpg"},
        {"id": 18, "title": "Đi đò suối Yến 2017", "link": "https://i.ibb.co/r5mMZ3s/32867235816-0443d08a33-o.jpg"},
        {"id": 19, "title": "Đi đò suối Yến 2017", "link": "https://i.ibb.co/Xzt8rDy/32065020034-ed02e9137a-o.jpg"}
      ],
      "hang": [
        {"id": 1, "title": "Hằng lúc mới biết bò", "link": "https://i.ibb.co/tBQrLX5/hang1t.jpg"},
        {"id": 2, "title": "1 tuổi", "link": "https://i.ibb.co/GnQ0wfq/60399-104268952971442-2107407-n.jpg"},
        {"id": 10, "title": "Ảnh chụp 15/02/2013", "link": "https://i.ibb.co/4S2WkkX/P15-02-13-15-22.jpg"},
        {"id": 11, "title": "Ảnh chụp 15/02/2013", "link": "https://i.ibb.co/Gk92D9d/P15-02-13-15-23.jpg"},
        {"id": 5, "title": "Tết 2017", "link": "https://i.ibb.co/x1rC5ws/20170129-161141.jpg"},
        {"id": 6, "title": "Tết 2017", "link": "https://i.ibb.co/jV2y4CY/20170129-164910.jpg"},
        {"id": 7, "title": "Tết 2017", "link": "https://i.ibb.co/WGJvmk3/20170129-161055.jpg"},
        {"id": 8, "title": "Tết 2017", "link": "https://i.ibb.co/80LSB3Y/20170129-114529.jpg"},
        {"id": 13, "title": "Tết 2017", "link": "https://i.ibb.co/1XwT9cC/20170129-145919.jpg"},
        {"id": 9, "title": "Ảnh du lịch Quảng Ninh", "link": "https://i.ibb.co/6HX0ZZB/33451634381-d1b215bffb-o.jpg"},
        {"id": 12, "title": "Ảnh du lịch Quảng Ninh", "link": "https://i.ibb.co/Rp987dB/20170321-094730.jpg"},
        {"id": 14, "title": "Ảnh du lịch Quảng Ninh", "link": "https://i.ibb.co/JcNwbZy/33601619565-18c7d48eb6-o.jpg"},
        {"id": 15, "title": "Ảnh du lịch Quảng Ninh", "link": "https://i.ibb.co/T8QnJCN/33444972942-8279e60745-o.jpg"},
        {"id": 16, "title": "Ảnh du lịch Quảng Ninh", "link": "https://i.ibb.co/K7YdCzz/33459323932-d010e491f7-o.jpg"},
        {"id": 17, "title": "Ảnh du lịch Quảng Ninh", "link": "https://i.ibb.co/WFP9V9h/33444970722-3592f0cbe1-o.jpg"}
      ],
      "sushi": [
        {"id": 1, "title": "001", "link": "https://i.ibb.co/tBQrLX5/hang1t.jpg"},
        {"id": 2, "title": "02", "link": "https://i.ibb.co/GnQ0wfq/60399-104268952971442-2107407-n.jpg"},
        {"id": 10, "title": "003", "link": "https://i.ibb.co/4S2WkkX/P15-02-13-15-22.jpg"},
        {"id": 11, "title": "004", "link": "https://i.ibb.co/Gk92D9d/P15-02-13-15-23.jpg"},
        {"id": 5, "title": "005", "link": "https://i.ibb.co/x1rC5ws/20170129-161141.jpg"},
        {"id": 6, "title": "006", "link": "https://i.ibb.co/jV2y4CY/20170129-164910.jpg"},
        {"id": 7, "title": "007", "link": "https://i.ibb.co/WGJvmk3/20170129-161055.jpg"},
        {"id": 8, "title": "008", "link": "https://i.ibb.co/80LSB3Y/20170129-114529.jpg"},
        {"id": 13, "title": "009", "link": "https://i.ibb.co/1XwT9cC/20170129-145919.jpg"},
        {"id": 9, "title": "010", "link": "https://i.ibb.co/6HX0ZZB/33451634381-d1b215bffb-o.jpg"},
        {"id": 12, "title": "011", "link": "https://i.ibb.co/Rp987dB/20170321-094730.jpg"},
        {"id": 14, "title": "012", "link": "https://i.ibb.co/JcNwbZy/33601619565-18c7d48eb6-o.jpg"},
        {"id": 15, "title": "013", "link": "https://i.ibb.co/T8QnJCN/33444972942-8279e60745-o.jpg"},
        {"id": 16, "title": "014", "link": "https://i.ibb.co/K7YdCzz/33459323932-d010e491f7-o.jpg"},
        {"id": 17, "title": "015", "link": "https://i.ibb.co/WFP9V9h/33444970722-3592f0cbe1-o.jpg"}
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
