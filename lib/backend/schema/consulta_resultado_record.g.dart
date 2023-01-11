// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_resultado_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConsultaResultadoRecord> _$consultaResultadoRecordSerializer =
    new _$ConsultaResultadoRecordSerializer();

class _$ConsultaResultadoRecordSerializer
    implements StructuredSerializer<ConsultaResultadoRecord> {
  @override
  final Iterable<Type> types = const [
    ConsultaResultadoRecord,
    _$ConsultaResultadoRecord
  ];
  @override
  final String wireName = 'ConsultaResultadoRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ConsultaResultadoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
    value = object.nome;
    if (value != null) {
      result
        ..add('nome')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idrefconsulta;
    if (value != null) {
      result
        ..add('idrefconsulta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  ConsultaResultadoRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConsultaResultadoRecordBuilder();

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
        case 'nome':
          result.nome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idrefconsulta':
          result.idrefconsulta = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$ConsultaResultadoRecord extends ConsultaResultadoRecord {
  @override
  final DocumentReference<Object?>? idrefusuario;
  @override
  final LatLng? latlng;
  @override
  final String? nome;
  @override
  final DocumentReference<Object?>? idrefconsulta;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConsultaResultadoRecord(
          [void Function(ConsultaResultadoRecordBuilder)? updates]) =>
      (new ConsultaResultadoRecordBuilder()..update(updates))._build();

  _$ConsultaResultadoRecord._(
      {this.idrefusuario,
      this.latlng,
      this.nome,
      this.idrefconsulta,
      this.ffRef})
      : super._();

  @override
  ConsultaResultadoRecord rebuild(
          void Function(ConsultaResultadoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsultaResultadoRecordBuilder toBuilder() =>
      new ConsultaResultadoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsultaResultadoRecord &&
        idrefusuario == other.idrefusuario &&
        latlng == other.latlng &&
        nome == other.nome &&
        idrefconsulta == other.idrefconsulta &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, idrefusuario.hashCode), latlng.hashCode),
                nome.hashCode),
            idrefconsulta.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsultaResultadoRecord')
          ..add('idrefusuario', idrefusuario)
          ..add('latlng', latlng)
          ..add('nome', nome)
          ..add('idrefconsulta', idrefconsulta)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConsultaResultadoRecordBuilder
    implements
        Builder<ConsultaResultadoRecord, ConsultaResultadoRecordBuilder> {
  _$ConsultaResultadoRecord? _$v;

  DocumentReference<Object?>? _idrefusuario;
  DocumentReference<Object?>? get idrefusuario => _$this._idrefusuario;
  set idrefusuario(DocumentReference<Object?>? idrefusuario) =>
      _$this._idrefusuario = idrefusuario;

  LatLng? _latlng;
  LatLng? get latlng => _$this._latlng;
  set latlng(LatLng? latlng) => _$this._latlng = latlng;

  String? _nome;
  String? get nome => _$this._nome;
  set nome(String? nome) => _$this._nome = nome;

  DocumentReference<Object?>? _idrefconsulta;
  DocumentReference<Object?>? get idrefconsulta => _$this._idrefconsulta;
  set idrefconsulta(DocumentReference<Object?>? idrefconsulta) =>
      _$this._idrefconsulta = idrefconsulta;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConsultaResultadoRecordBuilder() {
    ConsultaResultadoRecord._initializeBuilder(this);
  }

  ConsultaResultadoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idrefusuario = $v.idrefusuario;
      _latlng = $v.latlng;
      _nome = $v.nome;
      _idrefconsulta = $v.idrefconsulta;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsultaResultadoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConsultaResultadoRecord;
  }

  @override
  void update(void Function(ConsultaResultadoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsultaResultadoRecord build() => _build();

  _$ConsultaResultadoRecord _build() {
    final _$result = _$v ??
        new _$ConsultaResultadoRecord._(
            idrefusuario: idrefusuario,
            latlng: latlng,
            nome: nome,
            idrefconsulta: idrefconsulta,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
