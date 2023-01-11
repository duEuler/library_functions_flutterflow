// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuarios_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsuariosRecord> _$usuariosRecordSerializer =
    new _$UsuariosRecordSerializer();

class _$UsuariosRecordSerializer
    implements StructuredSerializer<UsuariosRecord> {
  @override
  final Iterable<Type> types = const [UsuariosRecord, _$UsuariosRecord];
  @override
  final String wireName = 'UsuariosRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsuariosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nome;
    if (value != null) {
      result
        ..add('nome')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.habitos;
    if (value != null) {
      result
        ..add('habitos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(UsuarioHabitosStruct)])));
    }
    value = object.statusAtivo;
    if (value != null) {
      result
        ..add('status_ativo')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.local;
    if (value != null) {
      result
        ..add('local')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.endereco;
    if (value != null) {
      result
        ..add('endereco')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  UsuariosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsuariosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nome':
          result.nome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'habitos':
          result.habitos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UsuarioHabitosStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'status_ativo':
          result.statusAtivo = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'local':
          result.local = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'endereco':
          result.endereco = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$UsuariosRecord extends UsuariosRecord {
  @override
  final String? nome;
  @override
  final BuiltList<UsuarioHabitosStruct>? habitos;
  @override
  final bool? statusAtivo;
  @override
  final LatLng? local;
  @override
  final String? endereco;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsuariosRecord([void Function(UsuariosRecordBuilder)? updates]) =>
      (new UsuariosRecordBuilder()..update(updates))._build();

  _$UsuariosRecord._(
      {this.nome,
      this.habitos,
      this.statusAtivo,
      this.local,
      this.endereco,
      this.ffRef})
      : super._();

  @override
  UsuariosRecord rebuild(void Function(UsuariosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsuariosRecordBuilder toBuilder() =>
      new UsuariosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsuariosRecord &&
        nome == other.nome &&
        habitos == other.habitos &&
        statusAtivo == other.statusAtivo &&
        local == other.local &&
        endereco == other.endereco &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, nome.hashCode), habitos.hashCode),
                    statusAtivo.hashCode),
                local.hashCode),
            endereco.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsuariosRecord')
          ..add('nome', nome)
          ..add('habitos', habitos)
          ..add('statusAtivo', statusAtivo)
          ..add('local', local)
          ..add('endereco', endereco)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsuariosRecordBuilder
    implements Builder<UsuariosRecord, UsuariosRecordBuilder> {
  _$UsuariosRecord? _$v;

  String? _nome;
  String? get nome => _$this._nome;
  set nome(String? nome) => _$this._nome = nome;

  ListBuilder<UsuarioHabitosStruct>? _habitos;
  ListBuilder<UsuarioHabitosStruct> get habitos =>
      _$this._habitos ??= new ListBuilder<UsuarioHabitosStruct>();
  set habitos(ListBuilder<UsuarioHabitosStruct>? habitos) =>
      _$this._habitos = habitos;

  bool? _statusAtivo;
  bool? get statusAtivo => _$this._statusAtivo;
  set statusAtivo(bool? statusAtivo) => _$this._statusAtivo = statusAtivo;

  LatLng? _local;
  LatLng? get local => _$this._local;
  set local(LatLng? local) => _$this._local = local;

  String? _endereco;
  String? get endereco => _$this._endereco;
  set endereco(String? endereco) => _$this._endereco = endereco;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsuariosRecordBuilder() {
    UsuariosRecord._initializeBuilder(this);
  }

  UsuariosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nome = $v.nome;
      _habitos = $v.habitos?.toBuilder();
      _statusAtivo = $v.statusAtivo;
      _local = $v.local;
      _endereco = $v.endereco;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsuariosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsuariosRecord;
  }

  @override
  void update(void Function(UsuariosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsuariosRecord build() => _build();

  _$UsuariosRecord _build() {
    _$UsuariosRecord _$result;
    try {
      _$result = _$v ??
          new _$UsuariosRecord._(
              nome: nome,
              habitos: _habitos?.build(),
              statusAtivo: statusAtivo,
              local: local,
              endereco: endereco,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'habitos';
        _habitos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsuariosRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
