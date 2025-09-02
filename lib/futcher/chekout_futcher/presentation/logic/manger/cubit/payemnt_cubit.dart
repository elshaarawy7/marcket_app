import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:bloc/bloc.dart';
import 'package:market_app/futcher/chekout_futcher/data/model/repo/cheak_out_repo_ipml.dart';
import 'package:market_app/futcher/chekout_futcher/data/model/repo/chek_out_repo.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intet_input_model.dart';
import 'package:meta/meta.dart';

part 'payemnt_state.dart';

class PayemntCubit extends Cubit<PayemntState> {
  PayemntCubit(this.chekOutRepo) : super(PayemntInitial());

  final ChekOutRepo chekOutRepo ; 

  Future mackPayment({required PaymentIntetInputModel paymentIntetInputModel}) async{
    emit(PayemntLoding()) ; 

    var data = await chekOutRepo.mackupPayment(
      paymentIntetInputModel: paymentIntetInputModel , 
      ) ; 

      data.fold(
        (l)=> emit(PayemntFuiler(l.errMassege))   ,
        (r) =>emit(PayemntSucsess()) ,
      ); 
  } 

  @override
  void onChange(Change<PayemntState> change) {
    log(change.toString()) ;
    super.onChange(change);
  }
}
