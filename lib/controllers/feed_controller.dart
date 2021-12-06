import 'dart:async';
import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
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
  late StreamSubscription<QuerySnapshot<Post>> _subscription;

  @override
  void onInit() {
    // getCurrUser();

    super.onInit();
  }

  Future<void> getPosts() async {
    _subscription = Amplify.DataStore.observeQuery(
      Post.classType,
      sortBy: [Post.CREATEDAT.descending()],
    ).listen((QuerySnapshot<Post> snapshot) {
      List<PostItem>? _list = List.from(snapshot.items)
          .map((catData) => _buildPostItem(catData))
          .toList();

      feedPosts.clear();
      if (_list != null) {
        print(_list.length);
        feedPosts.addAll(_list);
        print('Get the Kidz');
      }
    });

    // List<PostItem>? _list = [
    //   PostItem(
    //       image: NetworkImage(
    //         "https://randomuser.me/api/portraits/women/4.jpg",
    //       ),
    //       profileImage: NetworkImage(
    //         "https://randomuser.me/api/portraits/women/4.jpg",
    //       ),
    //       username: 'Test',
    //       isMine: true,
    //       postId: 'Test'),
    //   PostItem(
    //       image: NetworkImage(
    //         "https://randomuser.me/api/portraits/women/4.jpg",
    //       ),
    //       profileImage: NetworkImage(
    //         "https://randomuser.me/api/portraits/women/4.jpg",
    //       ),
    //       username: 'Test',
    //       isMine: true,
    //       postId: 'Test')
    // ];
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

  PostItem _buildPostItem(catData) {
    Post _post = catData;
    print(catData);
    return PostItem(
      post: _post,
      image: NetworkImage(
        "https://randomuser.me/api/portraits/women/4.jpg",
      ),
      profileImage: NetworkImage(
        "https://randomuser.me/api/portraits/women/4.jpg",
      ),
      username: _post.content,
      postContents: _post.content,
      isMine: true,
      postId: 'Test',
    );
  }
}
