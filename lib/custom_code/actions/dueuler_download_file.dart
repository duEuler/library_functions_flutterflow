// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_downloader/image_downloader.dart';

Future<String> dueulerDownloadFile(String url) async {
  // Add your function code here!

  // <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
  // https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png

  try {
    // Saved with this method.
    var imageId = await ImageDownloader.downloadImage(url);

    if (imageId == null) {
      return "not found";
    }

    // Below is a method of obtaining saved image information.
    var fileName = await ImageDownloader.findName(imageId);
    var path = await ImageDownloader.findPath(imageId);
    var size = await ImageDownloader.findByteSize(imageId);
    var mimeType = await ImageDownloader.findMimeType(imageId);
    return path.toString();
  } catch (error) {
    print(error);
    return error.toString();
  }
}
