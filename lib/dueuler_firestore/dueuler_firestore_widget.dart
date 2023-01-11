import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/dueuler_edit_usuario_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DueulerFirestoreWidget extends StatefulWidget {
  const DueulerFirestoreWidget({Key? key}) : super(key: key);

  @override
  _DueulerFirestoreWidgetState createState() => _DueulerFirestoreWidgetState();
}

class _DueulerFirestoreWidgetState extends State<DueulerFirestoreWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? tfNomeUsuarioController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    tfNomeUsuarioController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    tfNomeUsuarioController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
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
            Icons.arrow_back_outlined,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 30,
          ),
          onPressed: () async {
            context.pushNamed('dueuler_start');
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'q4lg28b2' /* FireStore */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  await launchURL(
                      'https://www.youtube.com/watch?v=6ehIjzpXCFs&t=91s');
                },
                text: FFLocalizations.of(context).getText(
                  '9fivx37j' /*  */,
                ),
                icon: FaIcon(
                  FontAwesomeIcons.youtube,
                ),
                options: FFButtonOptions(
                  height: 40,
                  color: Color(0xFFE30004),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(0),
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('dueuler_tabelalocal');
                },
                text: FFLocalizations.of(context).getText(
                  'zu24iux6' /* LOCAL */,
                ),
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(0),
                  ),
                ),
              ),
            ],
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: TextFormField(
                          controller: tfNomeUsuarioController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: FFLocalizations.of(context).getText(
                              'r6pnp6zd' /* Digite nome do usuário */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final usuariosCreateData = createUsuariosRecordData(
                            nome: tfNomeUsuarioController!.text,
                            statusAtivo: true,
                          );
                          await UsuariosRecord.collection
                              .doc()
                              .set(usuariosCreateData);
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Parabéns!'),
                                content: Text('Usuario adicionad com sucesso!'),
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
                        },
                        text: FFLocalizations.of(context).getText(
                          '3v3sml1y' /* ADD */,
                        ),
                        options: FFButtonOptions(
                          width: 80,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
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
                    ),
                  ],
                ),
                StreamBuilder<List<UsuariosRecord>>(
                  stream: queryUsuariosRecord(
                    queryBuilder: (usuariosRecord) => usuariosRecord
                        .where('status_ativo', isEqualTo: true)
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<UsuariosRecord> listViewUsuariosRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewUsuariosRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewUsuariosRecord =
                            listViewUsuariosRecordList[listViewIndex];
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
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.delete_forever_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Deseja remover?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Não'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('Remover'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await listViewUsuariosRecord.reference
                                            .delete();
                                      }
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.edit_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: 200,
                                              child: DueulerEditUsuarioWidget(
                                                idrefusuario:
                                                    listViewUsuariosRecord
                                                        .reference,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        listViewUsuariosRecord.nome!,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.photo_camera,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() => isMediaUploading = true);
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
                                          isMediaUploading = false;
                                        }
                                        if (downloadUrls.length ==
                                            selectedMedia.length) {
                                          setState(() => uploadedFileUrl =
                                              downloadUrls.first);
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      if (uploadedFileUrl != null &&
                                          uploadedFileUrl != '') {
                                        final galeriaCreateData = {
                                          ...createGaleriaRecordData(
                                            foto: uploadedFileUrl,
                                          ),
                                          'dataupload':
                                              FieldValue.serverTimestamp(),
                                        };
                                        await GaleriaRecord.createDoc(
                                                listViewUsuariosRecord
                                                    .reference)
                                            .set(galeriaCreateData);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Foto enviada...',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0xFF116400),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  Expanded(
                                    child: StreamBuilder<List<GaleriaRecord>>(
                                      stream: queryGaleriaRecord(
                                        parent:
                                            listViewUsuariosRecord.reference,
                                        queryBuilder: (galeriaRecord) =>
                                            galeriaRecord.orderBy('dataupload',
                                                descending: true),
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
                                        List<GaleriaRecord>
                                            rowGaleriaRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                rowGaleriaRecordList.length,
                                                (rowIndex) {
                                              final rowGaleriaRecord =
                                                  rowGaleriaRecordList[
                                                      rowIndex];
                                              return Image.network(
                                                rowGaleriaRecord.foto!,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Builder(
                                builder: (context) {
                                  final listaHabitos =
                                      listViewUsuariosRecord.habitos!.toList();
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(listaHabitos.length,
                                        (listaHabitosIndex) {
                                      final listaHabitosItem =
                                          listaHabitos[listaHabitosIndex];
                                      return Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.hail,
                                              color: Colors.black,
                                              size: 40,
                                            ),
                                            Text(
                                              listaHabitosItem.titulo!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Expanded(
                                              child: Text(
                                                listaHabitosItem.texto!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
