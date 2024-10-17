import '/backend/supabase/supabase.dart';
import '/component/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'my_company_model.dart';
export 'my_company_model.dart';

class MyCompanyWidget extends StatefulWidget {
  const MyCompanyWidget({super.key});

  @override
  State<MyCompanyWidget> createState() => _MyCompanyWidgetState();
}

class _MyCompanyWidgetState extends State<MyCompanyWidget>
    with TickerProviderStateMixin {
  late MyCompanyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyCompanyModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
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

    return FutureBuilder<List<CompaniesRow>>(
      future: CompaniesTable().queryRows(
        queryFn: (q) => q.eq(
          'UserID',
          FFAppState().UserInfo.userID,
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
        List<CompaniesRow> myCompanyCompaniesRowList = snapshot.data!;

        return Title(
            title: 'MyCompany',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                floatingActionButton: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                  child: FloatingActionButton(
                    onPressed: () async {
                      context.pushNamed(
                        'CreateCompany',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    elevation: 8.0,
                    child: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                  ),
                ),
                appBar: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  title: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      'My Company',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  actions: const [],
                  centerTitle: false,
                  elevation: 2.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: const TextStyle(),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              padding: const EdgeInsets.all(4.0),
                              tabs: const [
                                Tab(
                                  text: 'Companies',
                                ),
                                Tab(
                                  text: 'Pending',
                                ),
                                Tab(
                                  text: 'Rating',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                Builder(
                                  builder: (context) {
                                    final myCompanyVar =
                                        myCompanyCompaniesRowList
                                            .where((e) => e.isApprove == true)
                                            .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: myCompanyVar.length,
                                      itemBuilder:
                                          (context, myCompanyVarIndex) {
                                        final myCompanyVarItem =
                                            myCompanyVar[myCompanyVarIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 1.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'EditCompany',
                                                queryParameters: {
                                                  'companyID': serializeParam(
                                                    myCompanyVarItem.companyID,
                                                    ParamType.int,
                                                  ),
                                                  'name': serializeParam(
                                                    myCompanyVarItem
                                                        .companyName,
                                                    ParamType.String,
                                                  ),
                                                  'phoneNumber': serializeParam(
                                                    myCompanyVarItem
                                                        .phoneNumber,
                                                    ParamType.String,
                                                  ),
                                                  'link': serializeParam(
                                                    myCompanyVarItem
                                                        .telegramUrl,
                                                    ParamType.String,
                                                  ),
                                                  'discount': serializeParam(
                                                    myCompanyVarItem.discount,
                                                    ParamType.double,
                                                  ),
                                                  'haveDocument':
                                                      serializeParam(
                                                    myCompanyVarItem.isVertify,
                                                    ParamType.bool,
                                                  ),
                                                  'location': serializeParam(
                                                    functions.returnLatLng(
                                                        myCompanyVarItem
                                                            .latitude,
                                                        myCompanyVarItem
                                                            .longitude),
                                                    ParamType.LatLng,
                                                  ),
                                                  'images': serializeParam(
                                                    myCompanyVarItem
                                                        .companyImages,
                                                    ParamType.String,
                                                    isList: true,
                                                  ),
                                                  'profile': serializeParam(
                                                    myCompanyVarItem
                                                        .companyProfile,
                                                    ParamType.String,
                                                  ),
                                                  'detail': serializeParam(
                                                    myCompanyVarItem.detail,
                                                    ParamType.String,
                                                  ),
                                                  'userID': serializeParam(
                                                    myCompanyVarItem.userID,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 72.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 0.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    offset: const Offset(
                                                      0.0,
                                                      1.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(2.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(44.0),
                                                        child: OctoImage(
                                                          placeholderBuilder:
                                                              (_) => const SizedBox
                                                                  .expand(
                                                            child: Image(
                                                              image: BlurHashImage(
                                                                  FFAppConstants
                                                                      .BlurHash),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          image: NetworkImage(
                                                            myCompanyVarItem
                                                                .companyProfile,
                                                          ),
                                                          width: 44.0,
                                                          height: 44.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
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
                                                                myCompanyVarItem
                                                                    .companyName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                Builder(
                                  builder: (context) {
                                    final myCompanyPending =
                                        myCompanyCompaniesRowList
                                            .where((e) => e.isApprove == false)
                                            .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: myCompanyPending.length,
                                      itemBuilder:
                                          (context, myCompanyPendingIndex) {
                                        final myCompanyPendingItem =
                                            myCompanyPending[
                                                myCompanyPendingIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 1.0),
                                          child: Container(
                                            width: 100.0,
                                            height: 72.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  offset: const Offset(
                                                    0.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 44.0,
                                                    height: 44.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(2.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(44.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              myCompanyPendingItem
                                                                  .companyProfile,
                                                          width: 44.0,
                                                          height: 44.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
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
                                                              myCompanyPendingItem
                                                                  .companyName,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Builder(
                                  builder: (context) {
                                    final myCompanyVar =
                                        myCompanyCompaniesRowList
                                            .where((e) => e.isApprove == true)
                                            .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: myCompanyVar.length,
                                      itemBuilder:
                                          (context, myCompanyVarIndex) {
                                        final myCompanyVarItem =
                                            myCompanyVar[myCompanyVarIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 1.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'ReviewList',
                                                queryParameters: {
                                                  'company': serializeParam(
                                                    myCompanyVarItem,
                                                    ParamType.SupabaseRow,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 72.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 0.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    offset: const Offset(
                                                      0.0,
                                                      1.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(2.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(44.0),
                                                        child: OctoImage(
                                                          placeholderBuilder:
                                                              (_) => const SizedBox
                                                                  .expand(
                                                            child: Image(
                                                              image: BlurHashImage(
                                                                  FFAppConstants
                                                                      .BlurHash),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          image: NetworkImage(
                                                            myCompanyVarItem
                                                                .companyProfile,
                                                          ),
                                                          width: 44.0,
                                                          height: 44.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
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
                                                                myCompanyVarItem
                                                                    .companyName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavBarWidget(
                            selectPageIndex: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
