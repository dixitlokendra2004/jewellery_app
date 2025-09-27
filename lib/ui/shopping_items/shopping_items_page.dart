import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/product_detail_page/product_detail_page.dart';
import 'package:jewellery_app/ui/shopping_items/shopping_items_viewmodel.dart';
import 'package:jewellery_app/utils/app_colors.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:jewellery_app/widget/bottom_bar.dart';
import 'package:stacked/stacked.dart';

import '../../utils/app_string.dart';

class ShoppingItemsPage extends StatefulWidget {
  // final String query;
  //
  // ShoppingItemsPage({required this.query});

  @override
  State<ShoppingItemsPage> createState() => _ShoppingItemsPageState();
}

class _ShoppingItemsPageState extends State<ShoppingItemsPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShoppingItemsViewModel>.reactive(
        viewModelBuilder: () => ShoppingItemsViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppbarWidget(appbarColor: Colors.white,showBackButton: true,),
            ),
            body: Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppTextString.apparel,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffC4C4C4),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6, right: 6),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: viewModel.dropdownValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          viewModel.dropdownValue = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        'One',
                                        'Two',
                                        'Three',
                                        'Four'
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffC4C4C4),
                                    )),
                                child: Image.asset("assets/icons/grid_view.png"),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffC4C4C4),
                                    )),
                                child: Image.asset(
                                  "assets/icons/Filter.png",
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    shoppingItemsContainer(viewModel,0),
                    const SizedBox(height: 8),
                    shoppingItemsContainer(viewModel,1),
                    const SizedBox(height: 8),
                    shoppingItemsContainer(viewModel,2),
                    const SizedBox(height: 8),
                    shoppingItemsContainer(viewModel,3),
                  ],
                ),
              ),
            ),
          );
        });
  }
  shoppingItemsContainer(ShoppingItemsViewModel viewModel, int index) {
    return GestureDetector(
      onTap: () {
        if(index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(),
            ),
          );
        }
      },
      child: Container(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
                child: Image.asset(viewModel.shoppingItems[index]['image'], height: 120,fit: BoxFit.cover,)),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.shoppingItems[index]['title'],
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    viewModel.shoppingItems[index]['subTitle'],
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    viewModel.shoppingItems[index]['subTitle2'],
                    style: TextStyle(fontSize: 14, color: AppColors.subTitleColor),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                       Icon(Icons.star, color: AppColors.subTitleColor, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        viewModel.shoppingItems[index]['rating'],
                        style: const TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            AppTextString.buyNow,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          viewModel.isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: viewModel.isFavorited ? AppColors.subTitleColor : Colors.grey,
                          size: 25,
                        ),
                        onPressed: () => viewModel.toggleFavorite(),  // Ensure the correct item is toggled
                        iconSize: 50.0,
                      ),
                    ],
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

