import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustemCreatedCard extends StatefulWidget {
  const CustemCreatedCard({super.key, required this.formKey, required this.autovalidateMode});
  final GlobalKey<FormState> formKey ;
  final AutovalidateMode  autovalidateMode ;

  @override
  State<CustemCreatedCard> createState() => _CustemCreatedCardState();
}

class _CustemCreatedCardState extends State<CustemCreatedCard> {
  // متغيرات الكارت
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = true; 


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          isChipVisible: true,
          isHolderNameVisible: true ,
          showBackView: showBackView,

          onCreditCardWidgetChange: (value) {},
        ),

        CreditCardForm(
          autovalidateMode: widget.autovalidateMode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (CreditCardModel){
            cardNumber = CreditCardModel.cardNumber ; 
            expiryDate = CreditCardModel.expiryDate ; 
            cardHolderName = CreditCardModel.cardHolderName ; 
            cvvCode = CreditCardModel.cvvCode ; 
            showBackView = CreditCardModel.isCvvFocused ;
          },
          formKey: widget.formKey,
        ),
      ],
    );
  }
}
