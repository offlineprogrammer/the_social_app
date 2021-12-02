/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _email;
  final String? _avatarUrl;
  final String? _displayname;
  final TemporalDateTime? _createdAt;
  final List<Post>? _Posts;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get avatarUrl {
    return _avatarUrl;
  }
  
  String? get displayname {
    return _displayname;
  }
  
  TemporalDateTime get createdAt {
    try {
      return _createdAt!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  List<Post>? get Posts {
    return _Posts;
  }
  
  const User._internal({required this.id, required email, avatarUrl, displayname, required createdAt, Posts}): _email = email, _avatarUrl = avatarUrl, _displayname = displayname, _createdAt = createdAt, _Posts = Posts;
  
  factory User({String? id, required String email, String? avatarUrl, String? displayname, required TemporalDateTime createdAt, List<Post>? Posts}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      email: email,
      avatarUrl: avatarUrl,
      displayname: displayname,
      createdAt: createdAt,
      Posts: Posts != null ? List<Post>.unmodifiable(Posts) : Posts);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _email == other._email &&
      _avatarUrl == other._avatarUrl &&
      _displayname == other._displayname &&
      _createdAt == other._createdAt &&
      DeepCollectionEquality().equals(_Posts, other._Posts);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("avatarUrl=" + "$_avatarUrl" + ", ");
    buffer.write("displayname=" + "$_displayname" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? email, String? avatarUrl, String? displayname, TemporalDateTime? createdAt, List<Post>? Posts}) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      displayname: displayname ?? this.displayname,
      createdAt: createdAt ?? this.createdAt,
      Posts: Posts ?? this.Posts);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _email = json['email'],
      _avatarUrl = json['avatarUrl'],
      _displayname = json['displayname'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _Posts = json['Posts'] is List
        ? (json['Posts'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Post.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'email': _email, 'avatarUrl': _avatarUrl, 'displayname': _displayname, 'createdAt': _createdAt?.format(), 'Posts': _Posts?.map((Post? e) => e?.toJson()).toList()
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField AVATARURL = QueryField(fieldName: "avatarUrl");
  static final QueryField DISPLAYNAME = QueryField(fieldName: "displayname");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField POSTS = QueryField(
    fieldName: "Posts",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Post).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.AVATARURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.DISPLAYNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.POSTS,
      isRequired: false,
      ofModelName: (Post).toString(),
      associatedKey: Post.USERPOSTSID
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}