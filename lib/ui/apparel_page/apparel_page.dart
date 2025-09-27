import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:stacked/stacked.dart';
import '../../utils/app_string.dart';
import 'apperal_viewmodel_page.dart';

class ApprealPage extends StatefulWidget {
  const ApprealPage({super.key});

  @override
  State<ApprealPage> createState() => _ApprealPageState();
}

class _ApprealPageState extends State<ApprealPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ApparelPageViewModel>.reactive(
        viewModelBuilder: () => ApparelPageViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppbarWidget(appbarColor: Colors.white,showBackButton: true,),
            ),
            body: Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppTextString.apparel,style: const TextStyle(fontSize: 18,color: Colors.black),),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                // padding: EdgeInsets.symmetric(horizontal: 3,vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                    border: Border.all(width: 1,color: Color(0xffC4C4C4),)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6,right: 6),
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
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
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
                                  border: Border.all(width: 1,color: Color(0xffC4C4C4),)
                                ),
                                child: Image.asset("assets/icons/Gallery.png"),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1,color: Color(0xffC4C4C4),)
                                ),
                                child: Image.asset("assets/icons/Filter.png"),

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        necklaceContainer(AppTextString.women),
                        const SizedBox(width: 10),
                        necklaceContainer(AppTextString.allNecklaces),
                      ],
                    ),
                    const SizedBox(height: 15),
                    for(var i = 0 ; i < 5 ; i++)
                    shoppingImageContainer("assets/images/lock_key_image.png",AppTextString.tiffary,AppTextString.lockAndKey,"\$920"),
                  ],
                ),
              ),
            ),
          );
        });
  }
  necklaceContainer(String title) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 15,),
            Icon(Icons.close,size: 20,),
          ],
        ),
      ),
    );
  }


  shoppingImageContainer(String imagePath, String title , String subTitle , String priceText) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subTitle,
                style: const TextStyle(fontSize: 16,color: Colors.grey),
              ),
              Text(
                priceText,
                style: const TextStyle(fontSize: 16,color: Colors.orange),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
