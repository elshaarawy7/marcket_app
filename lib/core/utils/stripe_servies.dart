import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:market_app/core/utils/api_key.dart';
import 'package:market_app/core/utils/api_servies.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intant_model.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intet_input_model.dart';

class StripeServies {

  final ApiServies  api_servies = ApiServies();
 Future <PaymentIntantModel>createPaymentIntent(PaymentIntantModel paymentIntantnodel)async{

     final inputModel = PaymentIntetInputModel(
    amount: paymentIntantnodel.amount.toString(),
    currency: paymentIntantnodel.currency.toString(),
  );

   var response = await  api_servies.post(
      body: inputModel.tojson() ,
      url: 'https://api.stripe.com/v1/payment_intents', 
      token: ApiKey.secretKey, 
    ); 

    var paymentIntetModel =PaymentIntantModel.fromJson(response.data) ;

    return paymentIntetModel; 

    
  } 

  Future iniPaymantSheet({required String  paymentIntentClientSecret})async{
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:  paymentIntentClientSecret , 
        merchantDisplayName: "Elshaarawy"
      ) , 
      
    );
  }
}