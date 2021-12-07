import 'dart:convert';
import 'dart:io';

import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import '../amplifyconfiguration.dart';

class StorageService {
  static final _parsedConfig =
      jsonDecode(amplifyconfig) as Map<String, dynamic>;
  static final bucket = _parsedConfig['storage']['plugins']
      ['awsS3StoragePlugin']['bucket'] as String;
  static final region = _parsedConfig['storage']['plugins']
      ['awsS3StoragePlugin']['region'] as String;

  Future<String> uploadImage(File image, String key) async {
    await Amplify.Storage.uploadFile(
      local: image,
      key: key,
      options: S3UploadFileOptions(
        accessLevel: StorageAccessLevel.guest,
      ),
    );

    var newUrl = await getImageUrl(key);

    var s3Object = {};
    s3Object["bucket"] = bucket;
    s3Object["region"] = region;
    s3Object["key"] = key;
    s3Object["url"] = newUrl;

    print(s3Object.toString());

    return json.encode(s3Object);
  }

  Future<String> getImageUrl(String key) async {
    final GetUrlResult result = await Amplify.Storage.getUrl(
      key: key,
      options: S3GetUrlOptions(expires: 60000),
    );
    return result.url;
  }
}
