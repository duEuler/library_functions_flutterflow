import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'documento_record.g.dart';

abstract class DocumentoRecord
    implements Built<DocumentoRecord, DocumentoRecordBuilder> {
  static Serializer<DocumentoRecord> get serializer =>
      _$documentoRecordSerializer;

  @BuiltValueField(wireName: 'documento_frente')
  String? get documentoFrente;

  @BuiltValueField(wireName: 'documento_verso')
  String? get documentoVerso;

  String? get assinatura;

  @BuiltValueField(wireName: 'documento_tipo')
  String? get documentoTipo;

  @BuiltValueField(wireName: 'documento_numero')
  String? get documentoNumero;

  int? get aprovado;

  @BuiltValueField(wireName: 'data_solicitacao')
  DateTime? get dataSolicitacao;

  @BuiltValueField(wireName: 'data_aprovado')
  DateTime? get dataAprovado;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(DocumentoRecordBuilder builder) => builder
    ..documentoFrente = ''
    ..documentoVerso = ''
    ..assinatura = ''
    ..documentoTipo = ''
    ..documentoNumero = ''
    ..aprovado = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('documento')
          : FirebaseFirestore.instance.collectionGroup('documento');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('documento').doc();

  static Stream<DocumentoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DocumentoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DocumentoRecord._();
  factory DocumentoRecord([void Function(DocumentoRecordBuilder) updates]) =
      _$DocumentoRecord;

  static DocumentoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDocumentoRecordData({
  String? documentoFrente,
  String? documentoVerso,
  String? assinatura,
  String? documentoTipo,
  String? documentoNumero,
  int? aprovado,
  DateTime? dataSolicitacao,
  DateTime? dataAprovado,
}) {
  final firestoreData = serializers.toFirestore(
    DocumentoRecord.serializer,
    DocumentoRecord(
      (d) => d
        ..documentoFrente = documentoFrente
        ..documentoVerso = documentoVerso
        ..assinatura = assinatura
        ..documentoTipo = documentoTipo
        ..documentoNumero = documentoNumero
        ..aprovado = aprovado
        ..dataSolicitacao = dataSolicitacao
        ..dataAprovado = dataAprovado,
    ),
  );

  return firestoreData;
}
