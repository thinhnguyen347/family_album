class PhoneDetails {
  late String username;
  late String phoneNumber;
  late int id;

  PhoneDetails({ required this.username, required this.phoneNumber, required this.id});

  PhoneDetails.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    phoneNumber = json['phoneNumber'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['phoneNumber'] = phoneNumber;
    data['id'] = id;
    return data;
  }
}