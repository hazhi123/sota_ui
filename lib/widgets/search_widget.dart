import 'package:flutter/material.dart';

class SearchSui extends StatelessWidget {
  const SearchSui({
    Key? key,
    required this.onChanged,
    this.height = 40.0,
    this.initialValue = '',
    this.thint,
    this.controller,
  }) : super(key: key);

  final dynamic onChanged;
  final double height;
  final String initialValue;
  final String? thint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: controller,
        onChanged: onChanged,
        initialValue: initialValue,
        keyboardType: TextInputType.text,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 28.0,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              width: 1.3,
              color: Colors.blue,
            ),
          ),
          fillColor: Colors.white,
          hintText: thint,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          filled: true,
          hoverColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
          // fillColor: colorSearchBg,
        ),
      ),
    );
  }
}
