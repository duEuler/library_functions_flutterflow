import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'galeria_record.g.dart';

abstract class GaleriaRecord
    implements Built<GaleriaRecord, GaleriaRecordBuilder> {
  static Serializer<GaleriaRecord> get serializer => _$galeriaRecordSerializer;

  String? get foto;

  DateTime? get dataupload;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(GaleriaRecordBuilder builder) =>
      builder..foto = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('galeria')
          : FirebaseFirestore.instance.collectionGroup('galeria');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('galeria').doc();

  static Stream<GaleriaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<GaleriaRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  GaleriaRecord._();
  factory GaleriaRecord([void Function(GaleriaRecordBuilder) updates]) =
      _$GaleriaRecord;

  static GaleriaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createGaleriaRecordData({
  String? foto,
  DateTime? dataupload,
}) {
  final firestoreData = serializers.toFirestore(
    GaleriaRecord.serializer,
    GaleriaRecord(
      (g) => g
        ..foto = foto
        ..dataupload = dataupload,
    ),
  );

  return firestoreData;
}
