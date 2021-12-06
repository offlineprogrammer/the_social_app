import 'dart:io';

import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_social_app/services/datastore_service.dart';
import 'package:the_social_app/widgets/post_item.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import 'package:uuid/uuid.dart';

class PostController extends GetxController {
  static PostController to = Get.find();
  DataStoreService _datastoreService = DataStoreService();
  RxBool isImageSelected = false.obs;
  late File _imageFile;
  var _image = PickedFile("").obs;
  final _picker = ImagePicker();
  RxString imageUrl = ''.obs;
  RxBool isLoading = false.obs;

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
}
