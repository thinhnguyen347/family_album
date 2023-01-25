import 'package:flutter/material.dart';
import 'package:home_album/data/img_list.dart' as list;

import '../data/img_list.dart';

class PhotoSlider extends StatefulWidget {
  const PhotoSlider({Key? key}) : super(key: key);

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DefaultTabController(
            initialIndex: 0,
            length: tabs.length,
            child: Padding(
              padding: const EdgeInsets.only(top: 70, left: 25, bottom: 10),
              child: TabBar(
                controller: tabController,
                tabs: [for (var item in list.tabs) Text(item)],
                indicatorColor: Colors.white,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white38,
                isScrollable: true,
                // labelStyle: const TextStyle(
                //     fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          DefaultTabController(
              length: tabs.length,
              initialIndex: 0,
              child: Expanded(
                  child: TabBarView(
                controller: tabController,
                children: const [
                  Text(''),
                  Text(''),
                  Text(''),
                  Text(''),
                ],
              )))
        ],
      )
    ]));
  }
}
