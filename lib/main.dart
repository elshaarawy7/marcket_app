import 'package:flutter/material.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/my_cart_view.dart';

void main() {
  runApp(const MarcketApp());
}

class MarcketApp extends StatelessWidget {
  const MarcketApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white , 
      ), 
        home: MyCartView(),
    );
  }
}
