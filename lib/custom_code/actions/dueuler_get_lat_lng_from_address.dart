// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
//import 'package:location_geocoder/location_geocoder.dart';
import 'package:geocode/geocode.dart';

Future<LatLng?> dueulerGetLatLngFromAddress(
  String? addressStr,
  String? keyGeocodeXYZ,
) async {
  // Add your function code here!

  GeoCode geoCode = GeoCode(apiKey: keyGeocodeXYZ!);

  try {
    Coordinates coordinates =
        await geoCode.forwardGeocoding(address: addressStr!);

    LatLng posicao = new LatLng(coordinates.latitude!, coordinates.longitude!);

    return posicao;

    print("Latitude: ${coordinates.latitude}");
    print("Longitude: ${coordinates.longitude}");
  } catch (e) {
    print(e);
    return null;
  }
}
