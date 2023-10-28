import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:product_app/constant.dart';
import 'package:product_app/scrren/product_list.screen.dart';
import 'package:product_app/utilits.dart';
import 'package:product_app/widgets/Custom_appbar.dart';
import 'package:product_app/widgets/custom_button.dart';
import 'package:product_app/widgets/custom_sizedBox.dart';
import 'package:product_app/widgets/custom_text.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:product_app/widgets/custom_text_form_field.dart';
class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productName = TextEditingController();
   TextEditingController productCode = TextEditingController();
    TextEditingController mrp = TextEditingController();
     TextEditingController salesRate = TextEditingController();
      TextEditingController purchasesRate = TextEditingController();
    var imageFile;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(text: 'Product List',)),
     body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
       child: Column(children: [
         CustomSizedBox(height: 0.05, width: 0),
         CustomTextFormField(labelText: 'ProductName',hintText: 'Please enter productName',controller:productName ,icons: Icon(Icons.production_quantity_limits),),
          CustomSizedBox(height: 0.02, width: 0),
       CustomTextFormField(labelText: 'productCode',hintText: 'Please enter productCode',controller:productCode ,icons: Icon(Icons.production_quantity_limits),),
       CustomSizedBox(height: 0.02, width: 0),
       CustomTextFormField(labelText: 'mrp',hintText: 'Please enter mrp',controller:mrp ,icons: Icon(Icons.production_quantity_limits),),
       CustomSizedBox(height: 0.02, width: 0),
       CustomTextFormField(labelText: 'salesRate',hintText: 'Please enter salesRate',controller:salesRate ,icons: Icon(Icons.production_quantity_limits),),
       CustomSizedBox(height: 0.02, width: 0),
       CustomTextFormField(labelText: 'purchasesRate',hintText: 'Please enter purchasesRate',controller:purchasesRate ,icons: Icon(Icons.production_quantity_limits),),
       CustomSizedBox(height: 0.02, width: 0),
       imageFile==null?
       InkWell(
        onTap: () async {
           await _showChoiceDialog(context);
        },
        child: Container(height: MediaQuery.of(context).size.height*0.05,width:MediaQuery.of(context).size.height*0.2,
       child: CustomText(text: 'Choose image'),
       ),):Container(child: Column(children: [
        CustomSizedBox(height: 0.02, width: 0),
        CustomButton(buttonText: 'Reupload', onPressed: () async {
          await _showChoiceDialog(context);
        }),
        CustomSizedBox(height: 0.02, width: 0),
        Container(child: Image.file(
                          File(
                            imageFile.path
                          ),
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),),
       ]),),
       CustomSizedBox(height: 0.02, width: 0),
       CustomButton(buttonText: 'Submit', onPressed: (){
 if (productName.text.trim() == null || productName.text.trim() == '') {
                      Utilities.showToastError('Please enter productName');
                    } else if (productCode.text.trim() == null ||
                        productCode.text.trim() == '') {
                      Utilities.showToastError('Please enter productCode');
                    }
                    else if (mrp.text.trim() == null ||
                        mrp.text.trim() == '') {
                      Utilities.showToastError('Please enter mrp');
                    }
                    else if (salesRate.text.trim() == null ||
                        salesRate.text.trim() == '') {
                      Utilities.showToastError('Please enter salesRate');
                    }
                    else if (purchasesRate.text.trim() == null ||
                        purchasesRate.text.trim() == '') {
                      Utilities.showToastError('Please enter purchasesRate');
                    }
                     else if (imageFile== null ||
                        purchasesRate.text.trim() == '') {
                      Utilities.showToastError('Please chosse image');
                    }
                     else {
                      createProduct(imageFile.path);
                    }
                       
                        }),
                        CustomSizedBox(height: 0.05, width: 0)
       ],),
     ));
    
  }
  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile;
    });
    Navigator.pop(context);
  }
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _openCamera(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(
                                color: Colors.white24,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black45,
                                  size: 38,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                CustomText(text: 'Take photo from camera',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: 1,
                        color: Colors.blue,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _openGallery(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            decoration: const BoxDecoration(
                                color: Colors.white24,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Icon(
                                  Icons.add_photo_alternate,
                                  color: Colors.black45,
                                  size: 38,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                CustomText(
                                  text: "Choose photo from gallery",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
        
}

  createProduct(filename) async {
    
    var request = http.MultipartRequest(
        'POST', Uri.parse("https://spotit.cloud/interview/api/products/create"));
   
    var r = await http.MultipartFile.fromPath('ProductImage', filename);
 
    request.files.add(await http.MultipartFile.fromPath('ProductImage', filename));
 var token = AppConstant.bearerToken.toString();

   
request.headers.addAll({
"content-type":"multipart/form-data",
'Authorization': 'Bearer $token'
});
 request.fields['ProductCode'] = productCode.text.trim();
 request.fields['ProductName'] = productName.text.trim();;
 request.fields['MRP'] = mrp.text.trim();
 request.fields['PurchaseRate'] = purchasesRate.text.trim();
 request.fields['SalesRate'] = salesRate.text.trim();
    var res = await request.send();
    Utilities.showToastSuccess('create product Successfully');
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListScrren(),));
  //  / return res.reasonPhrase;
  }
}


 