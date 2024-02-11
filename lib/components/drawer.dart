
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/controller/logout_controller.dart';
import 'package:property_managment/module/sign_in.dart';

 String text = '';
  String subject = '';
class DrawerProfile extends StatefulWidget{
  @override 
  _DrawerProfileeState createState() => _DrawerProfileeState();
}

class _DrawerProfileeState extends State<DrawerProfile> {
  final signoutt = Get.put(SignOutSeekerController());
  var userTypeID;

  @override
  void initState() {
    userTypeID = GetStorage().read('user_id');
    print("userTypeID,,     userTypeID.......$userTypeID");
    super.initState();
  }
  @override 
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(30),
      bottomRight: Radius.circular(30)),
      child: Drawer(
        elevation: 0,
        backgroundColor: WHITE_COLOR,
        child: ListView(
          children: [
            SizedBox(height:30),
            CustomListTile(Icons.person, 'LOGOUT',() => {
              GetStorage().remove("user_id"),
              signoutt.signOutSeekeer(userTypeID),
              Get.offAll(SignIN()),
              // Navigator.push(context,MaterialPageRoute(builder:(context) => ProfileScreen()))
            }),
          ]
        ),
      ),
    );
  }
}
 class CustomListTile  extends StatelessWidget {
  
  IconData icon ;
  String text;
  Function() onTap;
  CustomListTile(this.icon, this.text, this.onTap );
  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap,
        child:Container(
          height: 50,
          child: Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.only(left:15),
                      child:Text(text, 
                      style: TextStyle(
                        fontSize: 16.0
                      )
                    )
                  )
                ]
              ),
            ],
          )
        )
      )
    );
  }
}

