
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/logout_controller.dart';
import '../module/splash.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final signoutt = Get.put(SignOutSeekerController());
var userTypeID;
Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.centerRight,
          content: Container(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Do you want to exit?",
                  style: TextStyle(color: Color(0xff593D77)),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('yes selected');
                          signoutt.removeData();
                          Get.offAll(SplashScreen());
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        child: const Text("Yes",
                            style: TextStyle(color: Color(0xff593D77))),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("No",
                          style: TextStyle(color: Color(0xff593D77))),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
