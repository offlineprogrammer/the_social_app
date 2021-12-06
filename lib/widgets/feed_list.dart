import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_social_app/controllers/feed_controller.dart';

import 'post_item.dart';
import 'posts_list.dart';

class FeedList extends GetWidget<FeedController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.feedPosts.isNotEmpty
          ? Posts(
              controller.feedPosts,
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
