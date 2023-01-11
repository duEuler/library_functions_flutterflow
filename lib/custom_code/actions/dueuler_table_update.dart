// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future dueulerTableUpdate(
  int id,
  String username,
) async {
  // load my table
  var mytable = FFAppState().tableUser;

  // loop in table
  for (int i = 0; i < mytable.length; i++) {
    // check id item is equal id send
    if (mytable.elementAt(i)['id'] == id) {
      mytable.elementAt(i)['username'] = username;
      break;
    }
  }

  FFAppState().update(() {
    // update all json in local
    FFAppState().tableUser = mytable;
  });
}
