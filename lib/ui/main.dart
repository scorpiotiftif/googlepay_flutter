
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:googlepay_flutter/ui/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Stripe.instance.applySettings();
  runApp(const MyApp());
}