import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'invide_member_model.dart';
export 'invide_member_model.dart';

class InvideMemberWidget extends StatefulWidget {
  const InvideMemberWidget({super.key});

  @override
  State<InvideMemberWidget> createState() => _InvideMemberWidgetState();
}

class _InvideMemberWidgetState extends State<InvideMemberWidget>
    with TickerProviderStateMixin {
  late InvideMemberModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvideMemberModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'InvideMember',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  'Invide Member',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                children: [
                  Align(
                    alignment: const Alignment(0.0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                      unselectedLabelStyle: const TextStyle(),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      padding: const EdgeInsets.all(4.0),
                      tabs: const [
                        Tab(
                          text: 'My Invide',
                        ),
                        Tab(
                          text: 'My Member',
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 1.0, 0.0, 0.0),
                          child: FutureBuilder<List<UsersRow>>(
                            future: (_model.requestCompleter1 ??=
                                    Completer<List<UsersRow>>()
                                      ..complete(UsersTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'IsMember',
                                              false,
                                            )
                                            .eq(
                                              'IsActive',
                                              true,
                                            )
                                            .eq(
                                              'IsApprove',
                                              true,
                                            )
                                            .eq(
                                              'Invite',
                                              FFAppState().UserInfo.phoneNumber,
                                            )
                                            .neq(
                                              'UserReferral',
                                              FFAppState().UserInfo.phoneNumber,
                                            ),
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<UsersRow> listViewUsersRowList =
                                  snapshot.data!;

                              return RefreshIndicator(
                                onRefresh: () async {
                                  FFAppState().clearAdminRequestAccountCache();
                                  safeSetState(
                                      () => _model.requestCompleter1 = null);
                                  await _model.waitForRequestCompleted1();
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewUsersRowList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewUsersRow =
                                        listViewUsersRowList[listViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 72.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              offset: const Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          44.0),
                                                  child: Image.network(
                                                    listViewUsersRow.profile,
                                                    width: 44.0,
                                                    height: 44.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          listViewUsersRow
                                                              .fullName
                                                              .maybeHandleOverflow(
                                                            maxChars: 30,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'ID: ${listViewUsersRow.phoneNumber}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 1.0, 0.0, 0.0),
                          child: FutureBuilder<List<UsersRow>>(
                            future: (_model.requestCompleter2 ??=
                                    Completer<List<UsersRow>>()
                                      ..complete(UsersTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'IsMember',
                                              false,
                                            )
                                            .eq(
                                              'IsActive',
                                              true,
                                            )
                                            .eq(
                                              'IsApprove',
                                              true,
                                            )
                                            .eq(
                                              'UserReferral',
                                              FFAppState().UserInfo.phoneNumber,
                                            ),
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<UsersRow> listViewUsersRowList =
                                  snapshot.data!;

                              return RefreshIndicator(
                                onRefresh: () async {
                                  FFAppState().clearAdminRequestAccountCache();
                                  safeSetState(
                                      () => _model.requestCompleter2 = null);
                                  await _model.waitForRequestCompleted2();
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewUsersRowList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewUsersRow =
                                        listViewUsersRowList[listViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 72.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              offset: const Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          44.0),
                                                  child: Image.network(
                                                    listViewUsersRow.profile,
                                                    width: 44.0,
                                                    height: 44.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          listViewUsersRow
                                                              .fullName
                                                              .maybeHandleOverflow(
                                                            maxChars: 30,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'ID: ${listViewUsersRow.phoneNumber}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
          ),
        ));
  }
}
