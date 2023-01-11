import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'consulta_record.g.dart';

abstract class ConsultaRecord
    implements Built<ConsultaRecord, ConsultaRecordBuilder> {
  static Serializer<ConsultaRecord> get serializer =>
      _$consultaRecordSerializer;

  BuiltList<GeofireUsuarioStruct>? get lista;

  DateTime? get data;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConsultaRecordBuilder builder) =>
      builder..lista = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('consulta');

  static Stream<ConsultaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConsultaRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConsultaRecord._();
  factory ConsultaRecord([void Function(ConsultaRecordBuilder) updates]) =
      _$ConsultaRecord;

  static ConsultaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConsultaRecordData({
  DateTime? data,
}) {
  final firestoreData = serializers.toFirestore(
    ConsultaRecord.serializer,
    ConsultaRecord(
      (c) => c
        ..lista = null
        ..data = data,
    ),
  );

  return firestoreData;
}
