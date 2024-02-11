// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:property_managment/button.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:property_managment/components/text_field.dart';
import 'package:property_managment/controller/login_controller.dart';
// import 'package:property_managment/module/sign_up.dart';
// import 'Worker/home_view.dart';
import 'forgot_screen.dart';

bool checkBox = false;

class SignIN extends StatefulWidget {
  @override
  State<SignIN> createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController(text: "");

  TextEditingController passController = TextEditingController(text: "");

  final LoginController loginController = Get.put(LoginController());
//// come to loginscreen
  loginUser() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      String username = usernameController.text;
      String password = passController.text;
      if (username.isEmpty) {
        Get.snackbar("warning", "enter_email",
            colorText: Colors.red, backgroundColor: PRIMARY_COLOR);
      } else if (password.isEmpty) {
        Get.snackbar("warning", "enter_pass",
            colorText: Colors.red, backgroundColor: PRIMARY_COLOR);
      } else {
        loginController.loginUser(username, password); // check login controller here first
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //WHITE_COLOR,
      body: SingleChildScrollView(child: signUpWidget(context)),
    );
  }

  Widget signUpWidget(context) {
    return Obx(() {
      return Form(
        key: _formKey,
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                Constants.connection_IMG,
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                Constants.acco_login,
                style: boldTextStyle(context, PRIMARY_COLOR, 30),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 80),
              // alignment: Alignment.center,
              child: Text(
                Constants.acco_heading,
                style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
              ),
            ),

            const SizedBox(height: 30),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                
                    textController: usernameController,
                    readOnly: false,
                    hintText: Constants.email,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            const SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                    cursorColor: PRIMARY_COLOR,
                    controller: passController,
                    // style: TextStyles.appTextStyle(fontSize: textSizeSMedium),
                    obscureText: loginController.showPassValue.value,
                    validator: (val) {
                      if (val!.length < 3) {
                        return ("Password length too short");
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.fromLTRB(24, 18, 0, 18),
                      hintText: "Password",
                      focusColor: FIELD_BORDER_COLOR,
                      hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                      filled: true,
                      fillColor: WHITE_COLOR,
                      suffixIcon: IconButton(
                          onPressed: () {
                            loginController.isShowPass(
                                !loginController.showPassValue.value);
                          },
                          icon: loginController.showPassValue.value == false
                              ? SvgPicture.asset(
                                  Constants.eyeIcon,
                                  height: 20,
                                  color: PRIMARY_COLOR,
                                )
                              : Icon(Icons.visibility_off,
                                  color: PRIMARY_COLOR)),
                      // decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                        borderSide: BorderSide(color: Colors.red, width: 0.1),
                      ),
                      // focusColor:widget.borderColor ,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                        borderSide:
                            BorderSide(color: FIELD_BORDER_COLOR, width: 1.0),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                        borderSide:
                            BorderSide(width: 1, color: FIELD_BORDER_COLOR),
                      ),

                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(6),
                      //   borderSide: const BorderSide(color:  FIELD_BORDER_COLOR, width: 1.0),
                      // ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(6),
                      //   borderSide: const BorderSide(color: FIELD_BORDER_COLOR, width: 1.0 ,),
                      // ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(6),
                      //   borderSide:const BorderSide(color: FIELD_BORDER_COLOR, width: 1.0),
                      // ),
                      // errorBorder: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(6),
                      //   borderSide: const BorderSide(color:  FIELD_BORDER_COLOR, width: 1.0),
                      // )
                    ))),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 20),
            //   child: CustomTextField(
            //     textController: passController,
            //     readOnly: false,
            //     hintText: Constants.password,
            //     hintStyle: hintTextStyle(context,INPUT_FIELD_TEXT_COLOR),
            //     obscureText: loginController.showPassValue.value ,
            //     suffixIcon: IconButton(onPressed: (){
            //       loginController.isShowPass(!loginController.showPassValue.value);

            //     }, icon: loginController.showPassValue.value == false ? SvgPicture.asset(Constants.eyeIcon, height: 20, color: PRIMARY_COLOR,):Icon(Icons.visibility_off,color: PRIMARY_COLOR)),
            //   )
            // ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                alignment: Alignment.topRight,
                child: Text(
                  Constants.doPassword,
                  style: textStyleTextStyle(context, PRIMARY_COLOR),
                ),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 16),
              child: shadowButton(Constants.sign_in, 60, PRIMARY_COLOR, () {
                loginUser();
              }, double.infinity, PRIMARY_COLOR.withOpacity(0.18)),
            ),
            //  Padding(
            //    padding: const EdgeInsets.fromLTRB(40, 0, 40, 16),
            //    child: shadowButton(Constants.sign_up, 60, SIGN_UP_TEXT_COLOR,
            //    () {
            //      Navigator.push(
            //        context,
            //        MaterialPageRoute(builder: (context) => SignUp()),
            //      );
            //    },double.infinity, WHITE_COLOR_F4),
            //  ),
            // SizedBox(
            //   height: 5,
            // )
          ]),
        ),
      );
    });
  }
}
