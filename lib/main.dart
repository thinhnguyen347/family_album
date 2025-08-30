import 'package:flutter/foundation.dart';
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
  late List<PhoneDetails> phoneList;
  bool showContinueBtn = false;
  late bool isValidPhone = false;

  @override
  void initState() {
    super.initState();
    phoneList = ApiService().getPhoneNumber();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    isValidPhone = await AppSharedPreferences.checkValidPhoneNumberStatus();
    if (mounted && isValidPhone) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const PhotoSlider()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
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
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          gapPadding: 4.0,
                        ),
                      ),
                      onChanged: (value) {
                        if (textFieldController.text.trim().length == 10) {
                          setState(() {
                            showContinueBtn = true;
                          });
                        } else {
                          setState(() {
                            showContinueBtn = false;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    showContinueBtn
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(120, 48),
                                backgroundColor: Colors.red,
                                textStyle: const TextStyle(color: Colors.white, fontSize: 18)),
                            child: const Text('Tiếp tục', style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              String phoneInputNumber = textFieldController.text.trim();
                              final foundPeople = phoneList.where((element) => element.phoneNumber == phoneInputNumber).toList();

                              if (kDebugMode) {
                                print(foundPeople);
                              }
                              if (foundPeople.isNotEmpty) {
                                if (foundPeople[0].phoneNumber == phoneInputNumber) {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const PhotoSlider()));

                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      content: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Container(
                                            padding: const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                                            decoration: const BoxDecoration(color: Colors.black87),
                                            child: Text("Xin chào ${foundPeople[0].username}!",
                                                textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
                                          ),
                                        ),
                                      )));

                                  Future.delayed(const Duration(seconds: 3)).then((value) => {
                                        if (context.mounted)
                                          {
                                            Navigator.of(context)
                                                .pushReplacement(MaterialPageRoute(builder: (context) => const PhotoSlider()))
                                          }
                                      });

                                  AppSharedPreferences.setValidPhoneNumber();
                                  return;
                                } else {
                                  AppSharedPreferences.setInvalidPhoneNumber();
                                  showAlertDialog(context, 'Số điện thoại không hợp lệ. Vui lòng thử số khác!');
                                  return;
                                }
                              }
                            },
                          )
                        : const SizedBox(height: 0),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
