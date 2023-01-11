// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geofire_usuario_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GeofireUsuarioStruct> _$geofireUsuarioStructSerializer =
    new _$GeofireUsuarioStructSerializer();

class _$GeofireUsuarioStructSerializer
    implements StructuredSerializer<GeofireUsuarioStruct> {
  @override
  final Iterable<Type> types = const [
    GeofireUsuarioStruct,
    _$GeofireUsuarioStruct
  ];
  @override
  final String wireName = 'GeofireUsuarioStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GeofireUsuarioStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.idrefusuario;
    if (value != null) {
      result
        ..add('idrefusuario')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.latlng;
    if (value != null) {
      result
        ..add('latlng')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    return result;
  }

  @override
  GeofireUsuarioStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GeofireUsuarioStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'idrefusuario':
          result.idrefusuario = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'latlng':
          result.latlng = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$GeofireUsuarioStruct extends GeofireUsuarioStruct {
  @override
  final DocumentReference<Object?>? idrefusuario;
  @override
  final LatLng? latlng;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$GeofireUsuarioStruct(
          [void Function(GeofireUsuarioStructBuilder)? updates]) =>
      (new GeofireUsuarioStructBuilder()..update(updates))._build();

  _$GeofireUsuarioStruct._(
      {this.idrefusuario, this.latlng, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'GeofireUsuarioStruct', 'firestoreUtilData');
  }

  @override
  GeofireUsuarioStruct rebuild(
          void Function(GeofireUsuarioStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeofireUsuarioStructBuilder toBuilder() =>
      new GeofireUsuarioStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeofireUsuarioStruct &&
        idrefusuario == other.idrefusuario &&
        latlng == other.latlng &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, idrefusuario.hashCode), latlng.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeofireUsuarioStruct')
          ..add('idrefusuario', idrefusuario)
          ..add('latlng', latlng)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class GeofireUsuarioStructBuilder
    implements Builder<GeofireUsuarioStruct, GeofireUsuarioStructBuilder> {
  _$GeofireUsuarioStruct? _$v;

  DocumentReference<Object?>? _idrefusuario;
  DocumentReference<Object?>? get idrefusuario => _$this._idrefusuario;
  set idrefusuario(DocumentReference<Object?>? idrefusuario) =>
      _$this._idrefusuario = idrefusuario;

  LatLng? _latlng;
  LatLng? get latlng => _$this._latlng;
  set latlng(LatLng? latlng) => _$this._latlng = latlng;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  GeofireUsuarioStructBuilder() {
    GeofireUsuarioStruct._initializeBuilder(this);
  }

  GeofireUsuarioStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idrefusuario = $v.idrefusuario;
      _latlng = $v.latlng;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeofireUsuarioStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeofireUsuarioStruct;
  }

  @override
  void update(void Function(GeofireUsuarioStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeofireUsuarioStruct build() => _build();

  _$GeofireUsuarioStruct _build() {
    final _$result = _$v ??
        new _$GeofireUsuarioStruct._(
            idrefusuario: idrefusuario,
            latlng: latlng,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'GeofireUsuarioStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
