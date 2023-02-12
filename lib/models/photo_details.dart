class PhotoDetails {
  late String title;
  late String link;
  late int id;

  PhotoDetails({ required this.title, required this.link, required this.id});

  PhotoDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['link'] = link;
    data['id'] = id;
    return data;
  }
}