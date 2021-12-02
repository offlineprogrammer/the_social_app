import 'dart:async';
import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_social_app/models/ModelProvider.dart';
import 'package:the_social_app/services/auth_service.dart';
import 'package:the_social_app/services/datastore_service.dart';
import 'package:uuid/uuid.dart';

class UserController extends GetxController {
  static UserController to = Get.find();
  DataStoreService _datastoreService = DataStoreService();
  AuthService _authService = AuthService();
  //AnalyticsService _analyticsService = AnalyticsService();
  Rxn<User> currentUser = Rxn<User>();
  RxBool isLoading = false.obs;
  RxString imageUrl = ''.obs;
  final TextEditingController displaynameController = TextEditingController();

  User? get user => currentUser.value;

  @override
  void onInit() {
    // getCurrUser();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getCurrUser() async {
    AuthUser authUser = await _authService.getCurrentUser();
    print('Get the user');
    currentUser.value = await _datastoreService.getUser(authUser.userId);
    print(currentUser.value);
  }
}
