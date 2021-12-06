import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_social_app/controllers/post_controller.dart';
import 'package:the_social_app/controllers/user_controller.dart';

class CreatePost extends GetWidget<PostController> {
  UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      initState: (_) => PostController.to
          .imgFromCamera(_userController.currentUser.value!.userId),
      builder: (s) => Expanded(
          child: Column(
        children: [
          Obx(
            () => (controller.imageUrl.value != null &&
                    controller.imageUrl.value.isEmpty == false)
                ? Container(
                    height: 150,
                    child: controller.isLoading.value == true
                        ? const Center(child: CircularProgressIndicator())
                        : Image.network(controller.imageUrl.value))
                : Container(
                    color: Color(0xffE1E5E4),
                    height: 150,
                    child: Center(child: CircularProgressIndicator()),
                  ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
                maxLines: 4,
                controller: controller.postTextController,
                focusNode: controller.postTextFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "say something..";
                  } else {
                    return null;
                  }
                },
                // controller: postRepo.postTextController,
                decoration: const InputDecoration(
                    filled: true,
                    //   fillColor: ThemeColor.textfieldColor,
                    labelText: 'Say something...',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Say something....'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Text(
                    'Share',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: controller.addPost,
                ),
              ],
            ),
          ),
        ],
      )),
    );

    // Container(
    //   child: SearchResult(model.peoples),
    // );
  }
}
