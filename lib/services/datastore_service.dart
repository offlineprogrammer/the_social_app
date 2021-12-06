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
  // Future<User?> getUser(String userId) async {
  //   try {
  //     List<Post> posts = await Amplify.DataStore.query(Post.classType);
  //   } on DataStoreException catch (e) {
  //     print('Query failed: $e');
  //   }

  //   try {
  //     List<User> user = await Amplify.DataStore.query(User.classType);
  //   } on DataStoreException catch (e) {
  //     print('Query failed: $e');
  //   }
  //   //   List<User> user = await Amplify.DataStore.query(User.classType,
  //   //       where: User.ID.eq(userId));
  //   //   print('DataStore getUser 0');
  //   //   if (user.length > 0) {
  //   //     return user.first;
  //   //   } else
  //   //     print('null');
  //   //   return null;
  //   // } catch (e) {
  //   //   throw e;
  //   // }
  // }
}
