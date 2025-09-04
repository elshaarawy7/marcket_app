import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:market_app/core/utils/api_key.dart';
import 'package:market_app/core/utils/api_servies.dart';
// تأكد من أن أسماء الملفات هذه صحيحة
import 'package:market_app/futcher/chekout_futcher/inint_payment_sheetmodel.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/femoural_key/femoural_key.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intant_model.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intet_input_model.dart';

class StripeServies {
  // من الأفضل تعريف ApiServies مرة واحدة واستخدامها
  final ApiServies apiServies = ApiServies();

  // 1. دالة إنشاء Payment Intent
  Future<PaymentIntantModel> createPaymentIntent(
    PaymentIntetInputModel paymentInputModel,
  ) async {
    var response = await apiServies.post(
      body: paymentInputModel.tojson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKey
          .secretKey, // سيتم استخدامه في ApiServies لإضافة "Bearer " + token
      contentTyep: Headers.formUrlEncodedContentType,
      // ✅ إضافة هيدر الإصدار هنا أيضاً لضمان الاتساق
      headers: {'Stripe-Version': '2024-06-20'},
    );

    var paymentIntantModel = PaymentIntantModel.fromJson(response.data);
    return paymentIntantModel;
  }

  // 2. دالة إنشاء Ephemeral Key
  Future<FemouralKeyModel> createEmpherKey({required String customerId}) async {
    var response = await apiServies.post(
      // ✅ تصحيح الـ body
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token:
          ApiKey.secretKey, // الاعتماد على ApiServies لإضافة الـ Authorization
      contentTyep: Headers.formUrlEncodedContentType,
      // ✅ تمرير الهيدر الخاص بالإصدار فقط
      headers: {'Stripe-Version': '2024-06-20'},
    );

    var femouralKeyModel = FemouralKeyModel.fromJson(response.data);
    return femouralKeyModel;
  }

  // 3. دالة تهيئة Payment Sheet
  Future iniPaymantSheet({
    required InitiPaymentSheetInputModel initiPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initiPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initiPaymentSheetInputModel.customerId,
        merchantDisplayName: "Elshaarawy",
      ),
    );
  }

  // 4. دالة عرض Payment Sheet
  Future dispPlayPaymantSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // 5. الدالة الرئيسية التي تجمع كل الخطوات
  Future mackupPayment({
    required PaymentIntetInputModel paymentInputModel,
  }) async {
    // الخطوة الأولى: إنشاء Payment Intent
    var paymentIntantModel = await createPaymentIntent(paymentInputModel);

    // الخطوة الثانية: إنشاء Ephemeral Key
    // ✅ تصحيح الخطأ الإملائي من cusomer_id إلى customerId
    var ephomralkeyModel = await createEmpherKey(
      customerId: paymentInputModel.customer_id,
    );

    // تجميع البيانات لتهيئة الـ Payment Sheet
    var initiPaymentSheetInputModel = InitiPaymentSheetInputModel(
      clientSecret: paymentIntantModel.clientSecret!,
      customerId: paymentIntantModel.customer, // Stripe يرجع customer ID هنا
      ephemeralKeySecret: ephomralkeyModel.secret!,
    );

    // الخطوة الثالثة: تهيئة Payment Sheet
    await iniPaymantSheet(
      initiPaymentSheetInputModel: initiPaymentSheetInputModel,
    );

    // الخطوة الرابعة: عرض Payment Sheet للمستخدم
    await dispPlayPaymantSheet();
  }
}
