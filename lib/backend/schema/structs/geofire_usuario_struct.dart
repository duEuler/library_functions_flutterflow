import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'geofire_usuario_struct.g.dart';

abstract class GeofireUsuarioStruct
    implements Built<GeofireUsuarioStruct, GeofireUsuarioStructBuilder> {
  static Serializer<GeofireUsuarioStruct> get serializer =>
      _$geofireUsuarioStructSerializer;

  DocumentReference? get idrefusuario;

  LatLng? get latlng;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(GeofireUsuarioStructBuilder builder) =>
      builder..firestoreUtilData = FirestoreUtilData();

  GeofireUsuarioStruct._();
  factory GeofireUsuarioStruct(
          [void Function(GeofireUsuarioStructBuilder) updates]) =
      _$GeofireUsuarioStruct;
}

GeofireUsuarioStruct createGeofireUsuarioStruct({
  DocumentReference? idrefusuario,
  LatLng? latlng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GeofireUsuarioStruct(
      (g) => g
        ..idrefusuario = idrefusuario
        ..latlng = latlng
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

GeofireUsuarioStruct? updateGeofireUsuarioStruct(
  GeofireUsuarioStruct? geofireUsuario, {
  bool clearUnsetFields = true,
}) =>
    geofireUsuario != null
        ? (geofireUsuario.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addGeofireUsuarioStructData(
  Map<String, dynamic> firestoreData,
  GeofireUsuarioStruct? geofireUsuario,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (geofireUsuario == null) {
    return;
  }
  if (geofireUsuario.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && geofireUsuario.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final geofireUsuarioData =
      getGeofireUsuarioFirestoreData(geofireUsuario, forFieldValue);
  final nestedData =
      geofireUsuarioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = geofireUsuario.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getGeofireUsuarioFirestoreData(
  GeofireUsuarioStruct? geofireUsuario, [
  bool forFieldValue = false,
]) {
  if (geofireUsuario == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(GeofireUsuarioStruct.serializer, geofireUsuario);

  // Add any Firestore field values
  geofireUsuario.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGeofireUsuarioListFirestoreData(
  List<GeofireUsuarioStruct>? geofireUsuarios,
) =>
    geofireUsuarios
        ?.map((g) => getGeofireUsuarioFirestoreData(g, true))
        .toList() ??
    [];
