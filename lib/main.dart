import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'Stripe/HomeScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51Mh59hSDOOUR3dmVGpEeuP9ZrtoBaADJX52rS9wQ2ICf9Rz5uUSm7Qo5TrmrpbbFvyULshGEXSWx8jLgRc3ssLrj00Ss1Yfs7X";
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: exampleAppTheme,
        home: const HomeScreen(),
        navigatorObservers: const [],
    );
  }
}

final exampleAppTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Color(0xff6058F7),
    secondary: Color(0xff6058F7),
  ),
  primaryColor: Colors.white,
  appBarTheme: const AppBarTheme(elevation: 1),
);
