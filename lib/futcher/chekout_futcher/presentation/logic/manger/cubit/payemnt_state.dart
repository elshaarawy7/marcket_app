part of 'payemnt_cubit.dart';

@immutable
sealed class PayemntState {}

final class PayemntInitial extends PayemntState {} 
final class PayemntLoding extends PayemntState {} 
final class PayemntSucsess extends PayemntState {} 

final class PayemntFuiler extends PayemntState {
  final errMasseg ;

  PayemntFuiler(this.errMasseg) ;
}
