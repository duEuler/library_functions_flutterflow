import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class DueulerSendAuthDocWidget extends StatefulWidget {
  const DueulerSendAuthDocWidget({
    Key? key,
    this.idrefusuario,
  }) : super(key: key);

  final DocumentReference? idrefusuario;

  @override
  _DueulerSendAuthDocWidgetState createState() =>
      _DueulerSendAuthDocWidgetState();
}

class _DueulerSendAuthDocWidgetState extends State<DueulerSendAuthDocWidget> {
  bool isMediaUploading1 = false;
  String uploadedFileUrl1 = '';

  PageController? pageViewController;
  String? ddTipoDocumentoValue;
  TextEditingController? tfCPFController;
  final tfCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  TextEditingController? tfCNPJController;
  final tfCNPJMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  TextEditingController? tfCNHController;
  TextEditingController? tfRGController;
  bool isMediaUploading2 = false;
  String uploadedFileUrl2 = '';

  String uploadedSignatureUrl = '';
  late SignatureController signatureController;

  @override
  void initState() {
    super.initState();
    signatureController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
    tfCNHController = TextEditingController();
    tfCNPJController = TextEditingController();
    tfCPFController = TextEditingController();
    tfRGController = TextEditingController();
  }

  @override
  void dispose() {
    signatureController.dispose();
    tfCNHController?.dispose();
    tfCNPJController?.dispose();
    tfCPFController?.dispose();
    tfRGController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsuariosRecord>(
      stream: UsuariosRecord.getDocument(widget.idrefusuario!),
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
        final containerUsuariosRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 500,
            child: PageView(
              controller: pageViewController ??= PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '4lreadie' /* Tipo de documento */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://picsum.photos/seed/293/600',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            if (ddTipoDocumentoValue == 'CPF')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 15, 20, 15),
                                child: FlutterFlowDropDown<String>(
                                  initialOption: ddTipoDocumentoValue ??=
                                      FFLocalizations.of(context).getText(
                                    'ct8ifeem' /* CPF */,
                                  ),
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      'qkzckwlk' /* CPF */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '1wb0d328' /* CNPJ */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'cci7lrzj' /* CNH */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '95otut6t' /* RG */,
                                    )
                                  ],
                                  onChanged: (val) => setState(
                                      () => ddTipoDocumentoValue = val),
                                  width: double.infinity,
                                  height: 50,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '0mj5iqbz' /* Documento... */,
                                  ),
                                  fillColor: Colors.white,
                                  elevation: 2,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  borderWidth: 2,
                                  borderRadius: 15,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  hidesUnderline: true,
                                ),
                              ),
                            if (ddTipoDocumentoValue == 'CPF')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: TextFormField(
                                  controller: tfCPFController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'gv8xd2hw' /* N° DOCUMENTO */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '9ojig0r4' /* 000.000.000-00 */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [tfCPFMask],
                                ),
                              ),
                            if (ddTipoDocumentoValue == 'CNPJ')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: TextFormField(
                                  controller: tfCNPJController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '1u1ipj3t' /* N° DOCUMENTO */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'tmmgab4g' /* 00.000.000/0000-00 */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [tfCNPJMask],
                                ),
                              ),
                            if (ddTipoDocumentoValue == 'CNH')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: TextFormField(
                                  controller: tfCNHController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '24lcaxrk' /* N° DO REGISTRO */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            if (ddTipoDocumentoValue == 'RG')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: TextFormField(
                                  controller: tfRGController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'khz90v3e' /* N° DOCUMENTO */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15, 15, 15, 15),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'g101c0k2' /* Digite o documento corretament... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              if (ddTipoDocumentoValue != null &&
                                  ddTipoDocumentoValue != '') {
                                if (ddTipoDocumentoValue == 'CPF') {
                                  FFAppState().update(() {
                                    FFAppState().authDocNumeroDocumento =
                                        tfCPFController!.text;
                                  });
                                } else {
                                  if (ddTipoDocumentoValue == 'CNPJ') {
                                    FFAppState().update(() {
                                      FFAppState().authDocNumeroDocumento =
                                          tfCNPJController!.text;
                                    });
                                  } else {
                                    if (ddTipoDocumentoValue == 'CNH') {
                                      FFAppState().update(() {
                                        FFAppState().authDocNumeroDocumento =
                                            tfCNHController!.text;
                                      });
                                    } else {
                                      if (ddTipoDocumentoValue == 'RG') {
                                        FFAppState().update(() {
                                          FFAppState().authDocNumeroDocumento =
                                              tfRGController!.text;
                                        });
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Ops!'),
                                              content: Text(
                                                  'Selecione um tipo de documento!'),
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
                                        return;
                                      }
                                    }
                                  }
                                }

                                if (FFAppState().authDocNumeroDocumento !=
                                        null &&
                                    FFAppState().authDocNumeroDocumento != '') {
                                  await pageViewController?.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Ops!'),
                                        content: Text(
                                            'Informe o número do documento!'),
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
                                  return;
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Ops!'),
                                      content: Text(
                                          'Selecione o tipo de documento!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return;
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'tww7t2dp' /* Continuar */,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'vw63bds6' /* Imagem da frente */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (uploadedFileUrl1 == null ||
                                uploadedFileUrl1 == '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Image.asset(
                                  'assets/images/frente_doc.png',
                                  width: double.infinity,
                                  height: 210,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            if (uploadedFileUrl1 != null &&
                                uploadedFileUrl1 != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Image.network(
                                  uploadedFileUrl1,
                                  width: double.infinity,
                                  height: 210,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15, 15, 15, 15),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'x6tzixnu' /* Confira se a imagem esta visiv... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              final selectedMedia = await selectMedia(
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => isMediaUploading1 = true);
                                var downloadUrls = <String>[];
                                try {
                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  isMediaUploading1 = false;
                                }
                                if (downloadUrls.length ==
                                    selectedMedia.length) {
                                  setState(() =>
                                      uploadedFileUrl1 = downloadUrls.first);
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'sw6bakn3' /* Tirar foto */,
                            ),
                            icon: Icon(
                              Icons.photo_camera,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 40,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          if (uploadedFileUrl1 != null &&
                              uploadedFileUrl1 != '')
                            FFButtonWidget(
                              onPressed: () async {
                                await pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'mnuxr6o6' /* Continuar */,
                              ),
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          's96tko6l' /* Imagem do verso */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (uploadedFileUrl2 == null ||
                                uploadedFileUrl2 == '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Image.asset(
                                  'assets/images/verso_doc.png',
                                  width: double.infinity,
                                  height: 210,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            if (uploadedFileUrl2 != null &&
                                uploadedFileUrl2 != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Image.network(
                                  uploadedFileUrl2,
                                  width: double.infinity,
                                  height: 210,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15, 15, 15, 15),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'fjwn93w5' /* Confira se a imagem esta visiv... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              final selectedMedia = await selectMedia(
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => isMediaUploading2 = true);
                                var downloadUrls = <String>[];
                                try {
                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  isMediaUploading2 = false;
                                }
                                if (downloadUrls.length ==
                                    selectedMedia.length) {
                                  setState(() =>
                                      uploadedFileUrl2 = downloadUrls.first);
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'kb3zy1sc' /* Tirar foto */,
                            ),
                            icon: Icon(
                              Icons.photo_camera,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 40,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          if (uploadedFileUrl2 != null &&
                              uploadedFileUrl2 != '')
                            FFButtonWidget(
                              onPressed: () async {
                                await pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '3xhf4b0y' /* Continuar */,
                              ),
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'qgwjdp4j' /* Assinatura digital */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: ClipRect(
                                child: Signature(
                                  controller: signatureController,
                                  backgroundColor: Color(0xFFDDDDDD),
                                  height: 350,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15, 15, 15, 15),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'bbt1bads' /* Escreva sua assinatura digital... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              if (uploadedSignatureUrl != null &&
                                  uploadedSignatureUrl != '') {
                                final signatureImage =
                                    await signatureController.toPngBytes();

                                if (signatureImage == null) {
                                  return;
                                }

                                showUploadMessage(
                                  context,
                                  'Uploading signature...',
                                  showLoading: true,
                                );
                                final downloadUrl = (await uploadData(
                                    getSignatureStoragePath(), signatureImage));

                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                if (downloadUrl != null) {
                                  setState(
                                      () => uploadedSignatureUrl = downloadUrl);
                                  showUploadMessage(
                                    context,
                                    'Success!',
                                  );
                                } else {
                                  showUploadMessage(
                                    context,
                                    'Failed to upload signature',
                                  );
                                  return;
                                }

                                final documentoCreateData =
                                    createDocumentoRecordData(
                                  documentoFrente: uploadedFileUrl1,
                                  documentoVerso: uploadedFileUrl2,
                                  assinatura: uploadedSignatureUrl,
                                  dataSolicitacao: getCurrentTimestamp,
                                );
                                await DocumentoRecord.createDoc(
                                        widget.idrefusuario!)
                                    .set(documentoCreateData);
                                if (containerUsuariosRecord.aprovado != 1) {
                                  final usuariosUpdateData =
                                      createUsuariosRecordData(
                                    aprovado: 2,
                                    aprovadoDataSolicitacao:
                                        getCurrentTimestamp,
                                  );
                                  await widget.idrefusuario!
                                      .update(usuariosUpdateData);
                                } else {
                                  final usuariosUpdateData =
                                      createUsuariosRecordData(
                                    aprovadoDataSolicitacao:
                                        getCurrentTimestamp,
                                  );
                                  await widget.idrefusuario!
                                      .update(usuariosUpdateData);
                                }

                                Navigator.pop(context);
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Ops!'),
                                      content: Text(
                                          'Assine no quadro acima para continuar!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'qyvw3xxi' /* Enviar documentos */,
                            ),
                            options: FFButtonOptions(
                              width: 220,
                              height: 40,
                              color: Color(0xFF4AD239),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
