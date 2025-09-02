import 'package:dartz/dartz.dart';
import 'package:market_app/core/chekout_futcher/presentation/data/payment_intant_model/payment_intant_model.dart';

abstract class ChekOutRepo {

  Future<Either<Fuiler , void >> mackupPayment({
    required PaymentIntantModel paymentIntetmodel 
  });
  

}

abstract class Fuiler {
  final String errMassege ;

  Fuiler({required this.errMassege}); 

} 

class serverFuiler extends Fuiler {
  serverFuiler({required super.errMassege});
  
}