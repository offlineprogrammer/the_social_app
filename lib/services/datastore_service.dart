import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';

import 'package:the_social_app/models/ModelProvider.dart';

class DataStoreService {
  Future<void> addPost(Post post) async {
    try {
      await Amplify.DataStore.save(post);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<void> updateDisplayNameForAllPosts(
      String userId, String displayName) async {
    try {
      List<Post> _posts = await Amplify.DataStore.query(Post.classType,
          where: Post.USERID.eq(userId));
      if (_posts.length > 0) {
        print('got _posts');
        _posts.forEach((_post) async {
          _post = _post.copyWith(userDisplayName: displayName);
          await Amplify.DataStore.save(_post);
        });
      } else
        return null;
    } catch (e) {
      throw e;
    }
  }
}
