import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:product_app/constant.dart';
import 'package:product_app/scrren/product_by_id.dart';
import 'package:product_app/statemanagement.dart';
import 'package:product_app/utilits.dart';
import 'package:product_app/widgets/Custom_appbar.dart';
import 'package:product_app/widgets/custom_padding.dart';
import 'package:product_app/widgets/custom_sizedBox.dart';
import 'package:product_app/widgets/custom_text.dart';
import 'package:product_app/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class ProductListScrren extends StatefulWidget {

   ProductListScrren({super.key});

  @override
  State<ProductListScrren> createState() => _ProductListScrrenState();
}

class _ProductListScrrenState extends State<ProductListScrren> {
  @override
  
TextEditingController search = TextEditingController();
List productData = [];
var setProduct;
@override
  void initState() {
    // isValid();
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5,),(){
      _productData();
    
//  isValid();
    });
    super.initState();
  }
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(text: 'Product List',)),
      body: productData.isEmpty?Center(child:   CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),):
      
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            
        
        CustomSizedBox(height: 0.05, width: 0),
           CustomPadding(
        top: 0,
        left: 0.02,
        right: 0.02,
        bottom: 0,
         child: Scrollbar(
          controller: controller,
          
           child: GridView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
           itemCount: productData.length,
           itemBuilder: (context, index) {
             return InkWell(
              
               child: Card(
                
                child: 
               Column(children: [
                Expanded(child:isValid('${productData[index]['ProductImage'].toString()}')==true?
                 Image.network('${productData[index]['ProductImage'].toString()}'):Image.asset("assets/default.jpg")),
                
                         //  Image.asset(
                
                         //   (index==0)||(index==3)?"assets/car2.jpg":"assets/bike1.jpeg",
                         //   height: 100,width: 200,
                         //   ),
                CustomText(text: 'ProductName ${productData[index]['ProductName'].toString()}'),
                CustomText(text: 'Posted on 04/10/2023'),
                CustomText(text: 'SalesRate ${productData[index]['SalesRate'].toString()}'),
               ],)),
               onTap: (){
               AppConstant.productName=productData[index]['ProductName'].toString();
               AppConstant.productId=productData[index]['ProductID'].toString();
               AppConstant.salesRate=productData[index]['SalesRate'].toString();
               AppConstant.productImage=productData[index]['ProductImage'].toString();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductId(),));
              },
             );
            // CustomText(text: '${productData[index]['ProductID'].toString()}'),);
           },),
         ),
           )
        ],),
      ),
    );
  }

  _productData() async {
    var url = "https://spotit.cloud/interview/api/products/data";
    var body = {};
   var token = AppConstant.bearerToken.toString();
    Map<String, String>?   headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri.parse(url);
    var response = await http.post(uri,headers: headers);
    
    if (response.statusCode == 200) {
      var data = response.body;
      var json = jsonDecode(data);
       productData = json['data'];
       
    }
    setState(() {
      
    });
  }
  isValid(imageUrl) {
    var _imageUrl = imageUrl;
     var readImage = _imageUrl.contains('png')||_imageUrl.contains('jpg')||_imageUrl.contains('jpeg')||_imageUrl.contains('mpf'); 
     return readImage;
  }
}