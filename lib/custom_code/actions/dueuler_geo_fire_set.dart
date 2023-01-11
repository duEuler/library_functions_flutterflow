// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geo_firestore_flutter/geo_firestore_flutter.dart';

Future dueulerGeoFireSet(
  DocumentReference idref,
  LatLng latitudelongitude,
) async {
  // Add your function code here!

  GeoFirestore geoFirestore = GeoFirestore(
      FirebaseFirestore.instance.collection(idref.path.split("/")[0]));

  await geoFirestore.setLocation(idref.id,
      GeoPoint(latitudelongitude.latitude, latitudelongitude.longitude));
}
