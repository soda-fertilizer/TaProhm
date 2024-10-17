import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'pin_location_model.dart';
export 'pin_location_model.dart';

class PinLocationWidget extends StatefulWidget {
  const PinLocationWidget({super.key});

  @override
  State<PinLocationWidget> createState() => _PinLocationWidgetState();
}

class _PinLocationWidgetState extends State<PinLocationWidget> {
  late PinLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinLocationModel());

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

    return Title(
        title: 'PinLocation',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              FlutterFlowGoogleMap(
                                controller: _model.googleMapsController,
                                onCameraIdle: (latLng) =>
                                    _model.googleMapsCenter = latLng,
                                initialLocation: _model.googleMapsCenter ??=
                                    currentUserLocationValue!,
                                markerColor: GoogleMarkerColor.violet,
                                mapType: MapType.normal,
                                style: GoogleMapStyle.standard,
                                initialZoom: 14.0,
                                allowInteraction: true,
                                allowZoom: true,
                                showZoomControls: false,
                                showLocation: false,
                                showCompass: false,
                                showMapToolbar: false,
                                showTraffic: false,
                                centerMapOnMarkerTap: true,
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: PointerInterceptor(
                                  intercepting: isWeb,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/icons8-gps-48.png',
                                      width: 30.0,
                                      height: 30.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            FFAppState().updateCreateCompanyHolderStruct(
                              (e) => e..location = _model.googleMapsCenter,
                            );
                            FFAppState().update(() {});
                            context.safePop();
                          },
                          text: 'Save',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        Divider(
                          height: 3.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 10.0, 100.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.location_searching,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: const LatLng(0.0, 0.0));
                            await _model.googleMapsController.future.then(
                              (c) => c.animateCamera(
                                CameraUpdate.newLatLng(
                                    currentUserLocationValue!.toGoogleMaps()),
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
          ),
        ));
  }
}
