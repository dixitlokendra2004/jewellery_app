import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool searchIcon;
  final bool clearIcon;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  TextfieldWidget({
    Key? key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.searchIcon = false,
    this.clearIcon = false,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Color(0xff979797), // Set label text color
        ),
        prefixIcon: widget.searchIcon
            ? const Icon(Icons.search, color: Color(0xff979797))
            : const SizedBox(),
        suffixIcon: widget.clearIcon
            ? IconButton(
          icon: const Icon(
            Icons.clear,
            color: Color(0xff979797),
          ), // Clear icon on the right
          onPressed: () {
            widget.controller.clear();
          },
        )
            : const SizedBox(),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
    );
  }
}
