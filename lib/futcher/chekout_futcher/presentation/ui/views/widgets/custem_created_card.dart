import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustemCreatedCard extends StatefulWidget {
  const CustemCreatedCard({super.key});

  @override
  State<CustemCreatedCard> createState() => _CustemCreatedCardState();
}

class _CustemCreatedCardState extends State<CustemCreatedCard> {
  // متغيرات الكارت
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: showBackView,
      onCreditCardWidgetChange: (value) {
        
      },
    );
  }
}
