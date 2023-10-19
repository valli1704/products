import 'package:flutter/material.dart';
import 'package:product_app/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  var onPressed;
   CustomButton({super.key,required this.buttonText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              backgroundColor: MaterialStatePropertyAll(Colors.black),
              minimumSize: MaterialStatePropertyAll(Size(350, 50))),
            onPressed: onPressed, child: CustomText(text:buttonText,color: Colors.white,fontWeight: FontWeight.bold));
  }
}