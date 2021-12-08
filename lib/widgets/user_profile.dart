import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_social_app/controllers/user_controller.dart';

import 'posts_list.dart';

class UserProfile extends GetWidget<UserController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Color(0xffE1E5E4),
              height: 150,
              child: Image.asset(
                'images/user.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(
              () => (controller.currentUser.value != null &&
                      controller.displayName.value.isEmpty == false)
                  ? Text(
                      controller.displayName.value,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      '(Display Name)',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => (controller.currentUser.value != null &&
                      controller.email.value.isEmpty == false)
                  ? Text(
                      controller.email.value,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      '(User Name)',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.black),
            SizedBox(height: 20),
            Text(
              'Update Your Details',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.displaynameController,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              // autofocus: true,
              onEditingComplete: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                controller.updateDisplayName();
              },
              decoration: const InputDecoration(
                labelText: 'Display Name',
                prefixIcon: Icon(Icons.badge),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: controller.updateDisplayName,
                child: Text(
                  'Save',
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: controller.signOut,
                child: Text(
                  'Sign out',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
