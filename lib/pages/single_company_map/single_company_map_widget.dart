import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/component/nav_bar/nav_bar_widget.dart';
import '/component/nav_padding/nav_padding_widget.dart';
import '/component/show_shop/show_shop_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'single_company_map_model.dart';
export 'single_company_map_model.dart';

class SingleCompanyMapWidget extends StatefulWidget {
  const SingleCompanyMapWidget({
    super.key,
    required this.companyID,
    required this.companyLatitude,
    required this.companyLongitude,
  });

  final int? companyID;
  final double? companyLatitude;
  final double? companyLongitude;

  @override
  State<SingleCompanyMapWidget> createState() => _SingleCompanyMapWidgetState();
}

class _SingleCompanyMapWidgetState extends State<SingleCompanyMapWidget> {
  late SingleCompanyMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleCompanyMapModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(locationPermission);
      _model.addToLocationList(CustomMapLocationStruct(
        id: widget.companyID,
        latitude: widget.companyLatitude,
        longitude: widget.companyLongitude,
      ));
      safeSetState(() {});
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
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
        List<CompaniesRow> singleCompanyMapCompaniesRowList = snapshot.data!;

        return Title(
            title: 'SingleCompanyMap',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: custom_widgets.CustomMap(
                                  width: double.infinity,
                                  height: double.infinity,
                                  center: functions.returnLatLng(
                                      widget.companyLatitude,
                                      widget.companyLongitude),
                                  cuLocation: singleCompanyMapCompaniesRowList,
                                  userCurrentLocation:
                                      currentUserLocationValue!,
                                  showShop: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SizedBox(
                                              height: 200.0,
                                              child: ShowShopWidget(
                                                locationPara:
                                                    FFAppState().shopHolder,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.navPaddingModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const NavPaddingWidget(),
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
                            selectPageIndex: 2,
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
