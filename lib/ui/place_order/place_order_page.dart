import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/add_shopping_address/add_shopping_address_page.dart';
import 'package:jewellery_app/ui/place_order/place_order_viewmodel.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/utils/appp_text_style.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:jewellery_app/widget/bottom_container.dart';
import 'package:stacked/stacked.dart';

class PlaceOrder extends StatelessWidget {
  const PlaceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlaceOrderViewModel>.reactive(
        viewModelBuilder: () => PlaceOrderViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: AppbarWidget(
                textcolor: Colors.black,
                appbarColor: Colors.white,
                showBackButton: true,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(AppTextString.checkout,
                                style: AppTextStyle
                                    .getTextStyle25FontWeight100black),
                            Image.asset("assets/images/line_image.png"),
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 15, right: 20),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(AppTextString.address,
                                    style: AppTextStyle
                                        .getTextStyle18FontWeight0xff888888),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(AppTextString.name,
                                            style: AppTextStyle
                                                .getTextStyle20FontWeight4000xff1A1A1A),
                                        Row(
                                          children: [
                                            Text(AppTextString.address1,
                                                style: AppTextStyle
                                                    .getTextStyle17FontWeight0xff888888),
                                            const Expanded(
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.black,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(AppTextString.address2,
                                            style: AppTextStyle
                                                .getTextStyle17FontWeight0xff888888),
                                        Text(AppTextString.address3,
                                            style: AppTextStyle
                                                .getTextStyle17FontWeight0xff888888)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  backgroundColor: Color(0xffF9F9F9),
                                  shadowColor: Colors.white,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(AppTextString.button1,
                                            style: AppTextStyle
                                                .getTextStyle16FontWeight0xff555555),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.add,
                                      color: Color(0xff555555),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(AppTextString.method,
                                    style: AppTextStyle
                                        .getTextStyle18FontWeight0xff888888),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  backgroundColor: Color(0xffF9F9F9),
                                  shadowColor: Colors.white,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(AppTextString.pickup,
                                            style: AppTextStyle
                                                .getTextStyle16FontWeight0xff555555),
                                      ),
                                    ),
                                    Text(AppTextString.free,
                                        style: AppTextStyle
                                            .getTextStyle16FontWeight0xff555555),
                                    const Icon(
                                      Icons.arrow_drop_down_rounded,
                                      color: Color(0xff555555),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(AppTextString.payment,
                                    style: AppTextStyle
                                        .getTextStyle18FontWeight0xff888888),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  backgroundColor: Color(0xffF9F9F9),
                                  shadowColor: Colors.white,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            AppTextString.paymentMethodText,
                                            style: AppTextStyle
                                                .getTextStyle16FontWeight0xff555555),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Color(0xff555555),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppTextString.total,
                        style:
                            AppTextStyle.getTextStyle16FontWeight2000xff333333,
                      ),
                      Text(
                        AppTextString.priceOrder,
                        style:
                            AppTextStyle.getTextStyle16FontWeight2000xffDD8560,
                      )
                    ],
                  ),
                ),
                BottomContainer(
                  imagePath: true,
                  text: AppTextString.placeOrder,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddShoppingAddressPage(),
                      ),
                    );
                  },

                ),
              ],
            ),
          );
        });
  }
}
