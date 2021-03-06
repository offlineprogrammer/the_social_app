import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_social_app/pages/sign_in_page.dart';
import 'package:the_social_app/services/auth_service.dart';

import 'feed_controller.dart';
import 'navigation_controller.dart';
import 'post_controller.dart';
import 'user_controller.dart';

enum EmailSignInFormType { signIn, register, confirm }

class AuthController extends GetxController {
  static AuthController to = Get.find();
  AuthService _authService = AuthService();
  // AnalyticsService _analyticsService = AnalyticsService();
  Rx<EmailSignInFormType> emailformType = EmailSignInFormType.signIn.obs;
  RxBool isLoading = false.obs;
  RxBool isSignedIn = false.obs;
  bool submitted = false;
  RxBool submitEnabled = false.obs;

  @override
  void onReady() {
    isUserSignedIn();
    //  ever(isSignedIn, handleAuthChanged);

    super.onReady();
  }

  void isUserSignedIn() async {
    try {
      StreamSubscription hubSubscription =
          Amplify.Hub.listen([HubChannel.Auth], (hubEvent) async {
        print(hubEvent.eventName);
        switch (hubEvent.eventName) {
          case "SIGNED_IN":
            {
              print("USER IS SIGNED IN");
            }
            break;
          case "SIGNED_OUT":
            {
              //Get.rootDelegate.offNamed('/signin');
              Get.offAll(() => SignInPage());
              Get.reloadAll(force: true);

              //Get.reset();
              // Get.deleteAll();
              // Get.delete<AuthController>();
              // Get.delete<UserController>();
              // Get.delete<NavigationController>();
              // Get.delete<PostController>();
              // Get.delete<FeedController>();
              // Get.offAll(() => SignInPage());
              // Get.reloadAll();
              // Get.resetRootNavigator();
              // Get.reset(); //.appUpdate().offAll();
              // Get.offAll(() => SignInPage());
              print("USER IS SIGNED OUT");
            }
            break;
          case "SESSION_EXPIRED":
            {
              print("USER IS SIGNED IN");
            }
            break;
        }
      });
    } catch (e) {
      throw e;
    } finally {
      isLoading.value = false;
    }
  }
}
