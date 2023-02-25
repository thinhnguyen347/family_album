import 'dart:async';
import 'package:flutter/material.dart';
import 'package:home_album/api/api_service.dart';
import 'package:home_album/components/dialog.dart';
import 'package:home_album/components/photo_slide.dart';
import 'package:home_album/models/phone_details.dart';
import 'package:home_album/shared_pref/shared_pref.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 20.0),
            bodyMedium: TextStyle(fontSize: 18.0),
            labelSmall: TextStyle(fontSize: 16.0),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.blue,
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textFieldController = TextEditingController();
  late Future<List<PhoneDetails>> getPhoneList;
  List<PhoneDetails> phoneList = [];

  @override
  initState() {
    super.initState();
    // AppSharedPreferences.setInvalidPhoneNumber();
    getPhoneList = ApiService().getPhoneNumber();
    AppSharedPreferences.checkValidPhoneNumberStatus().then((value) {
      if (value) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const PhotoSlider()));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topStart,
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/avc.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Đăng nhập bằng số điện thoại:'),
                    const SizedBox(height: 20),
                    TextField(
                      controller: textFieldController,
                      keyboardType: TextInputType.number,
                      showCursor: true,
                      autofocus: false,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 25),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          gapPadding: 4.0,
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 48),
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 18)),
                      child: const Text('Tiếp tục'),
                      onPressed: () {
                        String phoneInputNumber =
                            textFieldController.text.trim();
                        if (phoneList.isNotEmpty) {
                          for (var item in phoneList) {
                            if (item.phoneNumber == phoneInputNumber) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      content: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 16,
                                                bottom: 16,
                                                left: 8,
                                                right: 8),
                                            decoration: const BoxDecoration(
                                                color: Colors.black87),
                                            child: Text(
                                                "Xin chào ${item.username}!",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 20)),
                                          ),
                                        ),
                                      )));
                              Future.delayed(const Duration(seconds: 3)).then(
                                  (value) => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) =>
                                              const PhotoSlider())));
                              AppSharedPreferences.setValidPhoneNumber();
                              return;
                            } else {
                              AppSharedPreferences.setInvalidPhoneNumber();
                              showAlertDialog(context,
                                  'Số điện thoại không hợp lệ. Vui lòng thử số khác!');
                              return;
                            }
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ),
          FutureBuilder(
              future: getPhoneList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<PhoneDetails>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const SnackBar(content: Text('No data'));
                  }

                  if (snapshot.hasData) {
                    phoneList = snapshot.data!;
                    return const SizedBox(width: 0);
                  }
                }

                return const Center(
                    child: CircularProgressIndicator(color: Colors.white));
              }),
        ],
      ),
    );
  }
}
