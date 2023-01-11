import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'usuarios_record.g.dart';

abstract class UsuariosRecord
    implements Built<UsuariosRecord, UsuariosRecordBuilder> {
  static Serializer<UsuariosRecord> get serializer =>
      _$usuariosRecordSerializer;

  String? get nome;

  BuiltList<UsuarioHabitosStruct>? get habitos;

  @BuiltValueField(wireName: 'status_ativo')
  bool? get statusAtivo;

  LatLng? get local;

  String? get endereco;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsuariosRecordBuilder builder) => builder
    ..nome = ''
    ..habitos = ListBuilder()
    ..statusAtivo = false
    ..endereco = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usuarios');

  static Stream<UsuariosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsuariosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsuariosRecord._();
  factory UsuariosRecord([void Function(UsuariosRecordBuilder) updates]) =
      _$UsuariosRecord;

  static UsuariosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsuariosRecordData({
  String? nome,
  bool? statusAtivo,
  LatLng? local,
  String? endereco,
}) {
  final firestoreData = serializers.toFirestore(
    UsuariosRecord.serializer,
    UsuariosRecord(
      (u) => u
        ..nome = nome
        ..habitos = null
        ..statusAtivo = statusAtivo
        ..local = local
        ..endereco = endereco,
    ),
  );

  return firestoreData;
}
