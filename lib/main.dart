import 'package:flutter/material.dart';
import 'package:product_app/scrren/add_product.dart';
import 'package:product_app/scrren/login_screen.dart';
import 'package:product_app/scrren/product_list.screen.dart';
import 'package:product_app/statemanagement.dart';
import 'package:provider/provider.dart';
void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(
        create: (context) => ProductStatemanagement(),
      ),
    ], child: MyApp());
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      home: LoginScreen()
    );}}
