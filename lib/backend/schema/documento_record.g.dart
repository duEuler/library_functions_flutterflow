// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documento_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DocumentoRecord> _$documentoRecordSerializer =
    new _$DocumentoRecordSerializer();

class _$DocumentoRecordSerializer
    implements StructuredSerializer<DocumentoRecord> {
  @override
  final Iterable<Type> types = const [DocumentoRecord, _$DocumentoRecord];
  @override
  final String wireName = 'DocumentoRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DocumentoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.documentoFrente;
    if (value != null) {
      result
        ..add('documento_frente')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.documentoVerso;
    if (value != null) {
      result
        ..add('documento_verso')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.assinatura;
    if (value != null) {
      result
        ..add('assinatura')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.documentoTipo;
    if (value != null) {
      result
        ..add('documento_tipo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.documentoNumero;
    if (value != null) {
      result
        ..add('documento_numero')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aprovado;
    if (value != null) {
      result
        ..add('aprovado')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dataSolicitacao;
    if (value != null) {
      result
        ..add('data_solicitacao')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dataAprovado;
    if (value != null) {
      result
        ..add('data_aprovado')
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
  DocumentoRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DocumentoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'documento_frente':
          result.documentoFrente = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'documento_verso':
          result.documentoVerso = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'assinatura':
          result.assinatura = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'documento_tipo':
          result.documentoTipo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'documento_numero':
          result.documentoNumero = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'aprovado':
          result.aprovado = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'data_solicitacao':
          result.dataSolicitacao = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'data_aprovado':
          result.dataAprovado = serializers.deserialize(value,
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

class _$DocumentoRecord extends DocumentoRecord {
  @override
  final String? documentoFrente;
  @override
  final String? documentoVerso;
  @override
  final String? assinatura;
  @override
  final String? documentoTipo;
  @override
  final String? documentoNumero;
  @override
  final int? aprovado;
  @override
  final DateTime? dataSolicitacao;
  @override
  final DateTime? dataAprovado;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DocumentoRecord([void Function(DocumentoRecordBuilder)? updates]) =>
      (new DocumentoRecordBuilder()..update(updates))._build();

  _$DocumentoRecord._(
      {this.documentoFrente,
      this.documentoVerso,
      this.assinatura,
      this.documentoTipo,
      this.documentoNumero,
      this.aprovado,
      this.dataSolicitacao,
      this.dataAprovado,
      this.ffRef})
      : super._();

  @override
  DocumentoRecord rebuild(void Function(DocumentoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DocumentoRecordBuilder toBuilder() =>
      new DocumentoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DocumentoRecord &&
        documentoFrente == other.documentoFrente &&
        documentoVerso == other.documentoVerso &&
        assinatura == other.assinatura &&
        documentoTipo == other.documentoTipo &&
        documentoNumero == other.documentoNumero &&
        aprovado == other.aprovado &&
        dataSolicitacao == other.dataSolicitacao &&
        dataAprovado == other.dataAprovado &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, documentoFrente.hashCode),
                                    documentoVerso.hashCode),
                                assinatura.hashCode),
                            documentoTipo.hashCode),
                        documentoNumero.hashCode),
                    aprovado.hashCode),
                dataSolicitacao.hashCode),
            dataAprovado.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DocumentoRecord')
          ..add('documentoFrente', documentoFrente)
          ..add('documentoVerso', documentoVerso)
          ..add('assinatura', assinatura)
          ..add('documentoTipo', documentoTipo)
          ..add('documentoNumero', documentoNumero)
          ..add('aprovado', aprovado)
          ..add('dataSolicitacao', dataSolicitacao)
          ..add('dataAprovado', dataAprovado)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DocumentoRecordBuilder
    implements Builder<DocumentoRecord, DocumentoRecordBuilder> {
  _$DocumentoRecord? _$v;

  String? _documentoFrente;
  String? get documentoFrente => _$this._documentoFrente;
  set documentoFrente(String? documentoFrente) =>
      _$this._documentoFrente = documentoFrente;

  String? _documentoVerso;
  String? get documentoVerso => _$this._documentoVerso;
  set documentoVerso(String? documentoVerso) =>
      _$this._documentoVerso = documentoVerso;

  String? _assinatura;
  String? get assinatura => _$this._assinatura;
  set assinatura(String? assinatura) => _$this._assinatura = assinatura;

  String? _documentoTipo;
  String? get documentoTipo => _$this._documentoTipo;
  set documentoTipo(String? documentoTipo) =>
      _$this._documentoTipo = documentoTipo;

  String? _documentoNumero;
  String? get documentoNumero => _$this._documentoNumero;
  set documentoNumero(String? documentoNumero) =>
      _$this._documentoNumero = documentoNumero;

  int? _aprovado;
  int? get aprovado => _$this._aprovado;
  set aprovado(int? aprovado) => _$this._aprovado = aprovado;

  DateTime? _dataSolicitacao;
  DateTime? get dataSolicitacao => _$this._dataSolicitacao;
  set dataSolicitacao(DateTime? dataSolicitacao) =>
      _$this._dataSolicitacao = dataSolicitacao;

  DateTime? _dataAprovado;
  DateTime? get dataAprovado => _$this._dataAprovado;
  set dataAprovado(DateTime? dataAprovado) =>
      _$this._dataAprovado = dataAprovado;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DocumentoRecordBuilder() {
    DocumentoRecord._initializeBuilder(this);
  }

  DocumentoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _documentoFrente = $v.documentoFrente;
      _documentoVerso = $v.documentoVerso;
      _assinatura = $v.assinatura;
      _documentoTipo = $v.documentoTipo;
      _documentoNumero = $v.documentoNumero;
      _aprovado = $v.aprovado;
      _dataSolicitacao = $v.dataSolicitacao;
      _dataAprovado = $v.dataAprovado;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DocumentoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DocumentoRecord;
  }

  @override
  void update(void Function(DocumentoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DocumentoRecord build() => _build();

  _$DocumentoRecord _build() {
    final _$result = _$v ??
        new _$DocumentoRecord._(
            documentoFrente: documentoFrente,
            documentoVerso: documentoVerso,
            assinatura: assinatura,
            documentoTipo: documentoTipo,
            documentoNumero: documentoNumero,
            aprovado: aprovado,
            dataSolicitacao: dataSolicitacao,
            dataAprovado: dataAprovado,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
