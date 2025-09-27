import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/profile_page/profile_viewmodel.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/utils/appp_text_style.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:stacked/stacked.dart';

class Profilepage extends StatelessWidget {
  Profilepage({super.key});


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: AppbarWidget(
                textcolor: Colors.black,
                appbarColor: Colors.white,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10,),
                    child: Container(
                      color: Colors.white,
                      height: 230,
                      width: double.infinity,
                      // To make the container full width
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/profilepic.png",
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                            // fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 130,
                                    width: 130,
                                    child: Image.asset(
                                      "assets/images/profilepic.png",
                                      height: 170,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
                                    child: Container(
                                      height: 90,
                                      width: 170,
                                      color: Colors.transparent,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              AppTextString.profileName,
                                              style: AppTextStyle
                                                  .getTextStyle18FontWeight6000xff333333,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/Call.png",
                                                  height: 15,
                                                  width: 15,
                                                ),
                                                Text(
                                                  AppTextString.profileNumber,
                                                  style: AppTextStyle
                                                      .getTextStyle15FontWeight1000xff333333,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/location.png",
                                                  height: 15,
                                                  width: 15,
                                                ),
                                                Text(
                                                  AppTextString.profileAddress,
                                                  style: AppTextStyle
                                                      .getTextStyle15FontWeight1000xff333333,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  ...viewModel.profilarray.map((item) => profileBlocks(item)).toList(),
                ],
              ),
            ),
          );
        }
    );
  }

  profileBlocks(Map<String, dynamic> items) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 15, right: 15,),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only( bottom: 8),
              child: Row(
                children: [
                  Image.asset(
                    items['imageicon'],
                    height: 35,
                    width: 35,
                  ),
                  const SizedBox(width: 8,),
                  Text(
                    items['name'],
                    style: AppTextStyle.getTextStyle20FontWeight4000xff333333,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}
