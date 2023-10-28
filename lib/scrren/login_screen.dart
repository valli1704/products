import 'dart:convert';
import 'package:product_app/constant.dart';
import 'package:product_app/scrren/product_list.screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:product_app/net_work_service.dart';
import 'package:product_app/utilits.dart';
import 'package:product_app/widgets/custom_button.dart';
import 'package:product_app/widgets/custom_padding.dart';
import 'package:product_app/widgets/custom_sizedBox.dart';
import 'package:product_app/widgets/custom_text.dart';
import 'package:product_app/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final Future<SharedPreferences> _sharePreference =
      SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizedBox(height: 0.05, width: 0),
              Image.asset(
                'assets/login.jpg',
                height: 300,
                width: 400,
              ),
              CustomSizedBox(height: 0.05, width: 0),
              CustomPadding(
                  left: 0.02,
                  right: 0,
                  top: 0,
                  bottom: 0.02,
                  child: CustomText(
                      text: 'Sign in',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              CustomPadding(
                left: 0.02,
                right: 0.02,
                top: 0,
                bottom: 0,
                child: Divider(),
              ),
              CustomPadding(
                  left: 0.02,
                  right: 0.02,
                  top: 0.02,
                  bottom: 0.02,
                  child: CustomTextFormField(
                    controller: email,
                    labelText: 'E-mail',
                    hintText: 'Please enter email',
                    icons: Icon(
                      Icons.mail,
                      color: Colors.grey[100],
                    ),
                  )),
              CustomPadding(
                  left: 0.02,
                  right: 0.02,
                  top: 0.02,
                  bottom: 0.02,
                  child: CustomTextFormField(
                    controller: password,
                    labelText: 'Password',
                    hintText: 'Please enter password',
                    icons: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.grey[100],
                    ),
                  )),
              CustomSizedBox(
                height: 0.03,
                width: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  CustomPadding(
                    left: 0,
                    right: 0.03,
                    top: 0,
                    bottom: 0,
                    child: CustomText(
                        text: 'Forgot Password?',
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              CustomSizedBox(height: 0.03, width: 0),
              Center(
                child: CustomButton(
                  buttonText: 'Sign',
                  onPressed: () {
                    if (email.text.trim() == null || email.text.trim() == '') {
                      Utilities.showToastError('Please enter email');
                    } else if (password.text.trim() == null ||
                        password.text.trim() == '') {
                      Utilities.showToastError('Please enter password');
                    } else {
                      login();
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  login() async {
     _showLoaderDialog();
    var url = "https://spotit.cloud/interview/api/login";
    var body = {
      "email": "${email.text.toString()}",
      "password": "${password.text.toString()}"
    };
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: body);
    if (response.statusCode == 200) {
      var data = response.body;
      var json = jsonDecode(data);
      if (json['message'] == 'Login Failed') {
        Utilities.showToastError('${json['message']}');
        Navigator.pop(context);
      } else {
        Utilities.showToastSuccess('${json['message']}');
        AppConstant.bearerToken = json['data']['token'];
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListScrren(),));
      }
    }
  }
   _showLoaderDialog() {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      content: Row(children: [
        CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
        Container(
            margin: EdgeInsets.only(left: 7), child: Text("Please Wait...")),
      ]),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
