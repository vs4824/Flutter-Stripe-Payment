# flutter stripe payment

The Stripe Flutter SDK allows you to build delightful payment experiences in your native Android and iOS apps using Flutter. We provide powerful and customizable UI screens and elements that can be used out-of-the-box to collect your users' payment details.

## Features

1. Simplified Security: We make it simple for you to collect sensitive data such as credit card numbers and remain PCI compliant. This means the sensitive data is sent directly to Stripe instead of passing through your server. For more information, see our Integration Security Guide.

2. Apple Pay: We provide a seamless integration with Apple Pay.

3. Google Pay: The plugin can easily act as payment provider for the Pay plugin that enables you to seamlessly integrate Google Pay or Apple Pay. All you need to do is add your stripe publishable key to the payment profile.

4. Payment methods: Accepting more payment methods helps your business expand its global reach and improve checkout conversion.

5. SCA-Ready: The SDK automatically performs native 3D Secure authentication if needed to comply with Strong Customer Authentication regulation in Europe.

6. Native UI: We provide native screens and elements to securely collect payment details on Android and iOS.

7. Pre-built payments UI: Learn how to integrate Payment Sheet, the new pre-built payments UI for mobile apps. This pre-built UI lets you accept cards, Apple Pay, and Google Pay out of the box, and includes support for saving & reusing cards.

### Recommended usage

If you're selling digital products or services within your app, (e.g. subscriptions, in-game currencies, game levels, access to premium content, or unlocking a full version), you must use the app store's in-app purchase APIs. See Apple's and Google's guidelines for more information. For all other scenarios you can use this SDK to process payments via Stripe.

#### Introduction

   `dart pub add flutter_stripe`
   
##### Requirements

##### Android

This plugin requires several changes to be able to work on Android devices. Please make sure you follow all these steps:

1. Use Android 5.0 (API level 21) and above
2. Use Kotlin version 1.5.0 and above: [example](https://github.com/flutter-stripe/flutter_stripe/blob/79b201a2e9b827196d6a97bb41e1d0e526632a5a/example/android/ .gradle#L2)
3. Using a descendant of Theme.AppCompat for your activity: example, example night theme
4. Using an up-to-date Android gradle build tools version: example and an up-to-date gradle version accordingly: example
5. Using FlutterFragmentActivity instead of FlutterActivity in MainActivity.kt: example
6. Rebuild the app, as the above changes don't update with hot reload
7. These changes are needed because the Android Stripe SDK requires the use of the AppCompat theme for their UI components and the Support Fragment Manager for the Payment Sheets

If you are having troubles to make this package to work on Android, join this discussion to get some support

##### iOS

Compatible with apps targeting iOS 12 or above.

To upgrade your iOS deployment target to 12.0, you can either do so in Xcode under your Build Settings, or by modifying IPHONEOS_DEPLOYMENT_TARGET in your project.pbxproj directly.

You will also need to update in your Podfile:

   `platform :ios, '12.0'`

##### Web (Experimental)

Now you can use Stripe with Flutter web! Notice right now it is highly experimental and only a subset of features is implemented.

To use Stripe on web, it is required to add flutter_stripe_web in your pubspec file


###### Usage

Financial connections

We also support Financial connections in our latest sdk. Check out the docs to learn more on how to set it up.

###### Stripe initialization

To initialize Stripe in your Flutter app, use the Stripe base class.

Stripe offers publishableKey, stripeAccountId, threeDSecureParams and merchantIdentifier. Only publishableKey is required.

###### Dart API

The library offers several methods to handle stripe related actions:

  `Future<PaymentMethod> createPaymentMethod(...);
  Future<PaymentIntent> handleNextAction(...);
  Future<PaymentIntent> confirmPayment(...);
  Future<void> configure3dSecure(...);
  Future<bool> isApplePaySupported();
  Future<void> presentApplePay(...);
  Future<void> confirmApplePayPayment(...);
  Future<SetupIntent> confirmSetupIntent(...);
  Future<PaymentIntent> retrievePaymentIntent(...);
  Future<String> createTokenForCVCUpdate(...);

  Future<void> initPaymentSheet(...);
  Future<void> presentPaymentSheet(...);
  Future<void> confirmPaymentSheetPayment()`

The example app offers examples on how to use these methods.


