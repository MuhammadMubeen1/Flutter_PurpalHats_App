import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getUser();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            await makePayment();
          },
          child: Container(
            height: 50,
            width: 200,
            color: Colors.green,
            child: const Center(
              child: Text(
                'Pay',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic>? paymentIntentData;
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
