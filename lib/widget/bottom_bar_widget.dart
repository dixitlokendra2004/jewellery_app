import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  // const BottomBarWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Expanded(
        //     child: SingleChildScrollView(
        //       child: Center(
        //         child: Column(
        //           children: [
        //             widget.child,
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
          width: double.infinity,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset("assets/icons/home_icon.png"),
                  const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/icons/category_icon.png"),
                  const Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/icons/profile_icon.png"),
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}



