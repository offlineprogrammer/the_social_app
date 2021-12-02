import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:the_social_app/models/ModelProvider.dart';
import 'package:the_social_app/services/datastore_service.dart';

class AuthService {
  DataStoreService _dataStoreService = DataStoreService();

  Future<void> signOut() async {
    try {
      await Amplify.DataStore.clear();
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<AuthUser> getCurrentUser() async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    return authUser;
  }

  Future saveUser() async {
    AuthSession authSessions = await Amplify.Auth.fetchAuthSession();

    if (authSessions.isSignedIn) {
      try {
        var res = await Amplify.Auth.fetchUserAttributes();
        final _authUserAttribute = res.firstWhere(
          (element) => element.userAttributeKey.toString() == 'email',
        );
        AuthUser authUser = await Amplify.Auth.getCurrentUser();
        User user = User(
          id: authUser.userId,

          email: _authUserAttribute.value.toString(),
          createdAt: TemporalDateTime.now(),
          displayname: _authUserAttribute.value.toString(),

          // avatarkey: '',
        );
        print(user);

        await _dataStoreService.saveUser(user);
      } on AuthException catch (e) {
        print(e.message);
      }

      //  await getCurrentUser();
      // currentUser.value = await _dataStoreService.getUser(authUser.userId);
    } else {}
  }
}
