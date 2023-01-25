import 'package:flutter/material.dart';
import 'package:home_album/data/phone_list.dart' as phone_list;
import 'package:home_album/shared_pref/shared_pref.dart';
import 'package:home_album/components/dialog.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 18.0),
          bodyText2: TextStyle(fontSize: 18.0),
          button: TextStyle(fontSize: 16.0),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.blue,
        ),
      ),
      home: const MyHomePage(),
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
  late Future<bool> isValidPhoneNumber;

  @override
  void initState()  {
      isValidPhoneNumber = AppSharedPreferences.checkValidPhoneNumberStatus();
    super.initState();
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
                        if (phone_list.phoneNumbers
                            .contains(phoneInputNumber)) {
                          AppSharedPreferences.setValidPhoneNumber();
                        } else {
                          AppSharedPreferences.setInvalidPhoneNumber();
                          showAlertDialog(context,
                              'Số điện thoại không hợp lệ. Vui lòng thử số khác!');
                        }
                      },
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
