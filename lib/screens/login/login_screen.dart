import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users/Components/or_divider.dart';
import 'package:users/utils/login_with_facebook.dart';
import 'package:users/utils/login_with_google.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailInpController = TextEditingController();

  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();
    _emailInpController.addListener(
      () => setState(() => _isEmpty = _emailInpController.text.isEmpty),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...[
            TextField(
              controller: _emailInpController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Sign in with email',
                prefixIcon: Icon(Icons.email),
                suffixIcon: _isEmpty
                    ? null
                    : IconButton(
                        onPressed: () => _emailInpController.clear(),
                        icon: Icon(Icons.clear),
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: _isEmpty ? null : () => {},
              child: Text('Next'),
            ),
            OrDivider(),
            ElevatedButton.icon(
              onPressed: () => loginWithGoogle(),
              style: ElevatedButton.styleFrom(
                primary: Colors.white60,
              ),
              icon: SvgPicture.asset(
                'assets/icons/google-icon.svg',
                height: 24,
              ),
              label: Text(
                'Continue with Google',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => loginWithFacebook(),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              icon: SvgPicture.asset(
                'assets/icons/facebook-icon.svg',
                height: 24,
                color: Colors.white,
              ),
              label: Text('Continue with Facebook'),
            ),
          ].expand(
            (widget) => [
              widget,
              SizedBox(
                height: 8,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailInpController.dispose();
    super.dispose();
  }
}