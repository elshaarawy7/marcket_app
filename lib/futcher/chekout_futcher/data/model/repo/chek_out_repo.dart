import 'package:dartz/dartz.dart';
import 'package:market_app/core/errors/fuiler.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intet_input_model.dart';

abstract class ChekOutRepo {
  Future<Either<Fuiler, void>> mackupPayment({
    required PaymentIntetInputModel paymentIntetInputModel,
  });
}
