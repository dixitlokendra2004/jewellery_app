import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/card_empty/card_empty_page.dart';
import 'package:jewellery_app/ui/product_detail_page/product_detail_page_viewmodel.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/utils/appp_text_style.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:stacked/stacked.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {


  PageController pageController = PageController();

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Listen to page changes
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!
            .round(); // Update currentPage when page changes
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailViewModel>.reactive(
        viewModelBuilder: () => ProductDetailViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppbarWidget(
                textcolor: Colors.black,
                appbarColor: Colors
                    .white,
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
                          const SizedBox(height: 8,),
                          Container(
                            height: 440,
                            width: double.infinity,
                            color: Colors.white,
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: viewModel.images.length,
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  viewModel.images[index],
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Adjust the spacing as needed
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              viewModel.images.length,
                                  (index) =>
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.brown.withOpacity(index ==
                                            currentPage
                                            ? 0.9
                                            : 0.4), // Adjust active and inactive dot colors
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppTextString.foreverMark,
                                  style: AppTextStyle
                                      .getTextStyle20FontWeight100black),
                              Image.asset(
                                'assets/images/Export.png',
                                // Replace with your image path
                                height: 20, // Set your desired height
                                width: 20, // Set your desired width
                              ),
                            ],
                          ),
                          //const SizedBox(height: 3,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(AppTextString.silverLayered,
                                style:
                                AppTextStyle.getTextStyle18FontWeight100grey),
                          ),
                          const SizedBox(height: 3,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(AppTextString.priceNecklace,
                                style:
                                AppTextStyle.getTextStyle22FontWeight200import),
                          ),
                          const SizedBox(height: 8,),
                          Row(
                            children: [
                              Text(AppTextString.colour,
                                  style: AppTextStyle
                                      .getTextStyle18FontWeight100black),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade200,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade200,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6,),
                          Row(
                            children: [
                              Image.asset("assets/icons/promo_code_icon.png"),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(AppTextString.discount,
                                  style: AppTextStyle
                                      .getTextStyle16FontWeight100G),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CardEmptyPage(),
                              ),
                            );
                          },
                          child: Text(AppTextString.AddTocart,
                              style: AppTextStyle
                                  .getTextStyle20FontWeight200white),
                        ),
                        IconButton(
                          icon: const Icon(
                              Icons.favorite_outline, color: Colors.white),
                          onPressed: () {
                            // Add your favorite logic here
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}