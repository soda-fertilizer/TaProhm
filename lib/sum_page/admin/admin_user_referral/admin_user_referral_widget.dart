import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_user_referral_model.dart';
export 'admin_user_referral_model.dart';

class AdminUserReferralWidget extends StatefulWidget {
  const AdminUserReferralWidget({
    Key? key,
    required this.sectorsID,
  }) : super(key: key);

  final int? sectorsID;

  @override
  _AdminUserReferralWidgetState createState() =>
      _AdminUserReferralWidgetState();
}

class _AdminUserReferralWidgetState extends State<AdminUserReferralWidget>
    with TickerProviderStateMixin {
  late AdminUserReferralModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminUserReferralModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().queryRows(
        queryFn: (q) => q
            .eq(
              'SectorID',
              widget.sectorsID,
            )
            .eq(
              'IsApprove',
              true,
            )
            .eq(
              'IsSectorHead',
              true,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRow> adminUserReferralUsersRowList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
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
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  'User Referral',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 14.0,
                              ),
                      unselectedLabelStyle: TextStyle(),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      padding: EdgeInsets.all(4.0),
                      tabs: [
                        Tab(
                          text: 'List view',
                        ),
                        Tab(
                          text: 'Tree view',
                        ),
                      ],
                      controller: _model.tabBarController,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final adminUserReferralVar =
                                  adminUserReferralUsersRowList.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: adminUserReferralVar.length,
                                itemBuilder:
                                    (context, adminUserReferralVarIndex) {
                                  final adminUserReferralVarItem =
                                      adminUserReferralVar[
                                          adminUserReferralVarIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'AdminReferralSubPage',
                                          queryParameters: {
                                            'user': serializeParam(
                                              adminUserReferralVarItem,
                                              ParamType.SupabaseRow,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
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
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          44.0),
                                                  child: Image.network(
                                                    adminUserReferralVarItem
                                                        .profile,
                                                    width: 44.0,
                                                    height: 44.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
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
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Text(
                                                              adminUserReferralVarItem
                                                                  .fullName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (false)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .verified_sharp,
                                                                color: Color(
                                                                    0xFF1C81E0),
                                                                size: 15.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Text(
                                                        'ID: ${adminUserReferralVarItem.phoneNumber}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 10.0,
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
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Visibility(
                          visible: adminUserReferralUsersRowList.length != 0,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.GraphTree(
                              width: double.infinity,
                              height: double.infinity,
                              listOfUsers: adminUserReferralUsersRowList,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
