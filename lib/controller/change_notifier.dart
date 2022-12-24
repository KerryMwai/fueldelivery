import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../pages/gas_page.dart';
import '../pages/orders_page.dart';
import '../pages/users_page.dart';

class AdminiController extends ChangeNotifier {
  // Private variables
  int _activeIndex = 0;

  Widget _activePage = const Gas();

  final List<PriceAndQuantityManager> _orderinfor = [];

  String _typeOfOrder = "Diesel";

// This is a special case
  List<Widget> pages = const [Users(), Gas(), Orders()];

// Getters
// Private private variables cannot be accessed directly outside this class
  int get getactiveIndex => _activeIndex;

  Widget get getActivePage => _activePage;

  UnmodifiableListView<PriceAndQuantityManager> get orderInformation =>
      UnmodifiableListView(_orderinfor);

  String get typeOfOrder => _typeOfOrder;

// Setters
// Used to assign values to the private variable from out of this class
  setActiveIndex(index) {
    _activeIndex = index;
    notifyListeners();
  }

  setActivePage() {
    _activePage = pages[_activeIndex];
    notifyListeners();
  }

  setTypeOfOrder(orderType) {
    _typeOfOrder = orderType;
    notifyListeners();
  }

  addOrderinfor(PriceAndQuantityManager orderinformation) {
    _orderinfor.add(orderinformation);
    notifyListeners();
  }
}

class PriceAndQuantityManager {
  String type;
  String quantity;
  String address;
  PriceAndQuantityManager(
      {required this.type, required this.quantity, required this.address});
}
