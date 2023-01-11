// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_habitos_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsuarioHabitosStruct> _$usuarioHabitosStructSerializer =
    new _$UsuarioHabitosStructSerializer();

class _$UsuarioHabitosStructSerializer
    implements StructuredSerializer<UsuarioHabitosStruct> {
  @override
  final Iterable<Type> types = const [
    UsuarioHabitosStruct,
    _$UsuarioHabitosStruct
  ];
  @override
  final String wireName = 'UsuarioHabitosStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UsuarioHabitosStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.titulo;
    if (value != null) {
      result
        ..add('titulo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.texto;
    if (value != null) {
      result
        ..add('texto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.diasdasemana;
    if (value != null) {
      result
        ..add('diasdasemana')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  UsuarioHabitosStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsuarioHabitosStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'titulo':
          result.titulo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'texto':
          result.texto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'diasdasemana':
          result.diasdasemana = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$UsuarioHabitosStruct extends UsuarioHabitosStruct {
  @override
  final String? titulo;
  @override
  final String? texto;
  @override
  final int? diasdasemana;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$UsuarioHabitosStruct(
          [void Function(UsuarioHabitosStructBuilder)? updates]) =>
      (new UsuarioHabitosStructBuilder()..update(updates))._build();

  _$UsuarioHabitosStruct._(
      {this.titulo,
      this.texto,
      this.diasdasemana,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'UsuarioHabitosStruct', 'firestoreUtilData');
  }

  @override
  UsuarioHabitosStruct rebuild(
          void Function(UsuarioHabitosStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsuarioHabitosStructBuilder toBuilder() =>
      new UsuarioHabitosStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsuarioHabitosStruct &&
        titulo == other.titulo &&
        texto == other.texto &&
        diasdasemana == other.diasdasemana &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, titulo.hashCode), texto.hashCode),
            diasdasemana.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsuarioHabitosStruct')
          ..add('titulo', titulo)
          ..add('texto', texto)
          ..add('diasdasemana', diasdasemana)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class UsuarioHabitosStructBuilder
    implements Builder<UsuarioHabitosStruct, UsuarioHabitosStructBuilder> {
  _$UsuarioHabitosStruct? _$v;

  String? _titulo;
  String? get titulo => _$this._titulo;
  set titulo(String? titulo) => _$this._titulo = titulo;

  String? _texto;
  String? get texto => _$this._texto;
  set texto(String? texto) => _$this._texto = texto;

  int? _diasdasemana;
  int? get diasdasemana => _$this._diasdasemana;
  set diasdasemana(int? diasdasemana) => _$this._diasdasemana = diasdasemana;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  UsuarioHabitosStructBuilder() {
    UsuarioHabitosStruct._initializeBuilder(this);
  }

  UsuarioHabitosStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _titulo = $v.titulo;
      _texto = $v.texto;
      _diasdasemana = $v.diasdasemana;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsuarioHabitosStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsuarioHabitosStruct;
  }

  @override
  void update(void Function(UsuarioHabitosStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsuarioHabitosStruct build() => _build();

  _$UsuarioHabitosStruct _build() {
    final _$result = _$v ??
        new _$UsuarioHabitosStruct._(
            titulo: titulo,
            texto: texto,
            diasdasemana: diasdasemana,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'UsuarioHabitosStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
