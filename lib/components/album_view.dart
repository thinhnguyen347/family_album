import 'package:flutter/material.dart';
import 'package:home_album/api/api_service.dart';
import 'package:home_album/components/selected_photo_in_detail.dart';
import 'package:home_album/models/photo_details.dart';
import 'package:lottie/lottie.dart';

class AlbumView extends StatefulWidget {
  final String target;

  const AlbumView({Key? key, required this.target}) : super(key: key);

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  Future<List<PhotoDetails>>? photoList;

  @override
  void initState() {
    photoList = ApiService().getAlbum(widget.target);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: photoList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          }

          var listPhotoOnTab = snapshot.data as List<PhotoDetails>;

          return listPhotoOnTab.isEmpty
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Lottie.asset(
                        'assets/lottie/133784-back-to-school.json',
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 16),
                      const Text('Không có dữ liệu!',
                          style: TextStyle(color: Colors.white))
                    ]))
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.62,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemCount: listPhotoOnTab.length,
                  itemBuilder: (context, index) {
                    return itemPhoto(listPhotoOnTab[index], context);
                  });
        });
  }
}

Widget itemPhoto(PhotoDetails photo, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                  onTap: () {
                    if (photo.link != '') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SelectedPhotoInDetail(selectedPhoto: photo)));
                    }
                  },
                  child: photo.link != ''
                      ? Image.network(
                          photo.link,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : Image.asset('assets/images/No-Image-Placeholder.png')),
            ),
          )),
      const SizedBox(height: 8),
      SizedBox(
          height: 40,
          child: Text(photo.title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white))),
    ],
  );
}
