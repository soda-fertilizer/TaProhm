import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'update_alert_model.dart';
export 'update_alert_model.dart';

class UpdateAlertWidget extends StatefulWidget {
  const UpdateAlertWidget({super.key});

  @override
  _UpdateAlertWidgetState createState() => _UpdateAlertWidgetState();
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
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
      ),
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
            FFLocalizations.of(context).getText(
              'cd50pemm' /* Update */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                't3u3rksv' /*     We would like to inform yo... */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
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
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'irdmhhi0' /* LATER */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
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

                    Navigator.pop(context);
                  },
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'gvey98wv' /* UPDATE NOW */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ].divide(const SizedBox(height: 20.0)),
      ),
    );
  }
}
