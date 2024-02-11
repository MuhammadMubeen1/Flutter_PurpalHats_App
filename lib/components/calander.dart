//
// import 'dart:core';
// import 'dart:core';
// import 'dart:js';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// Future<void>DateTime()  {
//       DateTime? pickedDate = await showDatePicker(
//           context: context,
//           initialDate: DateTime.now(), //get today's date
//           firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
//           lastDate: DateTime(2024),
//           builder: (BuildContext? context, Widget? child)
//           {
//
//             return Theme(data:  ThemeData.light().copyWith(
//                 primaryColor: const Color(0xff593D77),
//                 accentColor: const Color(0xff593D77),
//                 colorScheme: ColorScheme.light(primary: const Color(0xff593D77)),
//                 buttonTheme: ButtonThemeData(
//                     textTheme: ButtonTextTheme.primary
//                 )) ,child: child!);
//           }
//
//       );
//
//       if(pickedDate != null ){
//         print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
//         String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
//         print(formattedDate); //formatted date output using intl package =>  2022-07-04
//         //You can format date as per your need
//
//         setState(() {
//           dateController.text = formattedDate; //set foratted date to TextField value.
//         });
//       }else{
//         print("Date is not selected");
//       }
//     },
//
//
//   }
// }
