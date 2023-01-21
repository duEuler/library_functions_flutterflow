// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:image_picker_web/image_picker_web.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as Path;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

Future<dynamic> dueulerFilePicker(BuildContext context) async {
  // Add your function code here!

  void _logException(String? message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message!),
    ));
  }

  if (kIsWeb) {
    // running on the web!
    var mediaData = await ImagePickerWeb.getImageInfo;
    String? _filename = mediaData?.fileName;
    if (_filename != null) {
      String? mimeType = mime(_filename);
      _logException(_filename);
//      html.File mediaFile = new html.File(mediaData.data, _filename, {'type': mimeType});
    }
  } else {
    // NOT running on the web! You can check for additional platforms here.

    List<PlatformFile>? _paths;

    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['jpg', 'pdf', 'doc', 'csv'],
      ))
          ?.files;

      _logException(
          _paths != null ? _paths!.map((e) => e.name).toString() : '...');
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }

    //if (!mounted) {}

  }

  dynamic teste = {};
  return teste;
}
