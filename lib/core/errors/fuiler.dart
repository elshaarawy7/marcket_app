abstract class Fuiler {
  final String errMassege ;

  Fuiler({required this.errMassege}); 

} 

class serverFuiler extends Fuiler {
  serverFuiler({required super.errMassege});
  
}