import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payemnt_state.dart';

class PayemntCubit extends Cubit<PayemntState> {
  PayemntCubit() : super(PayemntInitial());
}
