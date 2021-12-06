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

  Future<void> getPosts() async {
    List<PostItem>? _list = [
      PostItem(
          image: NetworkImage(
            "https://randomuser.me/api/portraits/women/4.jpg",
          ),
          profileImage: NetworkImage(
            "https://randomuser.me/api/portraits/women/4.jpg",
          ),
          username: 'Test',
          isMine: true,
          postId: 'Test'),
      PostItem(
          image: NetworkImage(
            "https://randomuser.me/api/portraits/women/4.jpg",
          ),
          profileImage: NetworkImage(
            "https://randomuser.me/api/portraits/women/4.jpg",
          ),
          username: 'Test',
          isMine: true,
          postId: 'Test')
    ];

    myPosts.clear();
    if (_list != null) {
      myPosts.addAll(_list);
      print('Get the Kidz');
    }
  }

  @override
  void onReady() {
    getPosts();
    super.onReady();
  }

  List<PostItem> getMyPosts() {
    return myPosts;
  }

  Future<void> updateDisplayName() async {
    await _authService.updateUserDisplayName(displaynameController.text);
    displayName.value = await _authService.getUserDisplayName();
    displaynameController.clear();
  }

  // Future<void> setUserImage() async {
  //   File _image;
  //   final picker = ImagePicker();

  //   try {
  //     isLoading.value = true;
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //       _image.existsSync();
  //       final userImageKey = currentUser.value!.id + Uuid().v1() + '.png';
  //       Map<String, String> metadata = <String, String>{};
  //       metadata['name'] = currentUser.value!.id;
  //       metadata['desc'] = 'A test file';
  //       S3UploadFileOptions options = S3UploadFileOptions(
  //           accessLevel: StorageAccessLevel.guest, metadata: metadata);
  //       UploadFileResult result = await Amplify.Storage.uploadFile(
  //           key: userImageKey, local: _image, options: options);
  //       GetUrlOptions _getUrlOptions = GetUrlOptions(expires: 60000);
  //       GetUrlResult resultUrl = await Amplify.Storage.getUrl(
  //           key: userImageKey, options: _getUrlOptions);
  //       currentUser.value =
  //           currentUser.value!.copyWith(avatarUrl: userImageKey);
  //       imageUrl.value = resultUrl.url;
  //       // await _datastoreService.saveUser(currentUser.value!);

  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
