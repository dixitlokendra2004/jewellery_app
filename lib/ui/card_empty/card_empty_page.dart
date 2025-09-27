import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/cart/cart_page.dart';
import 'package:jewellery_app/ui/checkout_page/checkout_page.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:jewellery_app/widget/bottom_container.dart';
import 'package:stacked/stacked.dart';

import 'card_empty_viewmodel.dart';

class CardEmptyPage extends StatefulWidget {
  const CardEmptyPage({Key? key}) : super(key: key);

  @override
  State<CardEmptyPage> createState() => _CardEmptyPageState();
}

class _CardEmptyPageState extends State<CardEmptyPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardEmptyViewModel>.reactive(
      viewModelBuilder: () => CardEmptyViewModel(),
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
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        AppTextString.card,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Image.asset("assets/images/line_image.png"),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppTextString.youHaveNoItemsInYourShoppingBag,
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xff888888)),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: BottomContainer(
                  text: AppTextString.continueShopping,
                  imagePath: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
