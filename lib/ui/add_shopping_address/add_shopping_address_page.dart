import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/add_new_card/add_new_card_page.dart';
import 'package:jewellery_app/utils/app_string.dart';
import 'package:jewellery_app/widget/appbar.widget.dart';
import 'package:jewellery_app/widget/bottom_container.dart';
import 'package:jewellery_app/widget/textfield_widget.dart';
import 'package:stacked/stacked.dart';

import 'add_shopping_address_viewmodel.dart';

class AddShoppingAddressPage extends StatefulWidget {
  const AddShoppingAddressPage({super.key});

  @override
  State<AddShoppingAddressPage> createState() => _AddShoppingAddressPageState();
}

class _AddShoppingAddressPageState extends State<AddShoppingAddressPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppShoppingAddressViewModel>.reactive(
        viewModelBuilder: () => AppShoppingAddressViewModel(),
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
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(top: 20),
                        // Adjust the padding as needed
                        child: Column(
                          children: [
                            Text(
                              AppTextString.addShoppingAddress,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Image.asset("assets/images/line_image.png"),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height:
                              20),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly, // Adjust the alignment as needed
                                children: [
                                  Expanded(
                                    child: TextfieldWidget(
                                      labelText: AppTextString.firstName,
                                      controller: viewModel.firstNameController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your first name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextfieldWidget(
                                      labelText: AppTextString.lastName,
                                      controller: viewModel.lastNameController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your last name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              TextfieldWidget(
                                labelText: AppTextString.address,
                                controller: viewModel.addressController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your address';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              TextfieldWidget(
                                labelText: AppTextString.city,
                                controller: viewModel.cityController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your city';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly, // Adjust the alignment as needed
                                children: [
                                  Expanded(
                                    child: TextfieldWidget(
                                      labelText: AppTextString.state,
                                      controller: viewModel.stateController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your State';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextfieldWidget(
                                      labelText: AppTextString.zipCode,
                                      controller: viewModel.zipCodeController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your ZIP Code';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              TextfieldWidget(
                                  labelText: AppTextString.phoneNumber,
                                  controller: viewModel.numberController,
                                  validator: (value) {
                                    // Define a regex pattern to match exactly 10 digits
                                    RegExp regex = RegExp(r'^[0-9]{10}$');

                                    if (value!.isEmpty) {
                                      return 'Please enter your address';
                                    } else if (!regex.hasMatch(value)) {
                                      return 'Please enter a valid 10-digit number';
                                    }
                                    return null;
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomContainer(
                  text: AppTextString.addNow,
                  imagePath: true,
                  onTap: () {
                    if (viewModel.formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewCardPage(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        });
  }
}
