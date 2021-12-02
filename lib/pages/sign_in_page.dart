import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_social_app/controllers/auth_controller.dart';

import 'home_page.dart';

class SignInPage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amplify SocialApp'),
        elevation: 10,
      ),
      body: Authenticator(
        child: HomePage(), // const Text('You are logged in!'),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
