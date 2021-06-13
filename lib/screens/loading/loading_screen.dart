import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static String routeName = '/loading';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}