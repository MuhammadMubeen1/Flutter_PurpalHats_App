// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:property_managment/Auth/user.dart';
import 'package:intl/intl.dart';
import 'package:property_managment/button.dart';
import 'package:property_managment/components/app_bar.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:get/get.dart';
import 'package:property_managment/components/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/loading.dart';
import 'package:image_picker/image_picker.dart';

import 'home_screen.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({
    Key? key,
    required this.email,
    required this.name,
    //  required this.userId,
  }) : super(key: key);

  final String? name;
  final String? email;
  // final String? userId;

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _AddressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController govtcontroller = TextEditingController();
  TextEditingController date2Controller = TextEditingController();
  TextEditingController _GenController = TextEditingController();
  List<String> _genders = ['Male', 'Female', 'Other'];

  PickedFile? imageFile;
  final ImagePicker picker = ImagePicker();

  //ge
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    setState(() {});
  }

  @override
  String? _selectedGender;
  final _forms = GlobalKey<FormState>();

  void _saveForm() async {
    late final isValid = _forms.currentState?.validate();
    if (isValid!) {
      Get.dialog(loading());
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
              'Info Update Sucessfully.  Back to home screen!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
      startTime();
    }
  }

  startTime() async {
    var duration = Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    // Get user Type here...
    final name = await storage.getString('name'); //get current user name..
    final email = await storage.getString('email'); //get current user email..

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => TanentHomeScreen(
                  email: email,
                  name: name,
                  userId: 'user_id',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        appBar: buildNavigationBar(context, "My Info"),
        body: SingleChildScrollView(
          child: Form(
            key: _forms,
            child: Container(
              height: 1100,
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(top: 0),
                          child:  CircleAvatar(
                            radius: 50,
                            backgroundColor: WHITE_COLOR,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage:imageFile == null?
                               AssetImage(
                                Constants.profile_IMGG,
                              ):FileImage(File(imageFile!.path) )
                              as ImageProvider,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10.0,
                          right: 10.0,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomsheet()));
                            },
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      ]),
                    ),

                    SizedBox(height: 15),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomTextField(
                            textController: _nameController,
                            contentPadding: EdgeInsets.all(10),
                            validator: ((val) =>
                                val.isEmpty ? "Please enter name!" : null),
                            // textController: controller,
                            readOnly: true,
                            //hintText: widget.name??'null',
                            hintStyle:
                                hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                            // validator: FormValidator.titleValidator
                            )),
                    SizedBox(height: 10),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomTextField(
                            validator: ((val) =>
                                val.isEmpty ? "Please enter address!" : null),
                            contentPadding: EdgeInsets.all(10),
                            textController: _AddressController,
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
                            contentPadding: EdgeInsets.all(10),
                            textController: _phoneController,
                            validator: ((val) =>
                                val.isEmpty ? "Please enter phone!" : null),
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
                            contentPadding: EdgeInsets.all(10),
                            textController: _emailController,
                            readOnly: true,
                            validator: ((val) =>
                                val.isEmpty ? "Please enter Email!" : null),
                            hintText: widget.email ?? 'N/l',
                            hintStyle:
                                hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                            // validator: FormValidator.titleValidator
                            )),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: GestureDetector(
                        onTap: () {
                          // if (get.isDialogOpen!) Get.back();

                          // Get.dialog(loading());
                          // Future.delayed(
                          //   const Duration(seconds: 5),
                          // );
                          mydate();
                        },
                        child: Row(
                          children: [
                            Text('Select Date',
                                style: headingTextStyle(
                                    context, Color(0xff593D77))),
                            // SizedBox(width: 95,),

                            // Text('Today',style: TextStyle(color:Color(0xff593D77),fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(Icons.calendar_month,
                                size: 20, color: Color(0xff593D77)),
                            Padding(
                              padding: EdgeInsets.only(left: 100),
                              child: Center(
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  child: TextFormField(
                                    validator: ((val) => val!.isEmpty
                                        ? "Please enter Date"
                                        : null),
                                    controller:
                                        date2Controller, //editing controller of this TextField
                                    decoration: InputDecoration(
                                        // focusedBorder:OutlineInputBorder(
                                        //   borderSide: const BorderSide(color: Color(0xff593D77), ),
                                        // )
                                        //labelText: "Enter Date",
                                        //   border: OutlineInputBorder(
                                        //   borderRadius: BorderRadius.circular(8),
                                        //   borderSide:  BorderSide( color: Color(0xffE8E6EA)),
                                        // ),
                                        //icon of text field
                                        // labelText: "Enter Date" //label text of field
                                        ),
                                    readOnly: true,
                                  ),
                                ), // whe
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          Constants.gender,
                          style: headingTextStyle(
                            context,
                            PRIMARY_COLOR,
                          ),
                        )),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Container(
                        height: 50,
                        width: 335,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: DropdownButton<String>(
                          value: _selectedGender,
                          hint: Text(
                            "Gender Please!",
                            style: TextStyle(color: Colors.grey),
                          ),
                          items: _genders.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Color(0xffff593D77)),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedGender = newValue.toString();
                            });
                          },
                        ),
                      ),
                    ),

                    // child: CustomTextField(

                    //     contentPadding: EdgeInsets.all(10),
                    //       textController: _GenController,

                    //          validator: ((val) =>
                    //         val.isEmpty ? "Please enter Gender!" : null),

                    //     // validator: FormValidator.titleValidator

                    //     readOnly: false,
                    //     hintText: Constants.name,
                    //     hintStyle:
                    //         hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    //     // validator: FormValidator.titleValidator
                    //     )),
                    SizedBox(height: 10),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          Constants.gov_ID,
                          style: headingTextStyle(
                            context,
                            PRIMARY_COLOR,
                          ),
                        )),
                    SizedBox(height: 10),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomTextField(
                            contentPadding: EdgeInsets.all(10),
                            textController: govtcontroller,
                            validator: ((val) =>
                                val.isEmpty ? "Please enter GovtId!" : null),
                            readOnly: false,
                            hintText: Constants.Id_no,
                            hintStyle:
                                hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                            // validator: FormValidator.titleValidator
                            )),

                    // SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: shadowButton(
            Constants.upload_info,
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
        date2Controller.text =
            formattedDate; //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  Widget bottomsheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo!",
            style: TextStyle(
                fontSize: 20.0,
                color: Color(0xff593D77),
                fontStyle: FontStyle.normal),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all((Color(0xff593D77))),
                    padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text("Camera")),
              SizedBox(
                width: 50,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all((Color(0xff593D77))),
                    padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                  ),
                  icon: Icon(Icons.image),
                  label: Text("Gallery")),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedfile = await picker.getImage(source: source);
    setState(() {
      imageFile= pickedfile;
    
    });
  }
}
