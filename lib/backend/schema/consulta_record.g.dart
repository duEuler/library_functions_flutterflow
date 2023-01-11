// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConsultaRecord> _$consultaRecordSerializer =
    new _$ConsultaRecordSerializer();

class _$ConsultaRecordSerializer
    implements StructuredSerializer<ConsultaRecord> {
  @override
  final Iterable<Type> types = const [ConsultaRecord, _$ConsultaRecord];
  @override
  final String wireName = 'ConsultaRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConsultaRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.lista;
    if (value != null) {
      result
        ..add('lista')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GeofireUsuarioStruct)])));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('data')
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
  ConsultaRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConsultaRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lista':
          result.lista.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GeofireUsuarioStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'data':
          result.data = serializers.deserialize(value,
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

class _$ConsultaRecord extends ConsultaRecord {
  @override
  final BuiltList<GeofireUsuarioStruct>? lista;
  @override
  final DateTime? data;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConsultaRecord([void Function(ConsultaRecordBuilder)? updates]) =>
      (new ConsultaRecordBuilder()..update(updates))._build();

  _$ConsultaRecord._({this.lista, this.data, this.ffRef}) : super._();

  @override
  ConsultaRecord rebuild(void Function(ConsultaRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsultaRecordBuilder toBuilder() =>
      new ConsultaRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsultaRecord &&
        lista == other.lista &&
        data == other.data &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, lista.hashCode), data.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsultaRecord')
          ..add('lista', lista)
          ..add('data', data)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConsultaRecordBuilder
    implements Builder<ConsultaRecord, ConsultaRecordBuilder> {
  _$ConsultaRecord? _$v;

  ListBuilder<GeofireUsuarioStruct>? _lista;
  ListBuilder<GeofireUsuarioStruct> get lista =>
      _$this._lista ??= new ListBuilder<GeofireUsuarioStruct>();
  set lista(ListBuilder<GeofireUsuarioStruct>? lista) => _$this._lista = lista;

  DateTime? _data;
  DateTime? get data => _$this._data;
  set data(DateTime? data) => _$this._data = data;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConsultaRecordBuilder() {
    ConsultaRecord._initializeBuilder(this);
  }

  ConsultaRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lista = $v.lista?.toBuilder();
      _data = $v.data;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsultaRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConsultaRecord;
  }

  @override
  void update(void Function(ConsultaRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsultaRecord build() => _build();

  _$ConsultaRecord _build() {
    _$ConsultaRecord _$result;
    try {
      _$result = _$v ??
          new _$ConsultaRecord._(
              lista: _lista?.build(), data: data, ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'lista';
        _lista?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConsultaRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
