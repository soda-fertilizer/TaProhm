import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_only_widget.dart' show LoginOnlyWidget;
import 'package:flutter/material.dart';

class LoginOnlyModel extends FlutterFlowModel<LoginOnlyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for LoginPhoneNumber widget.
  FocusNode? loginPhoneNumberFocusNode;
  TextEditingController? loginPhoneNumberController;
  String? Function(BuildContext, String?)? loginPhoneNumberControllerValidator;
  // State field(s) for LoginPassword widget.
  FocusNode? loginPasswordFocusNode;
  TextEditingController? loginPasswordController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordControllerValidator;
  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? login;
  // Stores action output result for [Custom Action - initFirebaseMessage] action in Button widget.
  String? fcmToken;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loginPasswordVisibility = false;
  }

  @override
  void dispose() {
    loginPhoneNumberFocusNode?.dispose();
    loginPhoneNumberController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
