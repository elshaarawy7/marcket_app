import 'package:flutter/material.dart';
import 'package:market_app/futcher/chekout_futcher/presentation/ui/views/widgets/pymant_detiles_item.dart';

class PymentMrthodListView extends StatefulWidget {
  const PymentMrthodListView({super.key});

  @override
  State<PymentMrthodListView> createState() => _PymentMrthodListViewState();
}

class _PymentMrthodListViewState extends State<PymentMrthodListView> {
  final List<String> pymentMethodItem = const [
    "assets/images/SVGRepo_iconCarrier.svg", // <--- قم بإضافة الفاصلة هنا
    "assets/images/Group.svg",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: pymentMethodItem.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                selectedIndex = index;
                setState(() {});
              },

              child: PymantDetilesItem(
                isActive: selectedIndex == index,
                image: pymentMethodItem[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
