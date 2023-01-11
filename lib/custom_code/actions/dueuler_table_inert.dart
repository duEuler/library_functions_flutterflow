// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> dueulerTableInert(String username) async {
  // Add your function code here!

  // table item instance
  dynamic jsonItem = {};

  // update next id item
  FFAppState().update(() {
    FFAppState().tableUserLastId += 1;

    // structure table item
    jsonItem['id'] = FFAppState().tableUserLastId;
    jsonItem['username'] = username;

    // insert new item
    FFAppState().tableUser.add(jsonItem);
  });

  // return
  return FFAppState().tableUserLastId;
}
