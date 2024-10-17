import '/component/login_component/login_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  Local state fields for this page.

  int? sectorID;

  ///  State fields for stateful widgets in this page.

  // Model for LoginComponent component.
  late LoginComponentModel loginComponentModel;

  @override
  void initState(BuildContext context) {
    loginComponentModel = createModel(context, () => LoginComponentModel());
  }

  @override
  void dispose() {
    loginComponentModel.dispose();
  }
}
