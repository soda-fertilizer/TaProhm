import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/component/image_gallery/image_gallery_widget.dart';
import '/component/nav_bar/nav_bar_widget.dart';
import '/component/nav_padding/nav_padding_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {}(),
      );
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ta Prohm',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 22.0,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (FFAppState().UserInfo.isMember)
                                Icon(
                                  Icons.notifications_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 30.0,
                                ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'SearchCompany',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.travel_explore,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 28.0,
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: FutureBuilder<List<CompaniesRow>>(
                        future: FFAppState()
                            .company(
                          requestFn: () => CompaniesTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'IsApprove',
                                  true,
                                )
                                .eq(
                                  'IsActive',
                                  true,
                                ),
                          ),
                        )
                            .then((result) {
                          _model.requestCompleted = true;
                          return result;
                        }),
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
                          List<CompaniesRow> tabBarCompaniesRowList =
                              snapshot.data!;
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                      ),
                                  unselectedLabelStyle: TextStyle(),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 4.0, 0.0),
                                  tabs: [
                                    Tab(
                                      text: 'By Grid',
                                    ),
                                    Tab(
                                      text: 'By List',
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD0D1D1),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final homePageVar = tabBarCompaniesRowList
                                              .sortedList((e) =>
                                                  functions.areSimilarLocation(
                                                      e.latitude,
                                                      functions
                                                          .splitLatLng(
                                                              currentUserLocationValue)
                                                          ?.first,
                                                      e.longitude,
                                                      functions
                                                          .splitLatLng(
                                                              currentUserLocationValue)
                                                          ?.last)!)
                                              .toList();
                                          return RefreshIndicator(
                                            onRefresh: () async {
                                              FFAppState().clearCompanyCache();
                                              setState(() {
                                                FFAppState()
                                                    .clearCompanyCache();
                                                _model.requestCompleted = false;
                                              });
                                              await _model
                                                  .waitForRequestCompleted();
                                            },
                                            child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount: homePageVar.length,
                                              itemBuilder:
                                                  (context, homePageVarIndex) {
                                                final homePageVarItem =
                                                    homePageVar[
                                                        homePageVarIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setState(() {
                                                                  FFAppState()
                                                                      .updateShopHolderStruct(
                                                                    (e) => e
                                                                      ..id = homePageVarItem
                                                                          .companyID
                                                                      ..latitude =
                                                                          homePageVarItem
                                                                              .latitude
                                                                      ..longitude =
                                                                          homePageVarItem
                                                                              .longitude,
                                                                  );
                                                                });

                                                                context
                                                                    .pushNamed(
                                                                  'Locator',
                                                                  queryParameters:
                                                                      {
                                                                    'moveLocation':
                                                                        serializeParam(
                                                                      functions.returnLatLng(
                                                                          homePageVarItem
                                                                              .latitude,
                                                                          homePageVarItem
                                                                              .longitude),
                                                                      ParamType
                                                                          .LatLng,
                                                                    ),
                                                                    'clickCompany':
                                                                        serializeParam(
                                                                      true,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .fade,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              0),
                                                                    ),
                                                                  },
                                                                );
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              valueOrDefault<String>(
                                                                            homePageVarItem.companyProfile,
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-m-e-locator-vgu6pa/assets/u2axwx4lw1p4/1.png',
                                                                          ),
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            homePageVarItem.companyName.maybeHandleOverflow(
                                                                              maxChars: 30,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 14.0,
                                                                                ),
                                                                          ),
                                                                          if (false)
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.asset(
                                                                                'assets/images/verify.png',
                                                                                width: 50.0,
                                                                                height: 10.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 215.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final images =
                                                                      homePageVarItem
                                                                          .companyImages
                                                                          .toList();
                                                                  return SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          images
                                                                              .length,
                                                                          (imagesIndex) {
                                                                        final imagesItem =
                                                                            images[imagesIndex];
                                                                        return Stack(
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                              child: Container(
                                                                                width: 150.0,
                                                                                height: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                ),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Color(0x77000000),
                                                                                      useSafeArea: true,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: ImageGalleryWidget(
                                                                                              images: homePageVarItem.companyImages,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                      imageUrl: imagesItem,
                                                                                      width: 300.0,
                                                                                      height: 200.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (homePageVarItem.discount !=
                                                                                0.0)
                                                                              Container(
                                                                                width: 50.0,
                                                                                height: 20.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(8.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  '- ${homePageVarItem.discount.toString()}%',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        fontSize: 10.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        );
                                                                      }).divide(SizedBox(
                                                                          width:
                                                                              10.0)),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
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
                                    Builder(
                                      builder: (context) {
                                        final byList = tabBarCompaniesRowList
                                            .sortedList((e) =>
                                                functions.areSimilarLocation(
                                                    e.latitude,
                                                    functions
                                                        .splitLatLng(
                                                            currentUserLocationValue)
                                                        ?.first,
                                                    e.longitude,
                                                    functions
                                                        .splitLatLng(
                                                            currentUserLocationValue)
                                                        ?.last)!)
                                            .toList();
                                        return RefreshIndicator(
                                          onRefresh: () async {
                                            FFAppState().clearCompanyCache();
                                            setState(() {
                                              FFAppState().clearCompanyCache();
                                              _model.requestCompleted = false;
                                            });
                                            await _model
                                                .waitForRequestCompleted();
                                          },
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: byList.length,
                                            itemBuilder:
                                                (context, byListIndex) {
                                              final byListItem =
                                                  byList[byListIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 1.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'Locator',
                                                      queryParameters: {
                                                        'moveLocation':
                                                            serializeParam(
                                                          functions.returnLatLng(
                                                              byListItem
                                                                  .latitude,
                                                              byListItem
                                                                  .longitude),
                                                          ParamType.LatLng,
                                                        ),
                                                        'clickCompany':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 0.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          offset:
                                                              Offset(0.0, 1.0),
                                                        )
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              fadeOutDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              imageUrl: byListItem
                                                                  .companyProfile,
                                                              width: 44.0,
                                                              height: 44.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                    child: Text(
                                                                      byListItem
                                                                          .companyName,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
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
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navPaddingModel,
                    updateCallback: () => setState(() {}),
                    child: NavPaddingWidget(),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => setState(() {}),
                  child: NavBarWidget(
                    selectPageIndex: 1,
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
