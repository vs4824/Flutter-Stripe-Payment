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

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stripe Payment'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Make Payment',style: TextStyle(fontWeight: FontWeight.w600,
          fontSize: 20),),
          onPressed: ()async{
            await makePayment();
          },
          ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10', 'USD');
      //Payment Sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
              // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
              style: ThemeMode.dark,
              merchantDisplayName: 'Adnan')).then((value){
      });


      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet(
          ).then((value){
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green,),
                    Text("Payment Successfull"),
                  ],
                ),
              ],
            ), 
          ));
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntent = null;

      }).onError((error, stackTrace){
        print('Error is:--->$error $stackTrace');
      });


    } on StripeException catch (e) {
      print('Error is:---> $e');
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
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer sk_test_51Mh59hSDOOUR3dmVmDQzSCOciZllmh2ISIaXYrhj5uYpmu8NWdBDodgLPaVQooxqHbf2846dVrGolcMj5ZZR8PJn00Qz8Xh5x0',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body,
          );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100 ;
    return calculatedAmout.toString();
  }

}