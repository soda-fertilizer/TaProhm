import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'change_language_model.dart';
export 'change_language_model.dart';

class ChangeLanguageWidget extends StatefulWidget {
  const ChangeLanguageWidget({super.key});

  @override
  _ChangeLanguageWidgetState createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
  late ChangeLanguageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeLanguageModel());
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
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'bc2ttg0d' /* Select Language */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 16.0,
                  ),
            ),
            FlutterFlowLanguageSelector(
              width: 200.0,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              borderColor: Colors.transparent,
              dropdownIconColor: Colors.white,
              borderRadius: 8.0,
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 13.0,
              ),
              hideFlags: true,
              flagSize: 24.0,
              flagTextGap: 8.0,
              currentLanguage: FFLocalizations.of(context).languageCode,
              languages: FFLocalizations.languages(),
              onChanged: (lang) => setAppLanguage(context, lang),
            ),
          ].divide(const SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
