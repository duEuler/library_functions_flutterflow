import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _tableUser = prefs.getStringList('ff_tableUser')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _tableUser;
    _tableUserLastId = prefs.getInt('ff_tableUserLastId') ?? _tableUserLastId;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _tableUser = [];
  List<dynamic> get tableUser => _tableUser;
  set tableUser(List<dynamic> _value) {
    _tableUser = _value;
    prefs.setStringList(
        'ff_tableUser', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToTableUser(dynamic _value) {
    _tableUser.add(_value);
    prefs.setStringList(
        'ff_tableUser', _tableUser.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTableUser(dynamic _value) {
    _tableUser.remove(_value);
    prefs.setStringList(
        'ff_tableUser', _tableUser.map((x) => jsonEncode(x)).toList());
  }

  int _tableUserLastId = 0;
  int get tableUserLastId => _tableUserLastId;
  set tableUserLastId(int _value) {
    _tableUserLastId = _value;
    prefs.setInt('ff_tableUserLastId', _value);
  }

  List<DocumentReference> _geoFireTableUser = [];
  List<DocumentReference> get geoFireTableUser => _geoFireTableUser;
  set geoFireTableUser(List<DocumentReference> _value) {
    _geoFireTableUser = _value;
  }

  void addToGeoFireTableUser(DocumentReference _value) {
    _geoFireTableUser.add(_value);
  }

  void removeFromGeoFireTableUser(DocumentReference _value) {
    _geoFireTableUser.remove(_value);
  }

  List<LatLng> _geoFireTableUserLatLng = [];
  List<LatLng> get geoFireTableUserLatLng => _geoFireTableUserLatLng;
  set geoFireTableUserLatLng(List<LatLng> _value) {
    _geoFireTableUserLatLng = _value;
  }

  void addToGeoFireTableUserLatLng(LatLng _value) {
    _geoFireTableUserLatLng.add(_value);
  }

  void removeFromGeoFireTableUserLatLng(LatLng _value) {
    _geoFireTableUserLatLng.remove(_value);
  }

  LatLng? _geoFireStarLocation;
  LatLng? get geoFireStarLocation => _geoFireStarLocation;
  set geoFireStarLocation(LatLng? _value) {
    _geoFireStarLocation = _value;
  }

  DocumentReference? _geoFireIdRefConsulta;
  DocumentReference? get geoFireIdRefConsulta => _geoFireIdRefConsulta;
  set geoFireIdRefConsulta(DocumentReference? _value) {
    _geoFireIdRefConsulta = _value;
  }

  double _geoFireDistancia = 0.5;
  double get geoFireDistancia => _geoFireDistancia;
  set geoFireDistancia(double _value) {
    _geoFireDistancia = _value;
  }

  LatLng? _cacheGeoFireStart;
  LatLng? get cacheGeoFireStart => _cacheGeoFireStart;
  set cacheGeoFireStart(LatLng? _value) {
    _cacheGeoFireStart = _value;
  }

  String _imageCache = '';
  String get imageCache => _imageCache;
  set imageCache(String _value) {
    _imageCache = _value;
  }

  DocumentReference? _authDocUsuarioSelecionado;
  DocumentReference? get authDocUsuarioSelecionado =>
      _authDocUsuarioSelecionado;
  set authDocUsuarioSelecionado(DocumentReference? _value) {
    _authDocUsuarioSelecionado = _value;
  }

  String _authDocNumeroDocumento = '';
  String get authDocNumeroDocumento => _authDocNumeroDocumento;
  set authDocNumeroDocumento(String _value) {
    _authDocNumeroDocumento = _value;
  }

  int _apiPHPUsuarioId = 0;
  int get apiPHPUsuarioId => _apiPHPUsuarioId;
  set apiPHPUsuarioId(int _value) {
    _apiPHPUsuarioId = _value;
  }

  List<dynamic> _apiPHPListaTarefa = [];
  List<dynamic> get apiPHPListaTarefa => _apiPHPListaTarefa;
  set apiPHPListaTarefa(List<dynamic> _value) {
    _apiPHPListaTarefa = _value;
  }

  void addToApiPHPListaTarefa(dynamic _value) {
    _apiPHPListaTarefa.add(_value);
  }

  void removeFromApiPHPListaTarefa(dynamic _value) {
    _apiPHPListaTarefa.remove(_value);
  }

  String _apiPHPUsuarioName = '';
  String get apiPHPUsuarioName => _apiPHPUsuarioName;
  set apiPHPUsuarioName(String _value) {
    _apiPHPUsuarioName = _value;
  }

  dynamic _apiVIACEPResultado;
  dynamic get apiVIACEPResultado => _apiVIACEPResultado;
  set apiVIACEPResultado(dynamic _value) {
    _apiVIACEPResultado = _value;
  }

  List<dynamic> _apiVIACEPLista = [];
  List<dynamic> get apiVIACEPLista => _apiVIACEPLista;
  set apiVIACEPLista(List<dynamic> _value) {
    _apiVIACEPLista = _value;
  }

  void addToApiVIACEPLista(dynamic _value) {
    _apiVIACEPLista.add(_value);
  }

  void removeFromApiVIACEPLista(dynamic _value) {
    _apiVIACEPLista.remove(_value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
