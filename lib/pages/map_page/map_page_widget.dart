import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/component/login_component/login_component_widget.dart';
import '/component/login_only/login_only_widget.dart';
import '/component/nav_bar/nav_bar_widget.dart';
import '/component/nav_padding/nav_padding_widget.dart';
import '/component/show_shop/show_shop_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_page_model.dart';
export 'map_page_model.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({
    Key? key,
    this.moveLocation,
    bool? clickCompany,
  })  : this.clickCompany = clickCompany ?? false,
        super(key: key);

  final LatLng? moveLocation;
  final bool clickCompany;

  @override
  _MapPageWidgetState createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late MapPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(locationPermission);
      if (widget.clickCompany) {
        if (FFAppState().IsLogged) {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: Container(
                    height: 220.0,
                    child: ShowShopWidget(
                      locationPara: FFAppState().shopHolder,
                    ),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        } else {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    child: LoginOnlyWidget(),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
      }
      _model.apiResult8il = await CompanyGroup.companyLocationCall.call();
      if ((_model.apiResult8il?.succeeded ?? true)) {
        while (_model.locationLoop <
            CompanyGroup.companyLocationCall
                .companyID(
                  (_model.apiResult8il?.jsonBody ?? ''),
                )!
                .length) {
          setState(() {
            _model.addToLocationList(CustomMapLocationStruct(
              id: CompanyGroup.companyLocationCall.companyID(
                (_model.apiResult8il?.jsonBody ?? ''),
              )?[_model.locationLoop],
              latitude: CompanyGroup.companyLocationCall.latitude(
                (_model.apiResult8il?.jsonBody ?? ''),
              )?[_model.locationLoop],
              longitude: CompanyGroup.companyLocationCall.longitude(
                (_model.apiResult8il?.jsonBody ?? ''),
              )?[_model.locationLoop],
            ));
            _model.locationLoop = _model.locationLoop + 1;
          });
        }
      } else {
        await action_blocks.noInternet(context);
        return;
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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

    return FutureBuilder<List<CompaniesRow>>(
      future: FFAppState().company(
        requestFn: () => CompaniesTable().queryRows(
          queryFn: (q) => q
              .eq(
                'IsApprove',
                true,
              )
              .eq(
                'IsActive',
                true,
              )
              .order('CompanyID'),
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
        List<CompaniesRow> mapPageCompaniesRowList = snapshot.data!;
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
              title: Text(
                'Locator',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.CustomMap(
                              width: double.infinity,
                              height: double.infinity,
                              center: widget.moveLocation == null
                                  ? currentUserLocationValue
                                  : widget.moveLocation,
                              cuLocation: mapPageCompaniesRowList,
                              userCurrentLocation: currentUserLocationValue!,
                              showShop: () async {
                                if (FFAppState().IsLogged) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: 220.0,
                                            child: ShowShopWidget(
                                              locationPara:
                                                  FFAppState().shopHolder,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  return;
                                } else {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.7,
                                            child: LoginComponentWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  return;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navPaddingModel,
                          updateCallback: () => setState(() {}),
                          child: NavPaddingWidget(),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => setState(() {}),
                      child: NavBarWidget(
                        selectPageIndex: 2,
                      ),
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
