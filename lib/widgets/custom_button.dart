import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 10,
          spreadRadius: 0,
        ),
      ]),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: const LinearBorder(side: BorderSide.none),
          minimumSize: Size(
            width,
            50,
          ),
          backgroundColor: Colors.blue,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
