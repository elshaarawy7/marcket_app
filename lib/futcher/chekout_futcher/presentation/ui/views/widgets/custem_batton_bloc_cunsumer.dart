import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:market_app/core/utils/api_key.dart';
import 'package:market_app/core/utils/custem_batton.dart';
import 'package:market_app/core/utils/get_transaction.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/amount_model/amount_model.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/amount_model/details.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/list_item_model/item.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/list_item_model/list_item_model.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/payment_intant_model/payment_intet_input_model.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/logic/manger/cubit/payemnt_cubit.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/my_cart_view.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/thank_view.dart';

class CustemBattonBlocconsumer extends StatelessWidget {
  const CustemBattonBlocconsumer({super.key, required this.isPaypal});

  final bool isPaypal;

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
            if (isPaypal) {
              var get_transaction_data = getTransactionData();
              exeucudePaypalPayment(context, get_transaction_data);
            } else {
              exucudeStripPayment(context);
            }
          },
          isLoding: state is PayemntLoding ? true : false,
          text: "Contanou",
        );
      },
    );
  }

  void exucudeStripPayment(BuildContext context) {
    PaymentIntetInputModel paymentIntetInputModel = PaymentIntetInputModel(
      amount: '100',
      currency: "USD",
      customer_id: 'cus_SzBFr59UUlSGws',
    );

    BlocProvider.of<PayemntCubit>(
      context,
    ).mackPayment(paymentIntetInputModel: paymentIntetInputModel);
  }

  void exeucudePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ListItemModel itemList}) get_transaction_data,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKey.client_id,
          secretKey: ApiKey.secret_id,
          transactions: [
            {
              "amount": get_transaction_data.amount.toJson(),
              "description": "The payment transaction description.",

              "item_list": get_transaction_data.itemList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ThankView();
                },
              ),
              (route) {
                if (route.settings.name == '/') {
                  return true;
                } else {
                  return false;
                }
              },
            );
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
             SnackBar sanckBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(sanckBar); 
           Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MyCartView();
                },
              ),
              (route) {
                if (route.settings.name == '/') {
                  return true;
                } else {
                  return false;
                }
              },
            );
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

}
