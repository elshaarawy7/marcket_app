import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:market_app/core/utils/custem_batton.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intet_input_model.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/logic/manger/cubit/payemnt_cubit.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/thank_view.dart';

class CustemBattonBlocconsumer extends StatelessWidget {
  const CustemBattonBlocconsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PayemntCubit, PayemntState>(
      listener: (context, state) {
        if (state is PayemntSucsess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ThankView();
              },
            ),
          );
        }

        if (state is PayemntFuiler) {
          Navigator.pop(context);
          SnackBar sanckBar = SnackBar(content: Text(state.errMasseg));
          ScaffoldMessenger.of(context).showSnackBar(sanckBar);
        }
      },
      builder: (context, state) {
        return CustemBatton(
          onPressed: () {
            /*PaymentIntetInputModel paymentIntetInputModel =
                PaymentIntetInputModel(
                  amount: '100',
                  currency: "USD",
                  customer_id: 'cus_SzBFr59UUlSGws',
                );

            BlocProvider.of<PayemntCubit>(
              context,
            ).mackPayment(paymentIntetInputModel: paymentIntetInputModel);*/

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckoutView(
                  sandboxMode: true,
                  clientId: "YOUR CLIENT ID",
                  secretKey: "YOUR SECRET KEY",
                  transactions: const [
                    {
                      "amount": {
                        "total": '100',
                        "currency": "USD",
                        "details": {
                          "subtotal": '100',
                          "shipping": '0',
                          "shipping_discount": 0,
                        },
                      },
                      "description": "The payment transaction description.",
                      // "payment_options": {
                      //   "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
                      // },
                      "item_list": {
                        "items": [
                          {
                            "name": "Apple",
                            "quantity": 4,
                            "price": '10',
                            "currency": "USD",
                          },
                          {
                            "name": "Pineapple",
                            "quantity": 5,
                            "price": '12',
                            "currency": "USD",
                          },
                        ],

                        // Optional
                        // "shipping_address": {
                        //   "recipient_name": "Tharwat samy",
                        //   "line1": "tharwat",
                        //   "line2": "",
                        //   "city": "tharwat",
                        //   "country_code": "EG",
                        //   "postal_code": "25025",
                        //   "phone": "+00000000",
                        //   "state": "ALex",
                        // },
                      },
                    },
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    log("onSuccess: $params");
                    Navigator.pop(context);
                  },
                  onError: (error) {
                    log("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
          isLoding: state is PayemntLoding ? true : false,
          text: "Contanou",
        );
      },
    );
  }
}
