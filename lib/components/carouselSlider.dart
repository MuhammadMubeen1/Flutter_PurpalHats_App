import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:property_managment/module/Tanent/request_maintenance.dart';

import '../module/Tanent/internal_transfer.dart';
import '../module/Tanent/rent_payment.dart';

class CarousSlider extends StatefulWidget {
  const CarousSlider({Key? key}) : super(key: key);

  @override
  State<CarousSlider> createState() => _CarousSliderState();
}

class _CarousSliderState extends State<CarousSlider> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequestMaintenance()),
            );
          },
          child: Image.asset(
            "assets/svgs/maintence.png",
            fit: BoxFit.fill,
            width: Get.width,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InternalTransfer()),
            );
          },
          child: Image.asset(
            "assets/svgs/internalmaintence.png",
            fit: BoxFit.fill,
            width: Get.width,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  RentPayment()),
            );
          },
          child: Image.asset(
            "assets/svgs/payment.png",
            fit: BoxFit.fill,
            width: Get.width,
          ),
        ),
      ],

      // imageSliders,
      options: CarouselOptions(
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
  }
}
