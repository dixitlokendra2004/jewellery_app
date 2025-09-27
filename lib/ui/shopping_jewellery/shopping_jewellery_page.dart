import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/product_detail_page/product_detail_page.dart';
import 'package:jewellery_app/ui/shopping_jewellery/shopping_jewellery_viewmodel.dart';
import 'package:jewellery_app/utils/app_colors.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:stacked/stacked.dart';

class ShoppingJewelleryPage extends StatefulWidget {

  final String query;

  ShoppingJewelleryPage({required this.query});

  @override
  State<ShoppingJewelleryPage> createState() => _ShoppingJewelleryPageState();
}

class _ShoppingJewelleryPageState extends State<ShoppingJewelleryPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShoppingJewelleryViewModel>.reactive(
      viewModelBuilder: () => ShoppingJewelleryViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AppbarWidget(appbarColor: Colors.white,),
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
                                    color: AppColors.priceColor,
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
                                    color: AppColors.priceColor,
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
                                    color:  AppColors.priceColor,
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
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                          child: shopping(viewModel,0),
                      ),
                      const SizedBox(width: 15,),
                      Expanded(
                        child: shopping(viewModel,1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: shopping(viewModel,2),
                      ),
                      const SizedBox(width: 15,),
                      Expanded(
                        child: shopping(viewModel,3),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  shopping(ShoppingJewelleryViewModel viewModel,index) {
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
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(viewModel.shoppingItems[index]['image'],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8,),
            Text(
              viewModel.shoppingItems[index]['title'],
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              viewModel.shoppingItems[index]['subTitle'],
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            Text(
              viewModel.shoppingItems[index]['subTitle2'],
              style: TextStyle(fontSize: 14, color: AppColors.subTitleColor),
            ),
          ],
        )
      ),
    );
  }
}
