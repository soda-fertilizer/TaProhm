import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_only_widget.dart' show LoginOnlyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginOnlyModel extends FlutterFlowModel<LoginOnlyWidget> {
  ///  Local state fields for this component.

  int? selectSectorID;

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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loginPasswordVisibility = false;
  }

  void dispose() {
    loginPhoneNumberFocusNode?.dispose();
    loginPhoneNumberController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
