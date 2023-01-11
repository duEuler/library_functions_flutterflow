import '../backend/backend.dart';
import '../components/dueuler_edit_usuario_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DueuleGeoFireMapWidget extends StatefulWidget {
  const DueuleGeoFireMapWidget({
    Key? key,
    this.startPosition,
    this.idrefconsulta,
  }) : super(key: key);

  final LatLng? startPosition;
  final DocumentReference? idrefconsulta;

  @override
  _DueuleGeoFireMapWidgetState createState() => _DueuleGeoFireMapWidgetState();
}

class _DueuleGeoFireMapWidgetState extends State<DueuleGeoFireMapWidget> {
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ConsultaResultadoRecord>>(
      stream: queryConsultaResultadoRecord(
        queryBuilder: (consultaResultadoRecord) => consultaResultadoRecord
            .where('idrefconsulta', isEqualTo: widget.idrefconsulta),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<ConsultaResultadoRecord> containerConsultaResultadoRecordList =
            snapshot.data!;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Visibility(
            visible: (FFAppState().geoFireStarLocation != null) &&
                (containerConsultaResultadoRecordList.length > 0),
            child: FlutterFlowGoogleMap(
              controller: googleMapsController,
              onCameraIdle: (latLng) => googleMapsCenter = latLng,
              initialLocation: googleMapsCenter ??= widget.startPosition!,
              markers: containerConsultaResultadoRecordList
                  .map(
                    (containerConsultaResultadoRecord) => FlutterFlowMarker(
                      containerConsultaResultadoRecord.reference.path,
                      containerConsultaResultadoRecord.latlng!,
                      () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: DueulerEditUsuarioWidget(
                                  idrefusuario: containerConsultaResultadoRecord
                                      .idrefusuario,
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                    ),
                  )
                  .toList(),
              markerColor: GoogleMarkerColor.violet,
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
    );
  }
}
