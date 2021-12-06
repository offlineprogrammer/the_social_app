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
import 'package:the_social_app/widgets/post_item.dart';
import 'package:uuid/uuid.dart';

class FeedController extends GetxController {
  static FeedController to = Get.find();
  DataStoreService _datastoreService = DataStoreService();

  List<PostItem> feedPosts = RxList<PostItem>();

  @override
  void onInit() {
    // getCurrUser();

    super.onInit();
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

    feedPosts.clear();
    if (_list != null) {
      feedPosts.addAll(_list);
      print('Get the Kidz');
    }
  }

  @override
  void onReady() {
    getPosts();
    print('List');
    print(feedPosts.length);
    super.onReady();
  }

  List<PostItem> getMyPosts() {
    return feedPosts;
  }
}
