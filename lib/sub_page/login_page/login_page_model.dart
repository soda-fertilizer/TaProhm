import '/component/login_only/login_only_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  Local state fields for this page.

  int? sectorID;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for LoginOnly component.
  late LoginOnlyModel loginOnlyModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loginOnlyModel = createModel(context, () => LoginOnlyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    loginOnlyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
