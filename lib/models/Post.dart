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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Post type in your schema. */
@immutable
class Post extends Model {
  static const classType = const _PostModelType();
  final String id;
  final String? _content;
  final String? _postImageUrl;
  final TemporalDateTime? _createdAt;
  final int? _likes;
  final String? _userID;
  final String? _userDisplayName;
  final String? _postS3Object;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get content {
    try {
      return _content!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get postImageUrl {
    try {
      return _postImageUrl!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  int? get likes {
    return _likes;
  }
  
  String get userID {
    try {
      return _userID!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get userDisplayName {
    try {
      return _userDisplayName!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get postS3Object {
    return _postS3Object;
  }
  
  const Post._internal({required this.id, required content, required postImageUrl, createdAt, likes, required userID, required userDisplayName, postS3Object}): _content = content, _postImageUrl = postImageUrl, _createdAt = createdAt, _likes = likes, _userID = userID, _userDisplayName = userDisplayName, _postS3Object = postS3Object;
  
  factory Post({String? id, required String content, required String postImageUrl, TemporalDateTime? createdAt, int? likes, required String userID, required String userDisplayName, String? postS3Object}) {
    return Post._internal(
      id: id == null ? UUID.getUUID() : id,
      content: content,
      postImageUrl: postImageUrl,
      createdAt: createdAt,
      likes: likes,
      userID: userID,
      userDisplayName: userDisplayName,
      postS3Object: postS3Object);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
      id == other.id &&
      _content == other._content &&
      _postImageUrl == other._postImageUrl &&
      _createdAt == other._createdAt &&
      _likes == other._likes &&
      _userID == other._userID &&
      _userDisplayName == other._userDisplayName &&
      _postS3Object == other._postS3Object;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("content=" + "$_content" + ", ");
    buffer.write("postImageUrl=" + "$_postImageUrl" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("likes=" + (_likes != null ? _likes!.toString() : "null") + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("userDisplayName=" + "$_userDisplayName" + ", ");
    buffer.write("postS3Object=" + "$_postS3Object");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Post copyWith({String? id, String? content, String? postImageUrl, TemporalDateTime? createdAt, int? likes, String? userID, String? userDisplayName, String? postS3Object}) {
    return Post(
      id: id ?? this.id,
      content: content ?? this.content,
      postImageUrl: postImageUrl ?? this.postImageUrl,
      createdAt: createdAt ?? this.createdAt,
      likes: likes ?? this.likes,
      userID: userID ?? this.userID,
      userDisplayName: userDisplayName ?? this.userDisplayName,
      postS3Object: postS3Object ?? this.postS3Object);
  }
  
  Post.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _content = json['content'],
      _postImageUrl = json['postImageUrl'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _likes = (json['likes'] as num?)?.toInt(),
      _userID = json['userID'],
      _userDisplayName = json['userDisplayName'],
      _postS3Object = json['postS3Object'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'content': _content, 'postImageUrl': _postImageUrl, 'createdAt': _createdAt?.format(), 'likes': _likes, 'userID': _userID, 'userDisplayName': _userDisplayName, 'postS3Object': _postS3Object
  };

  static final QueryField ID = QueryField(fieldName: "post.id");
  static final QueryField CONTENT = QueryField(fieldName: "content");
  static final QueryField POSTIMAGEURL = QueryField(fieldName: "postImageUrl");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField LIKES = QueryField(fieldName: "likes");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField USERDISPLAYNAME = QueryField(fieldName: "userDisplayName");
  static final QueryField POSTS3OBJECT = QueryField(fieldName: "postS3Object");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";
    
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
      key: Post.CONTENT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.POSTIMAGEURL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.LIKES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.USERDISPLAYNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.POSTS3OBJECT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _PostModelType extends ModelType<Post> {
  const _PostModelType();
  
  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
}