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

Future<DocumentReference> dueulerGeoFireQuery(
  LatLng fromPosition,
  double toDistance,
  String collection,
) async {
  // start instanci geoFirestore
  GeoFirestore geoFirestore =
      GeoFirestore(FirebaseFirestore.instance.collection(collection));

  // create GeoPoint start localization
  final queryLocation = GeoPoint(fromPosition.latitude, fromPosition.longitude);

  // creates a new query around [37.7832, -122.4056] with a radius of 0.6 kilometers
  final List<DocumentSnapshot> documents =
      await geoFirestore.getAtLocation(queryLocation, toDistance);

  // create list documents returned
  List<DocumentReference> documentsRef = [];
  List<LatLng> documentsLatLng = [];
  List<dynamic> resultado = [];

  documents.forEach((document) async {
    documentsRef.add(document.reference);
    documentsLatLng.add(new LatLng(document.get('l')[0], document.get('l')[1]));

    resultado.add({
      'idrefusuario': document.reference,
      'latlng': new LatLng(document.get('l')[0], document.get('l')[1])
    });
  });

  FFAppState().update(() {
    FFAppState().geoFireTableUser = documentsRef;
    FFAppState().geoFireTableUserLatLng = documentsLatLng;
  });

  // magica
  return await FirebaseFirestore.instance
      .collection('consulta')
      .add({'data': DateTime.now().millisecondsSinceEpoch}).then(
          (docConsulta) async {
    var getConsulta =
        await FirebaseFirestore.instance.doc(docConsulta.path).get();

    documents.forEach((document) async {
      //LatLng position = new LatLng(document.get('l')[0], document.get('l')[1]);

      await FirebaseFirestore.instance.collection('consulta_resultado').add({
        'idrefconsulta': getConsulta.reference,
        'idrefusuario': document.reference,
        'latlng': GeoPoint(document.get('l')[0], document.get('l')[1])
      }).then((docResultado) {
        print(docResultado.path);
      });
    });

    return getConsulta.reference;
  });
}
