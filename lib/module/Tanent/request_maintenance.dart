// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:property_managment/API/task_list_api.dart';
import 'package:property_managment/button.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/components/text_field.dart';
import 'package:property_managment/models/agent_model/services/listapi_services.dart';
import 'package:property_managment/module/Tanent/internal_transfer.dart';
import 'package:intl/intl.dart';
import 'package:property_managment/utils/constant.dart';
import '../../API/list_api.dart';
import '../../API/maintence_request_api.dart';
import '../../components/dropdown.dart';
import '../../components/dropdown.dart';
import '../../components/loading.dart';
import '../../models/agent_model/services/maintence_request.dart';
class RequestMaintenance extends StatefulWidget {
  late final ValueChanged<String> onSubmit;
  @override
  State<RequestMaintenance> createState() => _RequestMaintenanceState();
}

class _RequestMaintenanceState extends State<RequestMaintenance> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController description = TextEditingController();
  bool userNameValidate = false, isUserNameValidate = false;
  MiantenceReq maint = MiantenceReq();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  MaintenanceRequestClass? maintenanceRequest;
  final _form = GlobalKey<FormState>();
  @override
  void initState() {
    // maint.submitMaintenanceRequest(
    //     context: context,
    //     title: nameController.text,
    //     description: description.text,
    //     visit_date: dateController.text,
    //     property_id: '15',
    //     entry_permission: 'yes_with_any_time',
    //     sessionid: '157');

    _saveForm();
    super.initState();
  }

  DateTime _dateTime = DateTime.now();
  bool _validate = false;
  // show time picker method
  void _showTimePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2025),
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
        }).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  void _saveForm() async {


    late final isValid = _form.currentState?.validate();

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

     
      var src = await maint.submitMaintenanceRequest(
          context: context,
          title: nameController.text,
          description: description.text,
          visit_date: dateController.text,
          property_id: '15',
          entry_permission: 'yes_with_any_time',
          sessionid: '157');
      setState(() {
        maintenanceRequest = src;
      });

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
              'Request Send Sucessfully.  Back to home screen!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
   }

    // ignore: use_build_context_synchronously
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: WHITE_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: WHITE_COLOR,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: PRIMARY_COLOR,
          ),
        ),
        title: Text(
          "Request Maintenance",
          style: labelTextStyle(context),
        ),
      ),
      body: maintenanceWidget(context),
    );
  }

  Widget maintenanceWidget(context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Center(child: Text(services.length.toString())),
              SizedBox(height: 10),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Add A Tittle",
                    style: headingTextStyle(
                      context,
                      Color(0xff593D77),
                    ),
                  )),
              SizedBox(height: 10),
              Container(
                  width: 335,
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  child: CustomTextField(
                     
                      cursorColor: PRIMARY_COLOR,
                      validator: ((val) =>
                          val.isEmpty ? "Please enter title" : null),
                      // autovalidateMode: AutovalidateMode.onUserInteraction,

                      textController: nameController,
                      contentPadding: EdgeInsets.all(10),
                      // textController: controller,
                      readOnly: false,
                      hintText: 'title',
                      hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                      // validator: FormValidator.titleValidator
                      )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Select Services",
                  style: headingTextStyle(
                    context,
                    Color(0xff593D77),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 3),
                padding: EdgeInsets.all(10),
                height: 70,
                width: 345,
                child: Dropdown(),
              ),

              SizedBox(height: 10),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Add A Description",
                      style: headingTextStyle(context, Color(0xff593D77)))),
              SizedBox(height: 10),
              Container(
                height: 100,
                width: 315,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    // color: grey_Input,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: TextFormField(
                    //cursorColor: Color(0xff999CAD),
                    maxLines: 3,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Color(0xffE8E6EA)),
                      ),
                      hintText: 'Write description here',
                      hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Color(0xffE8E6EA)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: ((val) =>
                        val!.isEmpty ? "Please enter Description" : null),
                    controller: description,
                    keyboardType: TextInputType.multiline,
                    enabled: true,
                    cursorColor: PRIMARY_COLOR,
                    readOnly: false,

                    // textcolor:  certificate_text,

                    // textController: _summaryController,
                    onFieldSubmitted: (val) {},
                    onChanged: (val) {},
                    // validator: ((val) =>
                    //     val.isEmpty ? "Please enter Description" : null),
                    onSaved: (newVal) {}),
              ),
              //
              // SizedBox(height: 0),
              SizedBox(
                height: 15,
              ),
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
                          style: headingTextStyle(context, Color(0xff593D77))),
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
                              validator: ((val) =>
                                  val!.isEmpty ? "Please enter Date" : null),
                              controller:
                                  dateController, //editing controller of this TextField
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
              SizedBox(
                height: 15,
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
              SizedBox(height: 18),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            "Tanent",
                            style: textStyleTextStyle(context, PRIMARY_COLOR),
                          ),
                          SizedBox(height: 10),
                          Text("Address",
                              style:
                                  textStyleTextStyle(context, PRIMARY_COLOR)),
                          SizedBox(height: 10),
                          Text("Phone:",
                              style:
                                  textStyleTextStyle(context, PRIMARY_COLOR)),
                          SizedBox(height: 10),
                          Text("Email",
                              style:
                                  textStyleTextStyle(context, PRIMARY_COLOR)),
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
                            style:
                                hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
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
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 16),
                  child: shadowButton(
                    Constants.pswd_rest_btn,
                    60,
                    PRIMARY_COLOR,
                    () {
                      setState(() {
                        _saveForm();
                      });
                    },
                    double.infinity,
                    PRIIMARY_BASIC,
                  )),
            ],
          ),
        ),
      ),
    );
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
        dateController.text =
            formattedDate; //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }
}
