import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'consulta_resultado_record.g.dart';

abstract class ConsultaResultadoRecord
    implements Built<ConsultaResultadoRecord, ConsultaResultadoRecordBuilder> {
  static Serializer<ConsultaResultadoRecord> get serializer =>
      _$consultaResultadoRecordSerializer;

  DocumentReference? get idrefusuario;

  LatLng? get latlng;

  String? get nome;

  DocumentReference? get idrefconsulta;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConsultaResultadoRecordBuilder builder) =>
      builder..nome = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('consulta_resultado');

  static Stream<ConsultaResultadoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConsultaResultadoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConsultaResultadoRecord._();
  factory ConsultaResultadoRecord(
          [void Function(ConsultaResultadoRecordBuilder) updates]) =
      _$ConsultaResultadoRecord;

  static ConsultaResultadoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConsultaResultadoRecordData({
  DocumentReference? idrefusuario,
  LatLng? latlng,
  String? nome,
  DocumentReference? idrefconsulta,
}) {
  final firestoreData = serializers.toFirestore(
    ConsultaResultadoRecord.serializer,
    ConsultaResultadoRecord(
      (c) => c
        ..idrefusuario = idrefusuario
        ..latlng = latlng
        ..nome = nome
        ..idrefconsulta = idrefconsulta,
    ),
  );

  return firestoreData;
}
