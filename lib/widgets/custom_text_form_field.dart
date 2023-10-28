import 'package:flutter/material.dart';
import 'package:product_app/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
    String labelText;
    String hintText;
    Widget icons;

   CustomTextFormField({super.key,required this.controller, required this.labelText,required this.hintText,required this.icons});

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      controller: controller,
      autofocus: true,
            decoration: InputDecoration(
              label: CustomText(text: labelText,color: Colors.grey,),
              hintText: hintText,
              suffixIcon: icons,
              fillColor: Colors.grey[100],
              filled: true,
              enabledBorder: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(10),),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
            ),);
  }
}