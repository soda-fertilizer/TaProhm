import '/component/login_only/login_only_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  Local state fields for this page.

  int? sectorID;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for LoginOnly component.
  late LoginOnlyModel loginOnlyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loginOnlyModel = createModel(context, () => LoginOnlyModel());
  }

  void dispose() {
    unfocusNode.dispose();
    loginOnlyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
