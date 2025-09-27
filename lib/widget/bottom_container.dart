import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatefulWidget {
  final String text;
  final bool? imagePath;
  final VoidCallback onTap;

  BottomContainer({super.key, required this.text, this.imagePath,required this.onTap});

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: 60,
      child: GestureDetector(
        onTap: () => widget.onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.imagePath == true)
              Image.asset("assets/images/shopping_bag.png",color: Colors.white,),
            const SizedBox(width: 10),
            if (widget.imagePath == false)
              const SizedBox(),
            Text(
              widget.text,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
