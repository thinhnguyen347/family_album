import 'package:flutter/material.dart';
import 'package:home_album/api/api_service.dart';
import 'package:home_album/components/selected_photo_in_detail.dart';
import 'package:home_album/models/photo_details.dart';

class AlbumView extends StatefulWidget {
  final String target;

  const AlbumView({super.key, required this.target});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  List<PhotoDetails>? photoList;

  @override
  void initState() {
    photoList = ApiService().getAlbum(widget.target);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.62,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemCount: photoList?.length,
        itemBuilder: (context, index) {
          return itemPhoto(photoList![index], context);
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
                child: photo.link != ""
                    ? Image.network(photo.link, fit: BoxFit.fitHeight)
                    : Image.asset('assets/images/No-Image-Placeholder.png'),
              ),
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
