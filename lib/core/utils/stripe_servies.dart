import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:market_app/core/utils/api_key.dart';
import 'package:market_app/core/utils/api_servies.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/femoural_key/femoural_key.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intant_model.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intet_input_model.dart';

class StripeServies {
  final ApiServies api_servies = ApiServies();

  Future<PaymentIntantModel> createPaymentIntent(
    PaymentIntetInputModel paymentInputModel,
  ) async {
    var response = await api_servies.post(
      body: paymentInputModel.tojson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKey.secretKey,
      contentTyep: Headers.formUrlEncodedContentType,
    );

    print("Stripe Response: ${response.data}");

    var paymentIntantModel = PaymentIntantModel.fromJson(response.data);
    return paymentIntantModel;
  }

  Future iniPaymantSheet({required String paymentIntentClientSecret , required String femouralKeySeckret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        customerEphemeralKeySecret: femouralKeySeckret,
        customerId: ,
        merchantDisplayName: "Elshaarawy",
      ),
    );
  }

  Future dispPlayPaymantSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future mackupPayment({
    required PaymentIntetInputModel paymentInputModel,
  }) async {
    var paymentIntantModel = await createPaymentIntent(paymentInputModel);
    await iniPaymantSheet(
      paymentIntentClientSecret: paymentIntantModel.clientSecret!,
    );
    await dispPlayPaymantSheet();
  }  

   Future<FemouralKeyModel> createEmpherKey({required String cusomer_id }) async {
    var response = await api_servies.post(
      body: {
        {
          'customer' : cusomer_id ,
        },
      },
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKey.secretKey,
      headers: {
         "Authorization": "Bearer${ApiKey.secretKey}",
         'Stripe-Version' : '2024-06-20'
      }
    );

    print("Stripe Response: ${response.data}");

    var femouralKeyModel= FemouralKeyModel.fromJson(response.data);
    return femouralKeyModel ;
  }



}
