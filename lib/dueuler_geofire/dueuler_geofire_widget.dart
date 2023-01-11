import '../backend/backend.dart';
import '../components/dueule_geo_fire_map_widget.dart';
import '../components/dueuler_edit_usuario_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DueulerGeofireWidget extends StatefulWidget {
  const DueulerGeofireWidget({
    Key? key,
    this.idrefconsulta,
  }) : super(key: key);

  final DocumentReference? idrefconsulta;

  @override
  _DueulerGeofireWidgetState createState() => _DueulerGeofireWidgetState();
}

class _DueulerGeofireWidgetState extends State<DueulerGeofireWidget> {
  DocumentReference? idRefCnsultaButton;
  DocumentReference? idRefConsultaSlide;
  double? sliderValue;
  var placePickerValue1 = FFPlace();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  DocumentReference? retornoIdRefConsulta;
  String? dropDownValue;
  var placePickerValue2 = FFPlace();
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            '7t1h26mg' /* Geo Fire */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        labelColor: FlutterFlowTheme.of(context).primaryColor,
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        indicatorColor:
                            FlutterFlowTheme.of(context).secondaryColor,
                        tabs: [
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'y1q9x68r' /* GeoFirePoints */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              '9tynkmrn' /* Localizar */,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 15),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      if (FFAppState().geoFireStarLocation !=
                                          null)
                                        Expanded(
                                          child: AutoSizeText(
                                            FFAppState()
                                                .geoFireStarLocation!
                                                .toString(),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      FlutterFlowPlacePicker(
                                        iOSGoogleMapsApiKey: '',
                                        androidGoogleMapsApiKey: '',
                                        webGoogleMapsApiKey: '',
                                        onSelect: (place) async {
                                          setState(
                                              () => placePickerValue1 = place);
                                        },
                                        defaultText: '',
                                        icon: Icon(
                                          Icons.place,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        buttonOptions: FFButtonOptions(
                                          width: 40,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  FFAppState().geoFireDistancia > 0.0
                                      ? '${FFAppState().geoFireDistancia.toString()} KM de circunferência'
                                      : 'Defina uma distancia...',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Slider(
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  inactiveColor: Color(0xFF9E9E9E),
                                  min: 0,
                                  max: 2,
                                  value: sliderValue ??= 0.5,
                                  divisions: 20,
                                  onChanged: (newValue) async {
                                    newValue = double.parse(
                                        newValue.toStringAsFixed(4));
                                    setState(() => sliderValue = newValue);
                                    var _shouldSetState = false;
                                    FFAppState().update(() {
                                      FFAppState().geoFireDistancia =
                                          sliderValue!;
                                    });
                                    if (sliderValue! > 0.0) {
                                      idRefConsultaSlide =
                                          await actions.dueulerGeoFireQuery(
                                        FFAppState().geoFireStarLocation!,
                                        valueOrDefault<double>(
                                          functions.strToDouble(FFAppState()
                                              .geoFireDistancia
                                              .toString()),
                                          0.0,
                                        ),
                                        'usuarios',
                                      );
                                      _shouldSetState = true;

                                      context.pushNamed(
                                        'dueuler_geofire',
                                        queryParams: {
                                          'idrefconsulta': serializeParam(
                                            idRefConsultaSlide,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Sua posição inicial foi atualizada. Informe uma distancia para continuar.'),
                                            content: Text(FFAppState()
                                                .geoFireStarLocation!
                                                .toString()),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                ),
                                StreamBuilder<List<UsuariosRecord>>(
                                  stream: queryUsuariosRecord(
                                    queryBuilder: (usuariosRecord) =>
                                        usuariosRecord
                                            .where('status_ativo',
                                                isEqualTo: true)
                                            .orderBy('nome'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsuariosRecord>
                                        listViewUsuariosRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewUsuariosRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewUsuariosRecord =
                                            listViewUsuariosRecordList[
                                                listViewIndex];
                                        return Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 60,
                                                    icon: Icon(
                                                      Icons
                                                          .delete_forever_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 30,
                                                    ),
                                                    onPressed: () async {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Deseja remover?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Não'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Remover'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        await listViewUsuariosRecord
                                                            .reference
                                                            .delete();
                                                      }
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 60,
                                                    icon: Icon(
                                                      Icons.edit_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 30,
                                                    ),
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child: Container(
                                                              height: 200,
                                                              child:
                                                                  DueulerEditUsuarioWidget(
                                                                idrefusuario:
                                                                    listViewUsuariosRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            listViewUsuariosRecord
                                                                .nome!,
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 16,
                                                                ),
                                                          ),
                                                        ),
                                                        if (listViewUsuariosRecord
                                                                .local !=
                                                            null)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              listViewUsuariosRecord
                                                                  .local!
                                                                  .toString(),
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 60,
                                                    icon: Icon(
                                                      Icons.my_location_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30,
                                                    ),
                                                    onPressed: () async {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .geoFireStarLocation =
                                                            listViewUsuariosRecord
                                                                .local;
                                                      });
                                                      if (sliderValue! > 0.0) {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .geoFireDistancia =
                                                              sliderValue!;
                                                        });
                                                        idRefCnsultaButton =
                                                            await actions
                                                                .dueulerGeoFireQuery(
                                                          FFAppState()
                                                              .geoFireStarLocation!,
                                                          valueOrDefault<
                                                              double>(
                                                            functions.strToDouble(
                                                                FFAppState()
                                                                    .geoFireDistancia
                                                                    .toString()),
                                                            0.0,
                                                          ),
                                                          'usuarios',
                                                        );

                                                        context.pushNamed(
                                                          'dueuler_geofire',
                                                          queryParams: {
                                                            'idrefconsulta':
                                                                serializeParam(
                                                              idRefConsultaSlide,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Sua posição inicial foi atualizada. Informe uma distancia para continuar.'),
                                                              content: Text(
                                                                  FFAppState()
                                                                      .geoFireStarLocation!
                                                                      .toString()),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }

                                                      setState(() {});
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Expanded(
                                  child: StreamBuilder<
                                      List<ConsultaResultadoRecord>>(
                                    stream: queryConsultaResultadoRecord(
                                      queryBuilder: (consultaResultadoRecord) =>
                                          consultaResultadoRecord.where(
                                              'idrefconsulta',
                                              isEqualTo: widget.idrefconsulta !=
                                                      null
                                                  ? widget.idrefconsulta
                                                  : FFAppState()
                                                      .geoFireIdRefConsulta),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<ConsultaResultadoRecord>
                                          containerConsultaResultadoRecordList =
                                          snapshot.data!;
                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Visibility(
                                          visible: (FFAppState()
                                                      .geoFireStarLocation !=
                                                  null) &&
                                              (containerConsultaResultadoRecordList
                                                      .length >
                                                  0),
                                          child: FlutterFlowGoogleMap(
                                            controller: googleMapsController,
                                            onCameraIdle: (latLng) =>
                                                googleMapsCenter = latLng,
                                            initialLocation:
                                                googleMapsCenter ??=
                                                    FFAppState()
                                                        .geoFireStarLocation!,
                                            markers:
                                                containerConsultaResultadoRecordList
                                                    .map(
                                                      (containerConsultaResultadoRecord) =>
                                                          FlutterFlowMarker(
                                                        containerConsultaResultadoRecord
                                                            .reference.path,
                                                        containerConsultaResultadoRecord
                                                            .latlng!,
                                                        () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.3,
                                                                  child:
                                                                      DueulerEditUsuarioWidget(
                                                                    idrefusuario:
                                                                        containerConsultaResultadoRecord
                                                                            .idrefusuario,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                      ),
                                                    )
                                                    .toList(),
                                            markerColor:
                                                GoogleMarkerColor.violet,
                                            mapType: MapType.normal,
                                            style: GoogleMapStyle.standard,
                                            initialZoom: 14,
                                            allowInteraction: true,
                                            allowZoom: true,
                                            showZoomControls: true,
                                            showLocation: true,
                                            showCompass: false,
                                            showMapToolbar: false,
                                            showTraffic: false,
                                            centerMapOnMarkerTap: true,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: FlutterFlowPlacePicker(
                                            iOSGoogleMapsApiKey: '',
                                            androidGoogleMapsApiKey: '',
                                            webGoogleMapsApiKey: '',
                                            onSelect: (place) async {
                                              setState(() =>
                                                  placePickerValue2 = place);
                                            },
                                            defaultText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '97jmqt2c' /* Localização */,
                                            ),
                                            icon: Icon(
                                              Icons.place,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                            buttonOptions: FFButtonOptions(
                                              width: 200,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: FlutterFlowDropDown<String>(
                                              options: [
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'y7dus40h' /* 0.1 */,
                                                ),
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'vw69pqpz' /* 0.3 */,
                                                ),
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'bjjgg7yn' /* 0.5 */,
                                                ),
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '3vzbday6' /* 1 */,
                                                ),
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'soxc97f9' /* 5 */,
                                                ),
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'bttgovq8' /* 10 */,
                                                ),
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'qt9iyitb' /* 50 */,
                                                )
                                              ],
                                              onChanged: (val) => setState(
                                                  () => dropDownValue = val),
                                              width: 180,
                                              height: 50,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'n3rabzuy' /* Distancia */,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              elevation: 2,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0,
                                              borderRadius: 12,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(12, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              var _shouldSetState = false;
                                              if (dropDownValue !=
                                                  'Distancia') {
                                                if (FFAppState()
                                                        .geoFireStarLocation !=
                                                    null) {
                                                  retornoIdRefConsulta =
                                                      await actions
                                                          .dueulerGeoFireQuery(
                                                    FFAppState()
                                                        .geoFireStarLocation!,
                                                    valueOrDefault<double>(
                                                      functions.strToDouble(
                                                          dropDownValue!),
                                                      0.0,
                                                    ),
                                                    'usuarios',
                                                  );
                                                  _shouldSetState = true;
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .geoFireIdRefConsulta =
                                                        retornoIdRefConsulta;
                                                  });
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.7,
                                                          child:
                                                              DueuleGeoFireMapWidget(
                                                            startPosition:
                                                                FFAppState()
                                                                    .geoFireStarLocation,
                                                            idrefconsulta:
                                                                FFAppState()
                                                                    .geoFireIdRefConsulta,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Ops!'),
                                                        content: Text(
                                                            'Você deve selecionar uma localização.'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }

                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'GeoFire pesquisado!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '3fcb5aa4' /* Exibir na consulta */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 200,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (FFAppState()
                                                      .geoFireIdRefConsulta !=
                                                  null) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child:
                                                          DueuleGeoFireMapWidget(
                                                        startPosition: FFAppState()
                                                            .geoFireStarLocation,
                                                        idrefconsulta: FFAppState()
                                                            .geoFireIdRefConsulta,
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Realize uma consulta!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'gtzndw8a' /* Ver mapa */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (FFAppState().geoFireTableUser.length > 0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: Builder(
                                        builder: (context) {
                                          final listaGeoFire = FFAppState()
                                              .geoFireTableUser
                                              .toList();
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                listaGeoFire.length,
                                                (listaGeoFireIndex) {
                                              final listaGeoFireItem =
                                                  listaGeoFire[
                                                      listaGeoFireIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 10),
                                                child: StreamBuilder<
                                                    UsuariosRecord>(
                                                  stream: UsuariosRecord
                                                      .getDocument(
                                                          listaGeoFireItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final containerUsuariosRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    10, 10, 10),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  containerUsuariosRecord
                                                                      .nome!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    containerUsuariosRecord
                                                                        .endereco!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
