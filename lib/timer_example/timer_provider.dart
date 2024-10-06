import 'package:flutter/foundation.dart';

class TimerProvider with ChangeNotifier{

  int _time = 0;
  int get time => _time;

  void setTime(){
    _time++;
    notifyListeners();
  }
}