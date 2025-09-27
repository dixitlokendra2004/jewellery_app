import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/payment_success/payment_success_viewmodel.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/utils/appp_text_style.dart';
import 'package:stacked/stacked.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentSuccessViewModel>.reactive(
        viewModelBuilder: () => PaymentSuccessViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: Container(
              color: Colors.black38,
              child: Center(
                child: IntrinsicHeight(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    color: const Color(0xffFFFFFF),
                    //height: 400,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 8),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppTextString.paymentSuccess,
                          style: AppTextStyle
                              .getTextStyle18FontWeight4000xff000000,
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, bottom: 20),
                                child: Image.asset(
                                  "assets/images/Vector.png",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              Text(AppTextString.paymentSuccess1,
                                  style: AppTextStyle
                                      .getTextStyle20FontWeight2000xff000000),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppTextString.paymentSuccess2,
                                    style: AppTextStyle
                                        .getTextStyle18FontWeight1000xff555555,
                                  ),
                                  Text(
                                    AppTextString.paymentSuccess3,
                                    style: AppTextStyle
                                        .getTextStyle18FontWeight1000xff333333,
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, left: 100, right: 100, bottom: 10),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                AppTextString.paymentSuccess4,
                                style:
                                AppTextStyle
                                    .getTextStyle20FontWeight2000xff000000,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/Disappointed.png"),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset("assets/images/Happy.png"),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset("assets/images/Satisfied.png"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              color: Color(0xff000000),
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .transparent // text color
                                ),
                                onPressed: () {
                                  Navigator.pop(context); // Submit button action
                                },
                                child: Text(
                                  AppTextString.submit,
                                  style: AppTextStyle
                                      .getTextStyle18FontWeight100white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black, // border color
                                  width: 0.5, // border width
                                ),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    overlayColor: Colors.white,
                                    shadowColor: Colors.white // text color
                                ),
                                onPressed: () {},
                                child: Text(
                                  AppTextString.backToh,
                                  style: AppTextStyle
                                      .getTextStyle20FontWeight2000xff000000,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}