import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_component_widget.dart' show LoginComponentWidget;
import 'package:flutter/material.dart';

class LoginComponentModel extends FlutterFlowModel<LoginComponentWidget> {
  ///  Local state fields for this component.

  int? selectSectorID;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for SignUpFullName widget.
  FocusNode? signUpFullNameFocusNode;
  TextEditingController? signUpFullNameController;
  String? Function(BuildContext, String?)? signUpFullNameControllerValidator;
  // State field(s) for SignUpTelegramNumber widget.
  FocusNode? signUpTelegramNumberFocusNode;
  TextEditingController? signUpTelegramNumberController;
  String? Function(BuildContext, String?)?
      signUpTelegramNumberControllerValidator;
  // State field(s) for SignUpPassword widget.
  FocusNode? signUpPasswordFocusNode;
  TextEditingController? signUpPasswordController;
  late bool signUpPasswordVisibility;
  String? Function(BuildContext, String?)? signUpPasswordControllerValidator;
  // Stores action output result for [Backend Call - API (Check phone number)] action in Button widget.
  ApiCallResponse? apiResultwsd;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createdUser;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loginPasswordVisibility = false;
    signUpPasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    loginPhoneNumberFocusNode?.dispose();
    loginPhoneNumberController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordController?.dispose();

    signUpFullNameFocusNode?.dispose();
    signUpFullNameController?.dispose();

    signUpTelegramNumberFocusNode?.dispose();
    signUpTelegramNumberController?.dispose();

    signUpPasswordFocusNode?.dispose();
    signUpPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
