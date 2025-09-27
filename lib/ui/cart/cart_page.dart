import 'package:flutter/material.dart';
import 'package:jewellery_app/utils/app_colors.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:jewellery_app/widget/bottom_container.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewmodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartPageViewModel>.reactive(
      viewModelBuilder: () => CartPageViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AppbarWidget(appbarColor: Colors.white),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              AppTextString.card,
                              style: const TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            Image.asset("assets/images/line_image.png"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      BuyNowItems(viewModel, 0),
                      const SizedBox(height: 10),
                      BuyNowItems(viewModel, 1),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        viewModel.subTotal();
                      },
                      child: Column(
                        children: [
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppTextString.subTotal,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '\$1410.5',
                                  style: TextStyle(fontSize: 18, color: AppColors.subTitleColor),
                                ),
                              ],
                            ),
                          ),
                          if (viewModel.isSubtotalExpanded)
                            Text(
                              AppTextString.shoppingCharges,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff888888),
                              ),
                            ),
                          const Divider(),
                          // Other widgets here
                        ],
                      ),
                    ),
                  ),
                  BottomContainer(
                    text: AppTextString.buyNow,
                    imagePath: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget BuyNowItems(CartPageViewModel viewModel, int index) {
    bool isExpanded = false; // Track if the row is expanded

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded; // Toggle the expansion state
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(viewModel.shoppingItems[index]['image'], height: 130, fit: BoxFit.cover),
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
                    // if (isExpanded) // Conditionally show more text if expanded
                    //   Text(
                    //     viewModel.shoppingItems[index]['additionalText'],
                    //     style: const TextStyle(fontSize: 14, color: Colors.grey),
                    //   ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: viewModel.decrementCount,
                          ),
                          const SizedBox(width: 4,),
                          Text(
                            viewModel.counter.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 4,),
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
            // if (isExpanded) // Conditionally show a divider if expanded
            //   const Divider(
            //     color: Colors.black,
            //     thickness: 0.5,
            //   ),
          ],
        ),
      ),
    );
  }
}
