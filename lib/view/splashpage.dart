import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:info_pc/model/config.dart';
import 'package:info_pc/model/user.dart';
import 'package:info_pc/view/loginpage.dart';
import 'package:info_pc/view/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  late double screenHeight, screenWidth, resWidth;
  @override
  void initState() {
    super.initState();
    checkAndLogin();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth * 0.85;
    } else {
      resWidth = screenWidth * 0.75;
    }
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              child:
                  Image.asset("assets/images/infoPC_logo_withbackground.png"),
              width: resWidth),
          const CircularProgressIndicator(),
          Text(
            "Version 0.1",
            style: TextStyle(
                fontSize: resWidth * 0.05,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  checkAndLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = (prefs.getString('email')) ?? '';
    String password = (prefs.getString('pass')) ?? '';
    late User user;
    if (email.length > 1 && password.length > 1) {
      http.post(Uri.parse(Config.server + "/info_pc/php/login_user.php"),
          body: {"email": email, "password": password}).then((response) {
        if (response.statusCode == 200 && response.body != "failed") {
          final jsonResponse = json.decode(response.body);
          user = User.fromJson(jsonResponse);
          Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (content) => MainPage(user: user))));
        } else {
          user = User(
              id: "na",
              index: "na",
              email: "na",
              name: "na",
              password: "na",
              datereg: "na");

          Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (content) => const LoginPage())));
        }
      }).timeout(const Duration(seconds: 5));
    } else {
      user = User(
          id: "na",
          index: "na",
          email: "na",
          name: "na",
          password: "na",
          datereg: "na");
    }
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => const LoginPage())));
  }
}
