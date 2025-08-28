import 'package:flutter/material.dart';
import 'album_view.dart';

class PhotoSlider extends StatefulWidget {
  const PhotoSlider({super.key});

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<Widget> tabs = const [
    Text('Ảnh chung'),
    Text('Ảnh của bà'),
    Text('Thu xinh'),
    Text('Hằng cute')
  ];

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
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DefaultTabController(
              initialIndex: 0,
              length: tabs.length,
              child: tabBar(controller: tabController, tabs: tabs)
            ),
            DefaultTabController(
                length: tabs.length,
                initialIndex: 0,
                child: tabBarView(controller: tabController))
          ],
        ),
      )
    ]));
  }
}

Padding tabBar({required TabController controller, required List<Widget> tabs}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 25, bottom: 10),
    child: TabBar(
      controller: controller,
      tabs: tabs,
      indicatorColor: Colors.white,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white38,
      isScrollable: true,
      labelStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}

Expanded tabBarView({required TabController controller}) {
  return Expanded(
      child: TabBarView(
        controller: controller,
        children: const [
          AlbumView(target: 'collective'),
          AlbumView(target: 'sushi'),
          AlbumView(target: 'banoi'),
          AlbumView(target: 'thu'),
          AlbumView(target: 'hang'),
        ],
      ));
}
