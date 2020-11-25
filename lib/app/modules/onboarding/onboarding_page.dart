import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'onboarding_controller.dart';

class OnboardingPage extends StatefulWidget {
  final String title;
  const OnboardingPage({Key key, this.title = "Onboarding"}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState
    extends ModularState<OnboardingPage, OnboardingController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(108, 199, 215, 1),
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          right: 30,
          bottom: 30,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: Icon(
            Icons.arrow_forward,
          ),
          backgroundColor: Color.fromRGBO(189, 189, 189, 1),
          hoverColor: Color.fromRGBO(7, 121, 255, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Center(
              heightFactor: 2,
              child: Text(
                'Diário\nOnline',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/img1.png',
                width: MediaQuery.of(context).size.width / 2.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
