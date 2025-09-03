import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_app/core/errors/fuiler.dart';
import 'package:market_app/core/utils/stripe_servies.dart';
import 'package:market_app/futcher/chekout_futcher/data/model/repo/chek_out_repo.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intet_input_model.dart';

class CheakOutRepoIpml extends ChekOutRepo {
  final StripeServies stripeServies = StripeServies();
  @override
  Future<Either<Fuiler, void>> mackupPayment({
    required PaymentIntetInputModel paymentIntetInputModel,
  }) async {
    try {
      await stripeServies.mackupPayment(
        paymentInputModel: paymentIntetInputModel,
      );
      return right(null);
    } catch (e, s) {
      // <-- أضفنا 's' لتتبع تسلسل استدعاء الدوال
      // =========== هذا هو الجزء المهم ===========
      log('Caught error in CheakOutRepoIpml: ${e.runtimeType.toString()}');
      log('Error object: ${e.toString()}');
      log('Stack trace: ${s.toString()}');
      // ========================================

      if (e is DioException) {
        return left(serverFuiler.fromDioException(e));
      } else {
        // سنرجع رسالة خطأ ثابتة مؤقتاً لتجنب أي تحويلات
        return left(
          serverFuiler(errMassege: 'An unhandled error occurred. Check logs.'),
        );
      }
    }
  }
}
