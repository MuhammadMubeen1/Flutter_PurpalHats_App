// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:property_managment/button.dart';
import 'package:property_managment/components/app_bar.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:get/get.dart';
import 'package:property_managment/components/text_field.dart';
import 'package:property_managment/module/Tanent/my_info.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/loading.dart';

class InternalTransfer extends StatefulWidget {
  const InternalTransfer({Key? key}) : super(key: key);

  @override
  State<InternalTransfer> createState() => _InternalTransferState();
}

class _InternalTransferState extends State<InternalTransfer> {
  TextEditingController _clientTitle = TextEditingController();
  TextEditingController _Address2Controller = TextEditingController();
  TextEditingController _phone2Controller = TextEditingController();
  TextEditingController _email2Controller = TextEditingController();
  TextEditingController _locationcontroller = TextEditingController();
  TextEditingController date3Controller = TextEditingController();
  List<Placemark>? placemarks;
  Position? position;
  final _formss = GlobalKey<FormState>();
  void _saveForm() async {
    late final isValid = _formss.currentState?.validate();
    if (isValid!) {
      Get.dialog(loading());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Color(0xff593D77),
          content: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              'Please Wait ......!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Color(0xff593D77),
          content: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              'Request Send Sucessfully...',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );

      startTime();
    }
  }

  startTime() async {
    var duration = Duration(seconds: 7);
    return Timer(duration, route);
  }

route()async{


       SharedPreferences storage = await SharedPreferences.getInstance();
    // Get user Type here...
    final name = await storage.getString('name'); //get current user name..
    final email = await storage.getString('email');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyInfo(email: email,name: name,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        appBar: buildNavigationBar(context, "Internal Transfer"),
        body: SingleChildScrollView(
          child: Form(
            key: _formss,
            child: Container(
              // height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        Constants.clientInfo,
                        style: headingTextStyle(
                          context,
                          Color(0xff593D77),
                        ),
                      )),
                  SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(
                       
                        validator: ((val) =>
                            val.isEmpty ? "Please enter client title!" : null),
                        textController: _clientTitle,
                        contentPadding: EdgeInsets.all(10),
                        //textController: controller,
                        readOnly: false,
                        hintText: Constants.client_title,
                        hintStyle:
                            hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                        // validator: FormValidator.titleValidator
                        ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                        
                          validator: ((val) =>
                              val.isEmpty ? "Please enter address!" : null),
                          contentPadding: EdgeInsets.all(10),
                          textController: _Address2Controller,
                          readOnly: false,
                          hintText: Constants.address,
                          hintStyle:
                              hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                          // validator: FormValidator.titleValidator
                          )),
                  SizedBox(height: 10),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                       
                          validator: ((val) =>
                              val.isEmpty ? "Please enter phone no!" : null),
                          contentPadding: EdgeInsets.all(10),
                          textController: _phone2Controller,
                          readOnly: false,
                          hintText: Constants.phone,
                          hintStyle:
                              hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                          // validator: FormValidator.titleValidator
                          )),
                  SizedBox(height: 10),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                        
                          validator: ((val) =>
                              val.isEmpty ? "Please enter email!" : null),
                          contentPadding: EdgeInsets.all(10),
                          textController: _email2Controller,
                          readOnly: false,
                          hintText: Constants.email,
                          hintStyle:
                              hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                          // validator: FormValidator.titleValidator
                          )),
                  SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        Constants.location,
                        style: headingTextStyle(
                          context,
                          PRIMARY_COLOR,
                        ),
                      )),
                  SizedBox(height: 10),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                        
                          validator: ((val) =>
                              val.isEmpty ? "Please enter Location!" : null),
                          contentPadding: EdgeInsets.all(10),
                          textController: _locationcontroller,
                          readOnly: false,
                          hintText: Constants.lahore,
                          hintStyle:
                              hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                          // validator: FormValidator.titleValidator
                          )),
                  SizedBox(height: 10),
                  Center(
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 3),
                            behavior: SnackBarBehavior.floating,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Color(0xff593D77),
                            content: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.pink, Colors.purple],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Text(
                                'Please Wait ......!',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                        getUserLocationAddress();
                      },
                      child: Container(
                        width: 160,
                        height: 40,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 5.0),
                                blurRadius: 6.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                            color: Color(0xff593D77)),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Get my Location",
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: GestureDetector(
                      onTap: () {
                        // if (Get.isDialogOpen!) Get.back();

                        // Future.delayed(
                        //   const Duration(seconds: 5),
                        // );
                        mydate();
                      },
                      child: Row(
                        children: [
                          Text('Select Date',
                              style:
                                  headingTextStyle(context, Color(0xff593D77))),
                          // SizedBox(width: 95,),

                          // Text('Today',style: TextStyle(color:Color(0xff593D77),fontWeight: FontWeight.bold),),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(Icons.calendar_month,
                              size: 20, color: Color(0xff593D77)),
                          Padding(
                            padding: EdgeInsets.only(left: 100),
                            child: Container(
                              height: 25,
                              width: 100,
                              child: TextFormField(
                                validator: ((val) =>
                                    val!.isEmpty ? "Please enter Date" : null),
                                controller: date3Controller,
                                //editing controller of this TextField
                                decoration: InputDecoration(

                                    //icon of text field
                                    // labelText: "Enter Date" //label text of field
                                    ),
                                readOnly: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: PRIMARY_COLOR,
                      indent: 20,
                      endIndent: 10,
                      thickness: 2,
                    )),
                    Text(Constants.info),
                    Expanded(
                        child: Divider(
                      color: PRIMARY_COLOR,
                      indent: 10,
                      endIndent: 20,
                      thickness: 2,
                    )),
                  ]),
                  SizedBox(height: 10),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Tanent",
                                style:
                                    textStyleTextStyle(context, PRIMARY_COLOR),
                              ),
                              SizedBox(height: 10),
                              Text("Address",
                                  style: textStyleTextStyle(
                                      context, PRIMARY_COLOR)),
                              SizedBox(height: 10),
                              Text("Phone:",
                                  style: textStyleTextStyle(
                                      context, PRIMARY_COLOR)),
                              SizedBox(height: 10),
                              Text("Email",
                                  style: textStyleTextStyle(
                                      context, PRIMARY_COLOR)),
                            ],
                          ),
                        ),
                        Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              SizedBox(height: 10),
                              Text(
                                "John Doe",
                                style: hintTextStyle(
                                    context, INPUT_FIELD_TEXT_COLOR),
                              ),
                              SizedBox(height: 10),
                              Text("Apart # 101 Oregon, 945368 CA",
                                  style: hintTextStyle(
                                      context, INPUT_FIELD_TEXT_COLOR)),
                              SizedBox(height: 10),
                              Text("+1 111 0222 33",
                                  style: hintTextStyle(
                                      context, INPUT_FIELD_TEXT_COLOR)),
                              SizedBox(height: 10),
                              Text("johndoe@gmail.com",
                                  style: hintTextStyle(
                                      context, INPUT_FIELD_TEXT_COLOR)),
                            ]))
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: shadowButton(
            Constants.pswd_rest_btn,
            60,
            Color(0xff593D77),
            () {
              _saveForm();
            },
            double.infinity,
            PRIIMARY_BASIC,
          ),
        ));
  }

  mydate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime.now(),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2024),
        builder: (BuildContext? context, Widget? child) {
          return Theme(
              data: ThemeData.light().copyWith(
                  primaryColor: const Color(0xff593D77),
                  accentColor: const Color(0xff593D77),
                  colorScheme:
                      ColorScheme.light(primary: const Color(0xff593D77)),
                  buttonTheme:
                      ButtonThemeData(textTheme: ButtonTextTheme.primary)),
              child: child!);
        });

    if (pickedDate != null) {
      print(
          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      // print(
      //     formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      setState(() {
        date3Controller.text =
            formattedDate; //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  getUserLocationAddress() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      //nothing
    }

    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    position = newPosition;

    placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);

    Placemark pMark = placemarks![0];

    String fullAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare} ${pMark.isoCountryCode}: ${pMark.street}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

    _locationcontroller.text = fullAddress;

    _locationcontroller.text = fullAddress;
  }
}
