// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, use_key_in_widget_constructors, unused_import, sort_child_properties_last

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:property_managment/button.dart';
import 'package:property_managment/components/app_bar.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:get/get.dart';
import 'package:property_managment/components/stripe_payment.dart';
import 'package:property_managment/module/Tanent/request_maintenance.dart';
import 'package:property_managment/module/sign_in.dart';

import '../../components/loading.dart';

class RentPayment extends StatefulWidget {
  @override
  State<RentPayment> createState() => _RentPaymentState();
}

class _RentPaymentState extends State<RentPayment>
    with TickerProviderStateMixin {
  @override
  Map<String, dynamic>? paymentIntentData;
  bool isLoading = false;

  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: buildNavigationBar(context, "Rent Payments"),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                color: PRIMARY_COLOR,
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 19, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text("Rent Payment",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Apart # 101 Oregon,CA",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffC7C7C7))),
                            ],
                          ),
                          Text(
                            "Due Date: Thursday, June 2, 2019",
                            style: TextStyle(
                                color: Color(0xffC7C7C7),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Amount: 500.30 CAD",
                            style: TextStyle(
                                color: Color(0xffC7C7C7),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 85,
                        height: 35,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              textStyle: TextStyle(
                                fontSize: 18,
                              ),
                              minimumSize: Size.fromHeight(70),
                            ),
                            child: Text(
                              "Pay",
                              style: TextStyle(color: Color(0xff593D77)),
                            ),
                            onPressed: () async {
                              if (Get.isDialogOpen!) Get.back();

                              Get.dialog(loading());
                              Future.delayed(
                                  const Duration(seconds: 5), () => "5");
                              makePayment();
                              // showDialog(
                              //   barrierDismissible: false,
                              //   builder: (ctx) {
                              //     return Center(
                              //       child: isLoading
                              //           ? CircularProgressIndicator(
                              //               strokeWidth: 5,
                              //               backgroundColor: Colors.white,
                              //               color: Color(0xff593D77),
                              //             )
                              //           : Text(''),
                              //     );
                              //   },
                              //   context: context,
                              // );

                              // if (isLoading) return;

                              // setState(() {
                              //   isLoading = true;
                              // });
                              // await Future.delayed(Duration(seconds: 5));
                              // setState(() {
                              //   isLoading=false;
                              // });
                            }))
                  ],
                ),
              ),
            ),
            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: GREY_COLOR,
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 19, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Rent Payment",
                                style: TextStyle(
                                    color: Color(0xff959595),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Apart # 101 Oregon,CA",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff959595))),
                            ],
                          ),
                          Text(
                            "Due Date: Thursday, June 2, 2019",
                            style: TextStyle(color: Color(0xff959595)),
                          ),
                          Text(
                            "Amount: 500.30 CAD",
                            style: TextStyle(color: Color(0xff959595)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    shadowButton(Constants.pAYED, 35, Colors.white, () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              RequestMaintenance(),
                        ),
                      );
                    }, Get.width / 4, Color(0xffB8B8B8))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent('20', 'USD');

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  setupIntentClientSecret:
                      'sk_test_51MRaTJF6Z1rhh5U4coAffyEf0hQrV820sQzwuAo7xBKpvGw0mBaz6pNCBtXrZoYTJZxH9uIZCxK7rEAKUKK3VZPA00pGIqUKA1',
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  customFlow: true,
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Kashif'))
          .then((value) {});

      displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        // ignore: avoid_print
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51MRaTJF6Z1rhh5U4coAffyEf0hQrV820sQzwuAo7xBKpvGw0mBaz6pNCBtXrZoYTJZxH9uIZCxK7rEAKUKK3VZPA00pGIqUKA1',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
