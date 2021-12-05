import 'package:flutter/material.dart';
import 'package:info_pc/model/user.dart';
import 'package:info_pc/view/seller/orderpage.dart';
import 'package:info_pc/view/seller/productpage.dart';
import 'package:info_pc/view/customer/cartpage.dart';
import 'package:info_pc/view/customer/homepage.dart';
import 'package:info_pc/view/profilepage.dart';

class MainPage extends StatefulWidget {
  final User user;
  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Widget> tabchildren;
  int _currentIndex = 0;
  String maintitle = "INFO PC";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
      ),
      title: 'INFO PC',
      home: Scaffold(
          appBar: AppBar(
            title: Text(maintitle),
          ),
          body: tabchildren[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: widget.user.index == "1"
                      ? const Icon(Icons.store_mall_directory)
                      : const Icon(Icons.home),
                  label: widget.user.index == "1" ? "Product" : "Home"),
              BottomNavigationBarItem(
                  icon: widget.user.index == "1"
                      ? const Icon(Icons.format_list_bulleted)
                      : const Icon(Icons.local_grocery_store),
                  label: widget.user.index == "1" ? "Order" : "Cart"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.user.index == "1") {
      maintitle = "Products";
      tabchildren = [
        //Admin
        ProductPage(user: widget.user), //TabPage1
        OrderPage(user: widget.user), //TabPage2
        ProfilePage(user: widget.user), //TabPage3
      ];
    } else {
      maintitle = "Home";
      tabchildren = [
        //Customer
        HomePage(
          user: widget.user,
        ), //TabPage1
        CartPage(user: widget.user), //TabPage2
        ProfilePage(
          user: widget.user,
        ), //TabPage3
      ];
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (_currentIndex) {
        case 1:
          if (widget.user.index == "1") {
            maintitle = "Products";
          } else {
            maintitle = "Home";
          }
          break;
        case 2:
          if (widget.user.index == "1") {
            maintitle = "Order";
          } else {
            maintitle = "Cart";
          }
          break;
        case 3:
          maintitle = "Profile";
          break;
        default:
          maintitle = "INFO PC";
      }
    });
  }
}
