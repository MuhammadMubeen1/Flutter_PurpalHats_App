import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/API/list_api.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';

import '../models/agent_model/services/listapi_services.dart';

class Dropdown extends StatefulWidget {
  Dropdown();

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  Services sr = Services();

  get items => null;

  @override
  void initState() {
    getServices();

    super.initState();
    //sr.services(context, '153');
  }

  String? currentValue;
  List<Service> services = [];
  String? selectedValue;
  void getServices() async {
    var src = await sr.services(context, '157');
    final uniqueServices = services.toSet().toList();
    setState(() {
      services = src;

      //  uniqueServices.map((services) =>
      // DropdownMenuItem(value: services.id, child:
      //  Text(services.name.toString()))).toList();
      //     currentValue = items[0].value;
    });
  }

  // show time picker method
  // final List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(

        child: Container(
          height: 70,
          width: 335,
        
          child: DropdownButton<String>(
            hint: Center(child: Text("Select Services...", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),)),
            value: selectedValue,
            items: services.map((value) {
              return DropdownMenuItem<String>(
                value: value.name,
                child: Text(value.name.toString()),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
          ),
        ),
      ),
    );
  }
}
