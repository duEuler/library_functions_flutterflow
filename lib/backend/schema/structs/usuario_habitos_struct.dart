import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'usuario_habitos_struct.g.dart';

abstract class UsuarioHabitosStruct
    implements Built<UsuarioHabitosStruct, UsuarioHabitosStructBuilder> {
  static Serializer<UsuarioHabitosStruct> get serializer =>
      _$usuarioHabitosStructSerializer;

  String? get titulo;

  String? get texto;

  int? get diasdasemana;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(UsuarioHabitosStructBuilder builder) => builder
    ..titulo = ''
    ..texto = ''
    ..diasdasemana = 0
    ..firestoreUtilData = FirestoreUtilData();

  UsuarioHabitosStruct._();
  factory UsuarioHabitosStruct(
          [void Function(UsuarioHabitosStructBuilder) updates]) =
      _$UsuarioHabitosStruct;
}

UsuarioHabitosStruct createUsuarioHabitosStruct({
  String? titulo,
  String? texto,
  int? diasdasemana,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsuarioHabitosStruct(
      (u) => u
        ..titulo = titulo
        ..texto = texto
        ..diasdasemana = diasdasemana
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

UsuarioHabitosStruct? updateUsuarioHabitosStruct(
  UsuarioHabitosStruct? usuarioHabitos, {
  bool clearUnsetFields = true,
}) =>
    usuarioHabitos != null
        ? (usuarioHabitos.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addUsuarioHabitosStructData(
  Map<String, dynamic> firestoreData,
  UsuarioHabitosStruct? usuarioHabitos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usuarioHabitos == null) {
    return;
  }
  if (usuarioHabitos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && usuarioHabitos.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usuarioHabitosData =
      getUsuarioHabitosFirestoreData(usuarioHabitos, forFieldValue);
  final nestedData =
      usuarioHabitosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = usuarioHabitos.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getUsuarioHabitosFirestoreData(
  UsuarioHabitosStruct? usuarioHabitos, [
  bool forFieldValue = false,
]) {
  if (usuarioHabitos == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(UsuarioHabitosStruct.serializer, usuarioHabitos);

  // Add any Firestore field values
  usuarioHabitos.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsuarioHabitosListFirestoreData(
  List<UsuarioHabitosStruct>? usuarioHabitoss,
) =>
    usuarioHabitoss
        ?.map((u) => getUsuarioHabitosFirestoreData(u, true))
        .toList() ??
    [];
