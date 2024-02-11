// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, missing_required_param, missing_return, avoid_print, prefer_typing_uninitialized_variables, library_prefixes, unused_local_variable, no_leading_underscores_for_local_identifiers
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart' as Location;
import 'package:property_managment/button.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/drawer.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:property_managment/controller/check_in_controller.dart';
import 'package:property_managment/controller/logout_controller.dart';
import 'package:property_managment/module/Worker/location.dart';
import 'package:property_managment/module/Worker/my_task.dart';

import 'package:property_managment/module/sign_in.dart';

final List<String> imgList = [
  Constants.frame_IMGG,
  Constants.frame_IMGG2,
  Constants.frame_IMGG1,
];

class AgentScreen extends StatefulWidget {
   const AgentScreen({
     this.email,
     this.name,
     this.userId,
  });

  final String? name;
  final String? email;
  final String? userId;
  @override
  _AgentScreenState createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final signoutt = Get.put(SignOutSeekerController());
  final checkinCont = Get.put(CheckInController());

  bool value = true;
  int current = 0;

  var useerID;

  @override
  void initState() {
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    //  locationService();
    super.initState();
  }

  checkInJson() {
    var jsonUpdated;
    jsonUpdated = {
      "login_session_id": useerID,
      "location": {
        "longitude": UserLocation.long,
        "latitude": UserLocation.lat,
      },
    };
    print("json updated....................>>$jsonUpdated");
    checkinCont.checkinAgent(jsonUpdated);
  }

  Future<void> locationService() async {
    Location.Location location = Location.Location();

    bool _serviceEnabled;
    Location.PermissionStatus _permissionLocation;
    Location.LocationData _locData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionLocation = await location.hasPermission();
    if (_permissionLocation == Location.PermissionStatus.denied) {
      _permissionLocation = await location.requestPermission();
      if (_permissionLocation != Location.PermissionStatus.granted) {
        return;
      }
    }

    _locData = await location.getLocation();

    //  setState(() {
    UserLocation.lat = _locData.latitude!;
    print("userLocation...............${UserLocation.lat}");
    UserLocation.long = _locData.longitude!;
    print(" UserLocation.long  ...............${UserLocation.long}");
    //  });
    return getLocation();
  }

  Future<void> getLocation() async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(UserLocation.lat, UserLocation.long);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: WHITE_COLOR,
          iconTheme: IconThemeData(
            color: PRIMARY_COLOR, //change your color here
          ),
          title: Text("Home", style: TextStyle(color: PRIMARY_COLOR)),
        ),
        drawer: DrawerProfile(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello",
                          style: boldTextStyle(context, PURPLE_COLOR, 28)),
                      SizedBox(height: 2),
                      Text(widget.name??'N/A',
                          style: boldTextStyle(context, PRIMARY_COLOR, 28)),
                      SizedBox(height: 7),
                      Text("Good Morning", style: hintTextStyle(context, GREY)),
                    ],
                  ),
                ),
                Spacer(),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: WHITE_COLOR,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            Constants.profile_IMGG,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 20,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.edit, color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 4),
                                color: Colors.black.withOpacity(
                                  0.3,
                                ),
                                blurRadius: 3,
                              ),
                            ]),
                      ),
                    ),
                  ],
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Builder(builder: (context) {
                  return CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                        height: 360,
                        aspectRatio: 0.8,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        // enlargeCenterPage: true,
                        // aspectRatio: 2.4,
                        onPageChanged: (index, reason) {
                          setState(() {
                            current = index;
                          });
                        }),
                  );
                }),
              ),

              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: buttonRounded(
                    Constants.checkin,
                    45,
                    GREEN_COLOR,
                    () {
                      checkInJson();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MyTask()),
                      // );
                    },
                    Get.width * 0.30,
                    GREEN_BUTTON,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: buttonRounded(
                    Constants.checkout,
                    45,
                    REJECT_BUTTON,
                    () {},
                    Get.width * 0.30,
                    REJECT_COLOR,
                  ),
                ),
              ]),
              Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: shadowButton(
                    Constants.logout,
                    50,
                    PRIMARY_COLOR,
                    () {
                      useerID = GetStorage().remove("user_id");
                      signoutt.signOutSeekeer(useerID);
                      Get.offAll(SignIN());
                    },
                    double.infinity,
                    PRIIMARY_BASIC,
                  )),
            ],
          ),
        ));
  }
}

final List<Widget> imageSliders = imgList.map((item) {
  return Container(
      width: 360,
      //item,
      child: Image.asset(
        item,
        fit: BoxFit.fill,)
      
      );
}).toList();
