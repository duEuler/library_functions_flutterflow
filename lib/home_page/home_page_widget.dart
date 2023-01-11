import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'n78fvxc1' /* Usuários da Biblioteca Global */,
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
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: FlutterFlowTheme.of(context).primaryColor,
                  labelStyle: FlutterFlowTheme.of(context).bodyText1,
                  indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                  tabs: [
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        '6ejh87ap' /* Regras */,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'q8vghs1p' /* Membros */,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'guaqveqx' /* Aulas */,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/GlobalLibraryUser-Logo.png',
                                  ).image,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 15, 10, 15),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gqd5a2sj' /* Bem vindo ao Projeto Global de... */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'r3lky1b3' /* by duEuler.com */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 0, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 120,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/euler.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '0mv3bhiu' /* Euler Magalhães Junior */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1,
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'iki0o5lk' /* Bambuí, Minas Gerais, Brasil */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '0nkqopvc' /* WhatsApp: */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      await launchUrl(Uri(
                                                        scheme: 'tel',
                                                        path: '37991007768',
                                                      ));
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3fyq6kyk' /* (37)9 9100-7768 */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF116400),
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'kbl9rzlg' /* WebSite: */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      await launchURL(
                                                          'https://dueuler.com');
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'kghpv65t' /*  www.dueuler.com */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed('dueuler_start');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'krley4vo' /* Abrir */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 130,
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
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'zagtt7iz' /* Duplique o painel acima e colo... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'k3ivigrq' /* professor */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '5m0yhsyu' /* Euler Magalhães Junior */,
                                  ),
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await launchURL(
                                    'https://www.youtube.com/watch?v=KgMhwFehSD8&t=630s');
                              },
                              text: FFLocalizations.of(context).getText(
                                '1qr5g0ys' /* Introdução FlutterFlow */,
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.youtube,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40,
                                color: Color(0xFFE30003),
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
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await launchURL(
                                    'https://www.youtube.com/watch?v=KgMhwFehSD8&t=630s');
                              },
                              text: FFLocalizations.of(context).getText(
                                'm8v2twk5' /* Firebase (Configuração) */,
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.youtube,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40,
                                color: Color(0xFFE30003),
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
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await launchURL(
                                    'https://www.youtube.com/watch?v=Y2pN4psYkHA&t=64s');
                              },
                              text: FFLocalizations.of(context).getText(
                                'an9j7625' /* Versões e Rastaurações */,
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.youtube,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40,
                                color: Color(0xFFE30003),
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
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('dueuler_firestore');
                              },
                              text: FFLocalizations.of(context).getText(
                                'lenqpoov' /* Firestore */,
                              ),
                              icon: Icon(
                                Icons.video_settings_outlined,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
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
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('dueuler_tabelalocal');
                              },
                              text: FFLocalizations.of(context).getText(
                                'm7pwb9t5' /* Tabela local */,
                              ),
                              icon: Icon(
                                Icons.video_settings,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
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
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 50, 15, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '45g7slgn' /* Sempre que adicionar exemplos ... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
