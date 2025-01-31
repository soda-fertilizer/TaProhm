import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'update_alert_model.dart';
export 'update_alert_model.dart';

class UpdateAlertWidget extends StatefulWidget {
  const UpdateAlertWidget({super.key});

  @override
  State<UpdateAlertWidget> createState() => _UpdateAlertWidgetState();
}

class _UpdateAlertWidgetState extends State<UpdateAlertWidget> {
  late UpdateAlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateAlertModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Icon(
                Icons.update,
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
            Text(
              'Update',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Text(
                '    We would like to inform you that a new version of our app is available for download. To enjoy the latest benefits of our app, please update it as soon as possible. ',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {},
                    child: Text(
                      'LATER',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (isAndroid) {
                        await launchURL(
                            'https://play.google.com/store/apps/details?id=com.soda.taprohm');
                      } else {
                        await launchURL(
                            'https://play.google.com/store/apps/details?id=com.soda.taprohm');
                      }
                    },
                    child: Text(
                      'UPDATE NOW',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ].divide(const SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
