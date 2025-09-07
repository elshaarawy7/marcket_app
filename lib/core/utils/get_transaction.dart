  import 'package:market_app/futcher/chekout_futcher/presentation/data/amount_model/amount_model.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/amount_model/details.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/list_item_model/item.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/data/list_item_model/list_item_model.dart';

({AmountModel amount, ListItemModel itemList}) getTransactionData() {
    var amount = AmountModel(
      total: "100",
      currency: "USD",
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'),
    );

    List<ItemOrderModel> orders = [
      ItemOrderModel(currency: "USD", name: "Apple", price: "4", quantity: 10),

      ItemOrderModel(currency: "USD", name: "Apple", price: "5", quantity: 12),
    ];

    var itemList = ListItemModel(orders: orders);

    return (amount: amount, itemList: itemList);
  }
