import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_album/models/photo_details.dart';

class SelectedPhotoInDetail extends StatefulWidget {
  final PhotoDetails selectedPhoto;

  const SelectedPhotoInDetail({Key? key, required this.selectedPhoto})
      : super(key: key);

  @override
  State<SelectedPhotoInDetail> createState() => _MovieInDetailState();
}

class _MovieInDetailState extends State<SelectedPhotoInDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PhotoDetails selectedPhoto = widget.selectedPhoto;

    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black87,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                    child: const Icon(Icons.favorite_border),
                    onTap: () {
                      if (kDebugMode) {
                        print('liked');
                      }
                    }))
          ],
        ),
        body: Stack(
          children: [
            Image.network(selectedPhoto.link,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width),
            Container(
                padding: const EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black45.withOpacity(0.8)),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(selectedPhoto.link, fit: BoxFit.fitWidth),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Thông tin:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                        child: selectedPhoto.title != ''
                            ? Text(selectedPhoto.title,
                                textAlign: TextAlign.center)
                            : const Text('Đang cập nhật...',
                                textAlign: TextAlign.center)),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ));
  }
}
