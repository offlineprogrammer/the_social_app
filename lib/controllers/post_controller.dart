import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_social_app/models/Post.dart';
import 'package:the_social_app/services/auth_service.dart';
import 'package:the_social_app/services/datastore_service.dart';
import 'package:the_social_app/services/storage_service.dart';
import 'package:the_social_app/widgets/post_item.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import 'package:uuid/uuid.dart';

import 'navigation_controller.dart';

class PostController extends GetxController {
  static PostController to = Get.find();
  final DataStoreService _datastoreService = DataStoreService();
  final StorageService _storageService = StorageService();
  final AuthService _authService = AuthService();
  RxBool isImageSelected = false.obs;

  final _picker = ImagePicker();
  RxString imageUrl = ''.obs;
  RxBool isLoading = false.obs;
  late Map<String, dynamic> _s3Object;
  final TextEditingController postTextController = TextEditingController();
  final FocusNode postTextFocusNode = FocusNode();

  final NavigationController _navigationController = Get.find();

  Future<void> imgFromCamera(String id) async {
    File _image;

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _image.existsSync();
      final userImageKey = id + Uuid().v1() + '.png';
      var _uploadedImage =
          await _storageService.uploadImage(_image, userImageKey);
      _s3Object = jsonDecode(_uploadedImage);
      imageUrl.value = _s3Object['url'];
      isImageSelected.value = true;
    } else {
      return null;
    }
  }

  Future<void> addPost() async {
    AuthUser _authUser = await _authService.getCurrentUser();
    Post _post = Post(
        content: postTextController.text,
        postImageUrl: imageUrl.value,
        createdAt: TemporalDateTime.now(),
        userID: _authUser.userId,
        postS3Object: json.encode(_s3Object),
        userDisplayName: await _authService.getUserDisplayName());

    await _datastoreService.addPost(_post);

    _navigationController.selectedIndex.value = 0;
    postTextController.clear();
    postTextController.clear();
  }
}
