

import 'package:flutter/material.dart';
import 'package:product_app/constant.dart';
import 'package:product_app/scrren/add_product.dart';
import 'package:product_app/statemanagement.dart';
import 'package:product_app/widgets/Custom_appbar.dart';
import 'package:product_app/widgets/custom_button.dart';
import 'package:product_app/widgets/custom_padding.dart';
import 'package:product_app/widgets/custom_sizedBox.dart';
import 'package:product_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class ProductId extends StatefulWidget {
  const ProductId({super.key});

  @override
  State<ProductId> createState() => _ProductIdState();
}

class _ProductIdState extends State<ProductId> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(text: 'Product Details',)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isValid('${AppConstant.productImage}')==true?
                 Image.network('${AppConstant.productImage}',height: 200,width: double.infinity,):Image.asset("assets/default.jpg",height: 200,width: double.infinity,),
            CustomSizedBox(height: 0.02, width: 0),
            
            CustomPadding(
               top: 0,bottom: 0,left: 0.05,right: 0,
              child: CustomText(text: '${AppConstant.productName}',fontSize: 20,fontWeight: FontWeight.bold,)),
      CustomSizedBox(height: 0.03, width: 0),
      CustomPadding(
        top: 0,bottom: 0,left: 0.05,right: 0,
        child: CustomText(text: '${AppConstant.salesRate}',color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold,)),
        CustomSizedBox(height: 0.01, width: 0),
        CustomPadding(
          top: 0,right: 0.02,left: 0.05,bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Product details',fontSize: 20,fontWeight: FontWeight.bold,),
            CustomText(text: 'Posted on :04/08 /23'),
            ],
          ),
        ),
        CustomPadding(left: 0.05, right: 0.05, top: 0.03, bottom: 0.03, child: Divider()),
        CustomPadding(
          top: 0,right: 0.02,left: 0.05,bottom: 0,
          child: Row(
            
            children: [
              CustomText(text: 'Product ID  -' ,),
           CustomSizedBox(height: 0, width: 0.1),
            CustomText(text: '${AppConstant.productId}'),
            ],
          ),
        ),
          CustomPadding(
          top: 0.02,right: 0.02,left: 0.05,bottom: 0,
          child: Row(
            
            children: [
              CustomText(text: 'Description -' ),
           CustomSizedBox(height: 0, width: 0.1),
            Expanded(child: CustomText(text: 'Lorem Ipsum is simply dummy text  of the printing and typesetting  industry . Lorem Ipsum has been the  industrys standard dummy text  ever since the 1500s , when an  unknown printer took a galley  of type and scrambled .')),
            ],
          ),
        ),
        CustomSizedBox(height: 0.03, width: 0),
                Center(
                  child: CustomButton(
                    buttonText: 'Buy now',
                    onPressed: () {
                      
                    },
                  ),
                ),
                CustomSizedBox(height: 0.03, width: 0),
              InkWell(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.08,
                     width: MediaQuery.of(context).size.width*0.80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(50)),
                    child: Row(children: [
                      CustomSizedBox(height: 0,width: 0.2,),
                      CustomText(text: 'Add to cart',color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold,),
                                  CustomSizedBox(height: 0, width: 0.05),
                                  Icon(Icons.production_quantity_limits,size: 50,color: Colors.red,),
                                  ]),)
              
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct(),));
                },
              ),
              CustomSizedBox(height: 0.05,width: 0,)
        ]),
      ),
    );
  }
  isValid(imageUrl) {
    var _imageUrl = imageUrl;
     var readImage = _imageUrl.contains('png')||_imageUrl.contains('jpg')||_imageUrl.contains('jpeg')||_imageUrl.contains('mpf'); 
     return readImage;
  }
}