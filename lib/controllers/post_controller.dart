import 'dart:async';
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
import 'package:the_social_app/widgets/post_item.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import 'package:uuid/uuid.dart';

import 'navigation_controller.dart';

class PostController extends GetxController {
  static PostController to = Get.find();
  final DataStoreService _datastoreService = DataStoreService();
  final AuthService _authService = AuthService();
  RxBool isImageSelected = false.obs;
  late File _imageFile;
  var _image = PickedFile("").obs;
  final _picker = ImagePicker();
  RxString imageUrl = ''.obs;
  RxBool isLoading = false.obs;
  final TextEditingController postTextController = TextEditingController();
  final FocusNode postTextFocusNode = FocusNode();
  late StreamSubscription<QuerySnapshot<Post>> _subscription;

  final NavigationController _navigationController = Get.find();

  @override
  void onInit() {
    // getCurrUser();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void deletePost(String postId) {}

  Future<void> imgFromCamera(String id) async {
    File _image;

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _image.existsSync();
      final userImageKey = id + Uuid().v1() + '.png';
      Map<String, String> metadata = <String, String>{};
      metadata['name'] = id;
      metadata['desc'] = 'A test file';
      S3UploadFileOptions options = S3UploadFileOptions(
          accessLevel: StorageAccessLevel.guest, metadata: metadata);
      UploadFileResult result = await Amplify.Storage.uploadFile(
          key: userImageKey, local: _image, options: options);
      GetUrlOptions _getUrlOptions = GetUrlOptions(expires: 60000);
      GetUrlResult resultUrl = await Amplify.Storage.getUrl(
          key: userImageKey, options: _getUrlOptions);
      // currentUser.value =
      //     currentUser.value!.copyWith(avatarkey: userImageKey);
      print('Storage');
      imageUrl.value = resultUrl.url;
      isImageSelected.value = true;
    } else {
      return null;
    }
  }

  Future<void> imgFromGallery() async {}

  Future<void> addPost() async {
    AuthUser _authUser = await _authService.getCurrentUser();
    Post _post = Post(
        content: postTextController.text,
        postImageUrl: imageUrl.value,
        createdAt: TemporalDateTime.now(),
        userID: _authUser.userId);

    await _datastoreService.addPost(_post);

    _navigationController.selectedIndex.value = 0;
    postTextController.clear();
    postTextController.clear();
  }
}
