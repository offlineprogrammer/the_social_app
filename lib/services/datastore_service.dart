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
}
