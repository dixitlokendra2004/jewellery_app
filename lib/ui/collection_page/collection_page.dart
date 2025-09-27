import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:jewellery_app/widget/bottom_bar.dart';
import 'package:stacked/stacked.dart';

import '../../widget/bottom_bar_widget.dart';
import 'collection_page_viewmodel.dart';

class CollectionPage extends StatelessWidget {
  CollectionPage({super.key});

  List<Map<String, dynamic>> imagearray = [
    {'image': "assets/images/collection_image.png"},
    {'image': "assets/images/collection_image.png"},
    {'image': "assets/images/collection_image.png"},
    {'image': "assets/images/collection_image.png"},
    {'image': "assets/images/collection_image.png"},
  ];


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CollectionPageViewModel>.reactive(
        viewModelBuilder: () => CollectionPageViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: AppbarWidget(
                textcolor: Colors.white,
                appbarColor: Colors.black,
                imagePath: Colors.white,
                shoppingBagIcon: Colors.white,
                searchIconColor: Colors.white,
                showBackButton: true,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  image_collect(imagearray, 0),
                  image_collect(imagearray, 1),
                  image_collect(imagearray, 2),
                  image_collect(imagearray, 3),
                ],
              ),
            ),
          );
        }
    );
  }
  image_collect(List<Map<String, dynamic>> imagearray, index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: Container(
        height: 560,
        width: double.infinity,
        color: Colors.black, // Black background color
        child: Image.asset(
          imagearray[index]['image'],
          fit: BoxFit.cover, // Fit the image inside the container
        ),
      ),
    );
  }
}
