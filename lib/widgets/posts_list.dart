import 'package:flutter/material.dart';

import 'post_item.dart';

class Posts extends StatelessWidget {
  final List<PostItem> items;

  Posts(this.items);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: this.items,
      ),
    );
    //  return ListView(
    //   // padding: const EdgeInsets.all(8),
    //   children: this.items,
    //   shrinkWrap: true,
    // );
  }
}
