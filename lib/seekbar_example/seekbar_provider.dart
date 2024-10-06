import 'package:flutter/cupertino.dart';

class SeekbarProvider with ChangeNotifier{

  double _value = 1.0;
  double get value => _value;

  void setValue(double val){
    _value = val;
    notifyListeners();
  }
}