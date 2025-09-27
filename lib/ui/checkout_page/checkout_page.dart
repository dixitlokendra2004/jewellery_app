import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/place_order/place_order_page.dart';
import 'package:jewellery_app/utils/app_colors.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:jewellery_app/widget/bottom_container.dart';
import 'package:stacked/stacked.dart';

import 'checkout_page_viewmodel.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckoutPageViewModel>.reactive(
        viewModelBuilder: () => CheckoutPageViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppbarWidget(
                appbarColor: Colors.white,
                showBackButton: true,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.only(
                                top: 20), // Adjust the padding as needed
                            child: Column(
                              children: [
                                Text(
                                  AppTextString.card,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Image.asset("assets/images/line_image.png"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          BuyNowItems(viewModel, 0),
                          const SizedBox(height: 10),
                          BuyNowItems(viewModel, 1),
                          const SizedBox(height: 10),
                          Divider(
                            thickness: 0.3,
                            color: Colors.black54,
                          ),
                          buttons("assets/icons/promo_code_icon.png",
                              "Add Promo Code"),
                          Divider(
                            thickness: 0.3,
                            color: Colors.black54,
                          ),
                          buttons("assets/icons/delivery_icon.png", "Delivery",
                              title: true),
                          Divider(
                            thickness: 0.3,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppTextString.estTotal,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "\$1410.5",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.subTitleColor),
                          ),
                        ],
                      ),
                    ),
                    BottomContainer(
                      imagePath: true,
                      text: AppTextString.checkout,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceOrder(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget buttons(String imagePath, String text, {bool title = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(imagePath),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
          if (title) // Check if title is true
            const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Free', // Display a string as the title
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  BuyNowItems(CheckoutPageViewModel viewModel, index) {
    return Container(
      child: Row(
        children: [
          Image.asset(viewModel.shoppingItems[index]['image'],
              height: 130, fit: BoxFit.cover),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.shoppingItems[index]['title'],
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(
                viewModel.shoppingItems[index]['subTitle'],
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Container(
                //color: Colors.red,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: viewModel.decrementCount,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      viewModel.counter.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: viewModel.incrementCount,
                    ),
                  ],
                ),
              ),
              Text(
                viewModel.shoppingItems[index]['subTitle2'],
                style: TextStyle(fontSize: 14, color: AppColors.subTitleColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
