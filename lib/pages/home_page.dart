import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_social_app/controllers/user_controller.dart';
import 'package:the_social_app/widgets/home_drawer.dart';

class HomePage extends GetWidget<UserController> {
  get kTransparentImage => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE1E5E4),
        drawer: const HomeDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.getCurrUser(),
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Text",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
