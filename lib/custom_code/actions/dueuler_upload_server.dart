// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dio/dio.dart';

import 'package:path/path.dart';

Future<String> dueulerUploadServer(
  String image,
  String signature,
) async {
  try {
    // baixa os dois arquivos na base local

    var imagePath = dueulerDownloadFile(image);
    var signaturePath = dueulerDownloadFile(signature);

    final dio = Dio();

    dio.options.headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    final _image =
        await MultipartFile.fromFile(image, filename: basename(image));
    final _signature =
        await MultipartFile.fromFile(signature, filename: basename(signature));

    final formData = FormData.fromMap({
      'image': _image,
      'signature': _signature
    }); // 'file' - this is an api key, can be different

    final response = await dio.post(
      // or dio.post
      "https://dueuler.com/miro/upload.php",
      data: formData,
    );

    return response.toString();
  } catch (err) {
    print('uploading error: $err');
    return 'uploading error: $err';
  }
}
