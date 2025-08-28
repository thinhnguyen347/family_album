import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_album/models/photo_details.dart';
import 'package:flutter/services.dart';

class SelectedPhotoInDetail extends StatefulWidget {
  final PhotoDetails selectedPhoto;

  const SelectedPhotoInDetail({super.key, required this.selectedPhoto});

  @override
  State<SelectedPhotoInDetail> createState() => _MovieInDetailState();
}

class _MovieInDetailState extends State<SelectedPhotoInDetail> {
  late bool isMiniSizedView;

  @override
  void initState() {
    super.initState();
    setState(() {
      isMiniSizedView = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PhotoDetails selectedPhoto = widget.selectedPhoto;

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(selectedPhoto.title),
        centerTitle: true,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Image.network(
              selectedPhoto.link,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          isMiniSizedView
              ? Container(
                  padding: const EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black45.withValues(alpha: 0.8))
              : const SizedBox(width: 0, height: 0),
          isMiniSizedView
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(selectedPhoto.link, fit: BoxFit.fitWidth),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        isMiniSizedView = false;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 1.0, color: Colors.white),
                                      fixedSize: const Size(120, 40),
                                    ),
                                    child: const Text('Xem cỡ lớn',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            height: 1.5)),
                                  ),
                                ]),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text: selectedPhoto.link));
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 1.0, color: Colors.white),
                                      fixedSize: const Size(120, 40),
                                    ),
                                    child: const Text('Copy link',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            height: 1.5)),
                                  ),
                                ]),
                          )
                        ],
                      )
                    ],
                  ),
                )
              : const SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }
}
