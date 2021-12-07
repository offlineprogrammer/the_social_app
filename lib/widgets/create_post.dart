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
        initState: (_) => PostController.to.getImage(),
        builder: (s) => Obx(
              () => controller.isLoading.value
                  ? Expanded(
                      child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Wait for it..',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                        Center(child: CircularProgressIndicator()),
                      ],
                    ))
                  : SingleChildScrollView(
                      child: ListBody(children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            maxLines: 2,
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
                                fillColor: Colors.white,
                                labelText: 'Say something...',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintText: 'Say something....'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            s.getImage();
                          },
                          child: AspectRatio(
                            aspectRatio: 487 / 451,
                            child: controller.imgFile != null
                                ? Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                    fit: BoxFit.fill,
                                    alignment: FractionalOffset.topCenter,
                                    image: FileImage(controller.imgFile!),
                                  )))
                                : Container(),
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
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: controller.addPost,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
            ));
  }
}
