import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_app/constants.dart';
import 'package:jewellery_app/ui/collection_page/collection_page.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:stacked/stacked.dart';
import 'home_page_viewmodel.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppbarWidget(
              textcolor: Colors.black,
              appbarColor: Colors.white,
            ),
          ),
          body: viewModel.showProgressbar
              ? Center(child: CircularProgressIndicator())
              : Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: viewModel.pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          viewModel.currentPage = page;
                        });
                      },
                      itemCount: viewModel.imgList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildImage(viewModel, index);
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 280,
                        margin: EdgeInsets.only(bottom: 40), // Margin around the button
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CollectionPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.4), // Black color with 40% opacity
                            padding: EdgeInsets.symmetric(vertical: 16), // Vertical padding inside the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // Rounded corners
                            ),
                          ),
                          child: Text(
                            AppTextString.exploreCollection,
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: buildDotIndicator(viewModel),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildImage(HomePageViewModel viewModel, int index) {
    return Image.network(
      BASE_URL+"/"+viewModel.imgList[index].image_name,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Center(child: Text(error.toString()));
      },
    );
  }

  Widget buildDotIndicator(HomePageViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(viewModel.imgList.length, (int index) {
        return Container(
          width: 7,
          height: 7,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.currentPage == index ? Colors.black : Colors.grey,
          ),
        );
      }),
    );
  }
}


