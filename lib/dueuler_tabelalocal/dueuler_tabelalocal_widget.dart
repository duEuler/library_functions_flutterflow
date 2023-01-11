import '../components/dueuler_edit_usuario_local_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DueulerTabelalocalWidget extends StatefulWidget {
  const DueulerTabelalocalWidget({Key? key}) : super(key: key);

  @override
  _DueulerTabelalocalWidgetState createState() =>
      _DueulerTabelalocalWidgetState();
}

class _DueulerTabelalocalWidgetState extends State<DueulerTabelalocalWidget> {
  TextEditingController? tfNomeUsuarioController;
  int? newUserId;
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
            'svq7vecf' /*  Tabela local */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          Container(
            height: 100,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await launchURL(
                        'https://www.youtube.com/watch?v=lyox6dd6n18');
                  },
                  text: FFLocalizations.of(context).getText(
                    'xlbqgy75' /*  */,
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
                    context.pushNamed('dueuler_firestore');
                  },
                  text: FFLocalizations.of(context).getText(
                    'hnws3md7' /* FIREBASE */,
                  ),
                  options: FFButtonOptions(
                    width: 110,
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
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ],
            ),
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
                              'f43df9sl' /* Digite nome do usuário */,
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
                          newUserId = await actions.dueulerTableInert(
                            tfNomeUsuarioController!.text,
                          );
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title:
                                    Text('Parabéns!${newUserId?.toString()}'),
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

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'pjiw9qnl' /* ADD */,
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
                Builder(
                  builder: (context) {
                    final listaLocalUser = FFAppState().tableUser.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listaLocalUser.length,
                      itemBuilder: (context, listaLocalUserIndex) {
                        final listaLocalUserItem =
                            listaLocalUser[listaLocalUserIndex];
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
                                        await actions.dueulerTableDelete(
                                          getJsonField(
                                            listaLocalUserItem,
                                            r'''$.id''',
                                          ),
                                        );
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
                                              child:
                                                  DueulerEditUsuarioLocalWidget(
                                                idusuario: getJsonField(
                                                  listaLocalUserItem,
                                                  r'''$.id''',
                                                ),
                                                username: getJsonField(
                                                  listaLocalUserItem,
                                                  r'''$.username''',
                                                ).toString(),
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
                                        getJsonField(
                                          listaLocalUserItem,
                                          r'''$.username''',
                                        ).toString(),
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
