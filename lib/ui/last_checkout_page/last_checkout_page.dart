import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/last_checkout_page/last_checkout_page_viewmodel.dart';
import 'package:jewellery_app/ui/payment_success/payment_success_page.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/utils/appp_text_style.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:jewellery_app/widget/bottom_container.dart';
import 'package:stacked/stacked.dart';

class LastCheckout_Page extends StatefulWidget {
  LastCheckout_Page({super.key});

  @override
  _LastCheckout_PageState createState() => _LastCheckout_PageState();
}

class _LastCheckout_PageState extends State<LastCheckout_Page> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LastCheckoutPageViewModel>.reactive(
        viewModelBuilder: () => LastCheckoutPageViewModel(),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
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
                                left: 15, right: 15, top: 20),
                            child: Column(
                              children: [
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
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Divider(
                            color: Color(0xff000000),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 20),
                              child: Image.asset(
                                'assets/images/MasterCard1.png', // Replace with your image URL
                                // width: 20,
                                // height: 40,
                              ),
                            ),
                            Text(
                              AppTextString.mastercard,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff17181A),
                              ),
                            ),
                            Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff17181A),
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 8),
                          child: Divider(
                            color: Color(0xff000000),
                          ),
                        ),
                        ...viewModel.cartContainer
                            .map((item) => checkoutItem(item, viewModel))
                            .toList(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 5, top: 5),
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
                  text: AppTextString.checkout,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PaymentSuccess();
                      },
                    );
                  },
                  imagePath: true,
                ),
              ],
            ),
          );
        });
  }

  Widget checkoutItem(
      Map<String, dynamic> item, LastCheckoutPageViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 150,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 110,
              child: Image.asset(
                item['image'],
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
            const SizedBox(
                width: 10), // Add some space between the image and the text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item['brand'],
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300)),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    item['product'],
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w200),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: viewModel.decrementItem,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              viewModel.itemCount.toString(),
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: viewModel.incrementItem,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    item['price'],
                    style: AppTextStyle.getTextStyle16FontWeight2000xffDD8560,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
