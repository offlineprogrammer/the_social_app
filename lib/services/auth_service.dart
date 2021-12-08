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
    String _email = '';

    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      final _authUserAttribute = res.firstWhere(
        (element) => element.userAttributeKey.toString() == 'email',
      );
      _email = _authUserAttribute.value.toString();
    } catch (e) {
      print(e);
    }
    return _email;
  }

  Future<String> getUserDisplayName() async {
    String _displayName = '';
    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      final _authUserAttribute = res.firstWhere(
        (element) =>
            element.userAttributeKey.toString() == 'custom:displayname',
      );
      _displayName = _authUserAttribute.value.toString();
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
          await Amplify.Auth.updateUserAttributes(attributes: attributes);
        }
      } on AuthException catch (e) {
        print(e.message);
      }
    }
  }

  updateUserDisplayName(String displayName) async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    var attributes = [
      AuthUserAttribute(
          userAttributeKey: const CognitoUserAttributeKey.custom('displayname'),
          value: displayName)
    ];

    await Amplify.Auth.updateUserAttributes(attributes: attributes);
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
      print('signOut');
      await Amplify.DataStore.clear();
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}
