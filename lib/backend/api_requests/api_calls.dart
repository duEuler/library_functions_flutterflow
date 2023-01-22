import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start PHP Group Code

class PhpGroup {
  static String baseUrl = 'https://dueuler.com/api';
  static Map<String, String> headers = {};
  static CheckLoginCall checkLoginCall = CheckLoginCall();
  static GetListaCall getListaCall = GetListaCall();
  static UpdateTarefaCall updateTarefaCall = UpdateTarefaCall();
  static DeleteTarefaCall deleteTarefaCall = DeleteTarefaCall();
  static InsertTarefaCall insertTarefaCall = InsertTarefaCall();
}

class CheckLoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'checkLogin',
      apiUrl: '${PhpGroup.baseUrl}/index.php',
      callType: ApiCallType.GET,
      headers: {
        ...PhpGroup.headers,
      },
      params: {
        'email': email,
        'password': password,
        'service': "check_login",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetListaCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getLista',
      apiUrl: '${PhpGroup.baseUrl}/index.php',
      callType: ApiCallType.GET,
      headers: {
        ...PhpGroup.headers,
      },
      params: {
        'service': "get_lista",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTarefaCall {
  Future<ApiCallResponse> call({
    int? id,
    String? tarefa = '',
    String? data = '',
    FFLocalFile? photo,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'updateTarefa',
      apiUrl: '${PhpGroup.baseUrl}/index.php',
      callType: ApiCallType.POST,
      headers: {
        ...PhpGroup.headers,
      },
      params: {
        'service': "update_tarefa",
        'id': id,
        'tarefa': tarefa,
        'data': data,
        'photo': photo,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteTarefaCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteTarefa',
      apiUrl: '${PhpGroup.baseUrl}/index.php',
      callType: ApiCallType.GET,
      headers: {
        ...PhpGroup.headers,
      },
      params: {
        'service': "delete_tarefa",
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class InsertTarefaCall {
  Future<ApiCallResponse> call({
    String? tarefa = '',
    String? data = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'insertTarefa',
      apiUrl: '${PhpGroup.baseUrl}/index.php',
      callType: ApiCallType.POST,
      headers: {
        ...PhpGroup.headers,
      },
      params: {
        'tarefa': tarefa,
        'data': data,
        'service': "insert_tarefa",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End PHP Group Code

/// Start VIACEP Group Code

class ViacepGroup {
  static String baseUrl = 'https://viacep.com.br/ws/';
  static Map<String, String> headers = {};
  static GetEnderecoCall getEnderecoCall = GetEnderecoCall();
  static GetListaCepPorEnderecoCall getListaCepPorEnderecoCall =
      GetListaCepPorEnderecoCall();
}

class GetEnderecoCall {
  Future<ApiCallResponse> call({
    String? cep = '38900000',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getEndereco',
      apiUrl: '${ViacepGroup.baseUrl}${cep}/json',
      callType: ApiCallType.GET,
      headers: {
        ...ViacepGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetListaCepPorEnderecoCall {
  Future<ApiCallResponse> call({
    String? uf = '',
    String? city = '',
    String? andress = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getListaCepPorEndereco',
      apiUrl: '${ViacepGroup.baseUrl}${uf}/${city}/${andress}/json',
      callType: ApiCallType.GET,
      headers: {
        ...ViacepGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End VIACEP Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
