import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_app/ui/search_page/search_page.dart';

class AppbarWidget extends StatelessWidget {
  final Color? textcolor;
  final Color? appbarColor;
  final Color? imagePath;
  final Color? searchIconColor;
  final Color? shoppingBagIcon;
  final bool showBackButton;
  final bool showSearchIcon;

  AppbarWidget(
      {Key? key,
      this.textcolor,
      this.appbarColor,
      this.imagePath,
      this.searchIconColor,
      this.shoppingBagIcon,
      this.showBackButton = false,
      this.showSearchIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appbarColor ?? Colors.white,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                navigator?.pop(context);
              },
            )
          : null,
      title: Row(
        children: [
          // Image.asset(
          //   "assets/images/Menu.png",
          //   color: imagePath ?? Colors.black,
          // ),
          //const SizedBox(width: 10),

          Text(
            "S P R I T",
            style: TextStyle(fontSize: 20, color: textcolor ?? Colors.black),
          ),
          const Spacer(),
          Container(
            color: Colors.transparent,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },
                  child: showSearchIcon ? Image.asset(
                    "assets/images/search.png",
                    color: searchIconColor ?? Colors.black,
                  ) : SizedBox(),
                ),
                const SizedBox(width: 15),
                Image.asset(
                  "assets/images/shopping_bag.png",
                  color: shoppingBagIcon ?? Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
