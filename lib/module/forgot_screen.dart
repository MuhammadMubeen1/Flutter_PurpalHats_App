// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_managment/button.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:property_managment/components/text_field.dart';
import 'package:property_managment/module/Tanent/home_screen.dart';
import 'package:property_managment/module/Worker/home_view.dart';
import 'package:property_managment/module/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: avoid_unnecessary_containers, unnecessary_const, sized_box_for_whitespace, depend_on_referenced_packages, sort_child_properties_last, avoid_types_as_parameter_names

class ForgotScreen extends StatefulWidget {
  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  forgotUser() async {}
   var name;
    var email;
    var user_id;

  @override
  void initState() async {
    // TODO: implement initState
    SharedPreferences prefs = await SharedPreferences.getInstance();
   
    name = prefs.getString('name');
    email = prefs.getString('email');
    user_id = prefs.getString('userId');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: WHITE_COLOR,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignIN()),
                );
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: PRIMARY_COLOR,
              ),
            )),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: SvgPicture.asset(
                      Constants.MSGSENT,
                      height: 230,
                    ),
                  ),
                  Text(
                    Constants.pswd_rest,
                    style: boldTextStyle(context, PRIMARY_COLOR, 35),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      alignment: Alignment.center,
                      child: Text(
                        Constants.pswd_rest_des,
                        style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                      )),
                  const SizedBox(height: 40),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                         
                          // textController: controller,
                          readOnly: false,
                          hintText: Constants.email,
                          hintStyle:
                              hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                          // validator: FormValidator.titleValidator
                          )),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 16),
                    child: shadowButton(
                        Constants.pswd_rest_btn, 60, PRIMARY_COLOR, () {
                      var userType = GetStorage().read('user_type');
                      print(
                          " user type defibe ,,,.................>>E$userType");
                      userType == "agent"
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AgentScreen(),
                              ),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TanentHomeScreen(name: name,email: email,userId: user_id,),
                              ),
                            );
                    }, double.infinity, PRIMARY_COLOR.withOpacity(0.18)),
                  ),
                  SizedBox(height: 0),
                ]),
          ),
        ));
  }
}
