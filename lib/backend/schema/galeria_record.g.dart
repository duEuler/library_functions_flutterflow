// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'galeria_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GaleriaRecord> _$galeriaRecordSerializer =
    new _$GaleriaRecordSerializer();

class _$GaleriaRecordSerializer implements StructuredSerializer<GaleriaRecord> {
  @override
  final Iterable<Type> types = const [GaleriaRecord, _$GaleriaRecord];
  @override
  final String wireName = 'GaleriaRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, GaleriaRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.foto;
    if (value != null) {
      result
        ..add('foto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dataupload;
    if (value != null) {
      result
        ..add('dataupload')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  GaleriaRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GaleriaRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'foto':
          result.foto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dataupload':
          result.dataupload = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$GaleriaRecord extends GaleriaRecord {
  @override
  final String? foto;
  @override
  final DateTime? dataupload;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$GaleriaRecord([void Function(GaleriaRecordBuilder)? updates]) =>
      (new GaleriaRecordBuilder()..update(updates))._build();

  _$GaleriaRecord._({this.foto, this.dataupload, this.ffRef}) : super._();

  @override
  GaleriaRecord rebuild(void Function(GaleriaRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GaleriaRecordBuilder toBuilder() => new GaleriaRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GaleriaRecord &&
        foto == other.foto &&
        dataupload == other.dataupload &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, foto.hashCode), dataupload.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GaleriaRecord')
          ..add('foto', foto)
          ..add('dataupload', dataupload)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class GaleriaRecordBuilder
    implements Builder<GaleriaRecord, GaleriaRecordBuilder> {
  _$GaleriaRecord? _$v;

  String? _foto;
  String? get foto => _$this._foto;
  set foto(String? foto) => _$this._foto = foto;

  DateTime? _dataupload;
  DateTime? get dataupload => _$this._dataupload;
  set dataupload(DateTime? dataupload) => _$this._dataupload = dataupload;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  GaleriaRecordBuilder() {
    GaleriaRecord._initializeBuilder(this);
  }

  GaleriaRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _foto = $v.foto;
      _dataupload = $v.dataupload;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GaleriaRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GaleriaRecord;
  }

  @override
  void update(void Function(GaleriaRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GaleriaRecord build() => _build();

  _$GaleriaRecord _build() {
    final _$result = _$v ??
        new _$GaleriaRecord._(foto: foto, dataupload: dataupload, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
