import 'package:dartz/dartz.dart';
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
       paymentInputModel:  paymentIntetInputModel ,
      );
      return right(null);
    } catch (e) {
      return left(serverFuiler(errMassege: e.toString()));
    }
  }
}
