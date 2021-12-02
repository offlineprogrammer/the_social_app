import 'package:get/get_navigation/src/root/get_material_app.dart';

import '/services/amplify_service.dart';
import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

import 'controllers/bindings/controllers_bindings.dart';
import 'pages/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _configureAmplify();
    });
  }

  void _configureAmplify() async {
    await AmplifyService.configureAmplify();
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllersBindings(),
      title: 'Amplify SocialApp',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // home: authenticator,
      home: _amplifyConfigured ? SignInPage() : _waitForAmplify(),
    );
  }

  Scaffold _waitForAmplify() {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
