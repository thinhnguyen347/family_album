import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showAlertDialog(BuildContext context, String message) =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lottie/wave-birdie.json',
                  width: 100,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 16),
                Text(message,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Đã hiểu',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        });
