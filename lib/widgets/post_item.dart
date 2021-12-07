import 'package:flutter/material.dart';
import 'package:the_social_app/models/ModelProvider.dart';
import 'package:the_social_app/widgets/post_header.dart';

class PostItem extends StatelessWidget {
  final NetworkImage profileImage;
  final String username;
  final bool isMine;
  final String postId;
  final String postContents;

  final Post post;

  final NetworkImage image;
  const PostItem({
    required this.image,
    required this.profileImage,
    required this.username,
    required this.isMine,
    required this.postId,
    required this.postContents,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 14),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            children: [
              PostHeader(
                profileImage: profileImage,
                username: username,
                isMine: isMine,
                postId: postId,
                post: post,
              ),
              Divider(
                height: 20,
                thickness: 2,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(
                  image: image,
                  width: 800,
                  height: 350,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
