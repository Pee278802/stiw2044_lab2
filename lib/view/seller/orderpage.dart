import 'package:flutter/material.dart';
import 'package:info_pc/model/user.dart';

class OrderPage extends StatefulWidget {
  final User user;
  const OrderPage({Key? key, required this.user}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Order Lists"),
        ],
      ),
    );
  }
}
