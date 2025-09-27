import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/last_checkout_page/last_checkout_page.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:jewellery_app/widget/bottom_container.dart';
import 'package:jewellery_app/widget/textfield_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

import 'add_new_card_viewmodel.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddNewCardViewModel>.reactive(
      viewModelBuilder: () => AddNewCardViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
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
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              AppTextString.paymentMethod,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Image.asset("assets/images/line_image.png"),
                          ],
                        ),
                      ),
                      CarouselSlider(
                        items: viewModel.items.map((item) {
                          return gradientContainer(item);
                        }).toList(),
                        options: CarouselOptions(
                          height: 190,
                          onPageChanged: (index, reason) {
                            viewModel.activeIndexs(index);
                          },
                        ),
                        carouselController: viewModel.controller,
                      ),
                      const SizedBox(height: 20),
                      AnimatedSmoothIndicator(
                        activeIndex: viewModel.activeIndex,
                        count: viewModel.items.length,
                        effect: WormEffect(
                          dotWidth: 8,
                          dotHeight: 8,
                          activeDotColor: Colors.brown,
                          dotColor: Colors.grey.shade400,
                        ),
                        onDotClicked: (index) {
                          viewModel.controller.animateToPage(index);
                        },
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              TextfieldWidget(
                                labelText: AppTextString.nameCard,
                                controller: viewModel.cardNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '*Please enter your exactly as it appears on your card';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              TextfieldWidget(
                                labelText: AppTextString.cardNumber,
                                controller: viewModel.cardNumberController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Card Number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const SizedBox(height: 15),
                                  Expanded(
                                    child: TextfieldWidget(
                                      labelText: AppTextString.expMonth,
                                      controller: viewModel.expMonthController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Exp Month';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: TextfieldWidget(
                                      labelText: AppTextString.expDate,
                                      controller: viewModel.expDateController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Exp Date';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              TextfieldWidget(
                                labelText: AppTextString.cvv,
                                controller: viewModel.cvvController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter CVV';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomContainer(
                text: AppTextString.addCard,
                onTap: () {
                  if (viewModel.formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LastCheckout_Page(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget gradientContainer(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 18),
      child: Container(
        width: double.infinity,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: item['gradientColors'],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/MasterCard1.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xffffffff)),
                      ),
                      Text(
                        item['date'],
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xffffffff)),
                      ),
                    ],
                  ),
                  Text(
                    item['subTitle'],
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xffffffff)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
