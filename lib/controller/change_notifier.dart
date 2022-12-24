import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pages/gas_page.dart';
import '../pages/orders_page.dart';
import '../pages/users_page.dart';

class AdminiController extends ChangeNotifier {
  // Private variables
  int _activeIndex = 0;

  Widget _activePage = const Gas();

  final List<PriceAndQuantityManager> _orderinfor = [];

  String _typeOfOrder = "Diesel";

  List _bottomNavText = ['USERS', 'GAS', 'ORDERS'];
  List _bottomNavIcons = const [
    FaIcon(
      FontAwesomeIcons.users,
      size: 20,
    ),
    FaIcon(
      FontAwesomeIcons.gasPump,
      size: 20,
    ),
    Icon(
      Icons.menu,
      size: 20,
    ),
  ];

// This is a special case
  List<Widget> pages = const [Users(), Gas(), Orders()];

// Getters
// Private private variables cannot be accessed directly outside this class
  int get getactiveIndex => _activeIndex;

  Widget get getActivePage => _activePage;

  UnmodifiableListView<PriceAndQuantityManager> get orderInformation =>
      UnmodifiableListView(_orderinfor);

  UnmodifiableListView get bottomNavText =>
      UnmodifiableListView(_bottomNavText);

  UnmodifiableListView get bottomNavIcons =>
      UnmodifiableListView(_bottomNavIcons);

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

  deleteOrder(index) {
    _orderinfor.removeWhere(
        (_order) => _orderinfor[index].quantity == _order.quantity);
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
