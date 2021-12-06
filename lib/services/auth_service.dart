import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:the_social_app/models/ModelProvider.dart';
import 'package:the_social_app/services/datastore_service.dart';

class AuthService {
  DataStoreService _dataStoreService = DataStoreService();

  Future<AuthUser> getCurrentUser() async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    await saveUser();
    return authUser;
  }

  Future<String> getUserEmail() async {
    AuthSession authSessions = await Amplify.Auth.fetchAuthSession();
    String _email = '';

    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      final _authUserAttribute = res.firstWhere(
        (element) => element.userAttributeKey.toString() == 'email',
      );
      _email = _authUserAttribute.value.toString();
    } on AuthException catch (e) {
      print(e.message);
    }
    return _email;
  }

  Future<String> getUserDisplayName() async {
    AuthSession authSessions = await Amplify.Auth.fetchAuthSession();
    String _displayName = '';

    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      final _authUserAttribute = res.firstWhere(
        (element) =>
            element.userAttributeKey.toString() == 'custom:displayname',
      );
      _displayName = _authUserAttribute.value.toString();
      print(_displayName);
    } catch (e) {
      print(e);
    }
    return _displayName;
  }

  Future saveUser() async {
    AuthSession authSessions = await Amplify.Auth.fetchAuthSession();

    if (authSessions.isSignedIn) {
      try {
        var _displayName = await getUserDisplayName();

        if (_displayName.isEmpty) {
          print('This is a new user');

          var res = await Amplify.Auth.fetchUserAttributes();
          final _authUserAttribute = res.firstWhere(
            (element) => element.userAttributeKey.toString() == 'email',
          );
          AuthUser authUser = await Amplify.Auth.getCurrentUser();
          var attributes = [
            AuthUserAttribute(
                userAttributeKey:
                    const CognitoUserAttributeKey.custom('createdAt'),
                value: TemporalDateTime.now().toString()),
            AuthUserAttribute(
                userAttributeKey:
                    const CognitoUserAttributeKey.custom('displayname'),
                value: _authUserAttribute.value.toString())
          ];

          var res1 =
              await Amplify.Auth.updateUserAttributes(attributes: attributes);
          print(authUser);
        }

        // await _dataStoreService.saveUser(user);
      } on AuthException catch (e) {
        print(e.message);
      }

      //  await getCurrentUser();
      // currentUser.value = await _dataStoreService.getUser(authUser.userId);
    } else {}
  }

  updateUserDisplayName(String displayName) async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    var attributes = [
      AuthUserAttribute(
          userAttributeKey: const CognitoUserAttributeKey.custom('displayname'),
          value: displayName)
    ];

    var res = await Amplify.Auth.updateUserAttributes(attributes: attributes);
  }
}
