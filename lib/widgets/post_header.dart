import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_social_app/controllers/post_controller.dart';

class PostHeader extends GetWidget<PostController> {
  const PostHeader({
    required this.profileImage,
    required this.username,
    required this.isMine,
    required this.postId,
  });

  final NetworkImage profileImage;
  final String username;
  final bool isMine;
  final String postId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 0),
                child: CircleAvatar(
                  backgroundImage: profileImage,
                  backgroundColor: Colors.grey[400],
                  radius: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  username,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 0),
                child: InkWell(
                  child: Icon(Icons.more_horiz, size: 25),
                  onTap: () {
                    isMine
                        ? showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                //title: Text("Add Comment"),
                                content: Container(
                                  height: 160,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                              child: Icon(Icons.close),
                                              onTap: () {
                                                Navigator.pop(context);
                                              })
                                        ],
                                      ),
                                      OutlinedButton(
                                          child: Text("Delete"),
                                          onPressed: () {
                                            print("Delete this post" + postId);
                                            controller.deletePost(postId);
                                          }),
                                      OutlinedButton(
                                          child: Text("Update"),
                                          onPressed: () {
                                            print("Update this post" + postId);
                                            //TODO: post update sayfasına yönlendir
                                          }),
                                    ],
                                  ),
                                ),
                              );
                            })
                        : showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                //title: Text("Add Comment"),
                                content: Container(
                                  height: 160,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                              child: Icon(Icons.close),
                                              onTap: () {
                                                Navigator.pop(context);
                                              })
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                  },
                )
                // Icon(
                //   Icons.more_horiz,
                //   size: 25,
                // ),

                ),
          ]),
        ),
      ],
    );
  }
}
