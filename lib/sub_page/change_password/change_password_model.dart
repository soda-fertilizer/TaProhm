import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  Local state fields for this page.

  bool isOldPasswordNotCorrect = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for OldPassword widget.
  FocusNode? oldPasswordFocusNode;
  TextEditingController? oldPasswordController;
  String? Function(BuildContext, String?)? oldPasswordControllerValidator;
  // Stores action output result for [Custom Action - passwordHash] action in OldPassword widget.
  String? hashedPassword;
  // State field(s) for NewPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordControllerValidator;
  // Stores action output result for [Custom Action - passwordHash] action in Button widget.
  String? passHash;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    newPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    oldPasswordFocusNode?.dispose();
    oldPasswordController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
