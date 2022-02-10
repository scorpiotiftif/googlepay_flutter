import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:googlepay_flutter/ui/data/product.dart';
import 'package:http/http.dart' as http;
import 'package:pay/pay.dart' as google;

class InfoScreen extends StatelessWidget {
  final Product _product;

  late final _paymentItem;

  Future<Map<String, dynamic>> fetchPaymentIntentClientSecret() async {
    final url = Uri.parse('http://192.168.0.8:4242/create-payment-intent');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': 'example@gmail.com',
        'currency': 'usd',
        'items': [
          {'id': 'id'}
        ],
        'request_three_d_secure': 'any',
      }),
    );
    return json.decode(response.body);
  }

  Future<void> onGooglePayResult(paymentResult) async {
    print(paymentResult);
    final response = await fetchPaymentIntentClientSecret();
    final clientSecret = response['clientSecret'];
    final token =
    paymentResult['paymentMethodData']['tokenizationData']['token'];
    final tokenJson = Map.castFrom(json.decode(token));

    final params = PaymentMethodParams.cardFromToken(
      token: tokenJson['id'],
    );
    // Confirm Google pay payment method
    await Stripe.instance.confirmPayment(
      clientSecret,
      params,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fiche produit"),
        ),
        body: Column(
          children: [
            Image.network(_product.imageUrl),
            Text(_product.name),
            Text(_product.description),
            Text(_product.price.toString() + " €"),
            google.GooglePayButton(
              width: 156,
              paymentConfigurationAsset: 'pay/licenses/default_android_googlepay_license.json',
              paymentItems: _paymentItem,
              style: google.GooglePayButtonStyle.black,
              type: google.GooglePayButtonType.pay,
              onPaymentResult: onGooglePayResult,
            )
          ],
        ));
  }

  InfoScreen(this._product, {Key? key}) : super(key: key) {
    _paymentItem = [
      google.PaymentItem(
        label: _product.name,
        amount: _product.price.toString(),
        status: google.PaymentItemStatus.final_price,
      )
    ];
  }
}
