import 'package:flutter/material.dart';
import 'package:info_pc/model/user.dart';
import 'package:info_pc/view/loginpage.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Name: " + widget.user.name.toString()),
        Text("Email: " + widget.user.email.toString()),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage())),
          child: const Text("Logout"),
        )
      ]),
    );
  }
}
