import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_social_app/controllers/post_controller.dart';
import 'package:the_social_app/models/ModelProvider.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostHeader extends GetWidget<PostController> {
  const PostHeader({
    required this.profileImage,
    required this.username,
    required this.isMine,
    required this.postId,
    required this.post,
  });

  final NetworkImage profileImage;
  final String username;
  final bool isMine;
  final String postId;

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 0),
                child: CircleAvatar(
                  backgroundImage: const AssetImage('images/user.jpg'),
                  backgroundColor: Colors.grey[400],
                  radius: 25,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(post.content,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(username,
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              Text(
                post.createdAt != null
                    ? timeago.format(post.createdAt!.getDateTimeInUtc())
                    : '',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
