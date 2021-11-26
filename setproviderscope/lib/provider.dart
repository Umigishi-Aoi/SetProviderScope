import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

final counterChangeNotifierProvider = ChangeNotifierProvider((ref) => Count(0));

class Count extends ChangeNotifier{
  int count = 0;
  Count(this.count);

  void increment(){
    count++;
    notifyListeners();
  }

}