import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_padding_model.dart';
export 'nav_padding_model.dart';

class NavPaddingWidget extends StatefulWidget {
  const NavPaddingWidget({Key? key}) : super(key: key);

  @override
  _NavPaddingWidgetState createState() => _NavPaddingWidgetState();
}

class _NavPaddingWidgetState extends State<NavPaddingWidget> {
  late NavPaddingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavPaddingModel());
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
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(),
    );
  }
}
