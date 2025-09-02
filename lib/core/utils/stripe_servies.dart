import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:market_app/core/utils/api_key.dart';
import 'package:market_app/core/utils/api_servies.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intant_model.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intet_input_model.dart';

class StripeServies {
  final ApiServies api_servies = ApiServies();

  Future<PaymentIntantModel> createPaymentIntent(PaymentIntetInputModel paymentInputModel) async {
    var response = await api_servies.post(
      body: paymentInputModel.tojson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKey.secretKey,
    );

    var paymentIntantModel = PaymentIntantModel.fromJson(response.data);
    return paymentIntantModel;
  }

  Future iniPaymantSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "Elshaarawy",
      ),
    );
  }

  Future dispPlayPaymantSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future mackupPayment({required PaymentIntetInputModel paymentInputModel}) async {
    var paymentIntantModel = await createPaymentIntent(paymentInputModel);
    await iniPaymantSheet(
      paymentIntentClientSecret: paymentIntantModel.clientSecret!,
    );
    await dispPlayPaymantSheet();
  }
}
