import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_managment/button.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/drawer.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/CarouselSlider.dart';
import '../../components/popuo_box.dart';
import '../../controller/logout_controller.dart';
import 'my_info.dart';

final List<String> imgList = [
  Constants.frame_IMGG,
  Constants.frame_IMGG2,
  Constants.frame_IMGG1,
];

class TanentHomeScreen extends StatefulWidget {
  const TanentHomeScreen({
    Key? key,
 required  this.email,
 required   this.name,
 required this.userId,
  }) : super(key: key);

  final String? name;
  final String? email;
  final String? userId;
  @override
  // ignore: library_private_types_in_public_api
  _TanentScreenState createState() => _TanentScreenState();
}

class _TanentScreenState extends State<TanentHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final signoutt = Get.put(SignOutSeekerController());
  // ignore: prefer_typing_uninitialized_variables
  var userTypeID;
  // ignore: prefer_typing_uninitialized_variables
  var myUser;

  @override
  void initState() {
    /// print user type ....

    print("userTypeID,,     userTypeID.......$userTypeID");
    userTypeID = GetStorage().read('user_id'); // reasd user_id...
    myUser = GetStorage().read('myUser'); // read curent myuser....
    super.initState();
  }

  bool value = true;
  int current = 0;
  @override
  Widget build(BuildContext context) {
    print('.....USER FROM CACHE');
    print(jsonEncode(myUser));
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: WHITE_COLOR,
          iconTheme: const IconThemeData(
            color: PRIMARY_COLOR, //change your color here
          ),
          title: const Text("Home", style: TextStyle(color: PRIMARY_COLOR)),
        ),
        drawer: DrawerProfile(),

        ///Curent User Info .......

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                 margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello",
                        style: boldTextStyle(context, PURPLE_COLOR, 28)),
                    const SizedBox(height: 2),
                    Text(widget.name ?? 'N/A', //User name here...
                        style: boldTextStyle(context, PRIMARY_COLOR, 28)),
                    const SizedBox(height: 2),
                    Text("Good Morning", style: hintTextStyle(context, GREY)),
                  ],
                ),
              ),

              //// Circular Avatar ........

              const Spacer(),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: WHITE_COLOR,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          Constants.profile_IMGG,
                        ),
                      ),
                    ),
                  ),

                  /// My info Screen navigation....

                  Positioned(
                    bottom: 1,
                    right: 20,
                    child: GestureDetector(
                      onTap: () async{
                           SharedPreferences storage = await SharedPreferences.getInstance();
    // Get user Type here...
    final name = await storage.getString('name'); //get current user name..
    final email = await storage.getString('email');
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyInfo(name:name ,email: email,)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 4),
                                color: Colors.black.withOpacity(
                                  0.3,
                                ),
                                blurRadius: 3,
                              ),
                            ]),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(Icons.edit, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),

            ////  CarousSlider is here....

            const SizedBox(
              height: 55,
            ),
            Builder(builder: (context) {
              return const SizedBox(height: 398, child: CarousSlider());
            }),

            const SizedBox(
              height: 20,
            ),

            // Logout button here........
            Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
                child: shadowButton(
                  Constants.logout,
                  50,
                  PRIMARY_COLOR,
                  () {
                    showExitPopup(context);
                  },
                  double.infinity,
                  PRIIMARY_BASIC,
                )),
          ],
        ));
  }
}

////////images slider ..........
final List<Widget> imageSliders = imgList.map((item) {
  return Container(
      width: Get.width,
      child: Image.asset(
        item,
        fit: BoxFit.fill,
      ));
}).toList();
