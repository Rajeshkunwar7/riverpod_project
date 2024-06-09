import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoFunction extends ChangeNotifier {
  List<String> myList = [];

  void addData(String value) {
    myList.add(value);
    notifyListeners();
  }

  void deleteData(int value) {
    myList.removeAt(value);
    notifyListeners();
  }
}

final todoProvider = ChangeNotifierProvider((ref) => TodoFunction());


