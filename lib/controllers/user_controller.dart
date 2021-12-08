import 'dart:async';
import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_social_app/models/ModelProvider.dart';
import 'package:the_social_app/services/auth_service.dart';
import 'package:the_social_app/services/datastore_service.dart';
import 'package:the_social_app/widgets/post_item.dart';
import 'package:uuid/uuid.dart';

class UserController extends GetxController {
  static UserController to = Get.find();
  DataStoreService _datastoreService = DataStoreService();
  AuthService _authService = AuthService();
  Rxn<AuthUser> currentUser = Rxn<AuthUser>();
  RxBool isLoading = false.obs;
  RxString imageUrl = ''.obs;
  RxString email = ''.obs;
  RxString displayName = ''.obs;
  final TextEditingController displaynameController = TextEditingController();

  AuthUser? get user => currentUser.value;
  List<PostItem> myPosts = RxList<PostItem>();

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  Future<void> getCurrentUser() async {
    AuthUser authUser = await _authService.getCurrentUser();
    email.value = await _authService.getUserEmail();
    displayName.value = await _authService.getUserDisplayName();
    currentUser.value = authUser;
  }

  List<PostItem> getMyPosts() {
    return myPosts;
  }

  Future<void> updateDisplayName() async {
    await _authService.updateUserDisplayName(displaynameController.text);
    displayName.value = await _authService.getUserDisplayName();
    await _datastoreService.updateDisplayNameForAllPosts(
        currentUser.value!.userId, displayName.value);
    displaynameController.clear();
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
