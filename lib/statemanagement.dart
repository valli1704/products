import 'package:flutter/material.dart';

class ProductStatemanagement with ChangeNotifier {
  var _productList = [];
  get productList => _productList;
    set setProductList(newValue) {
    _productList = newValue;
    notifyListeners();
  }
}