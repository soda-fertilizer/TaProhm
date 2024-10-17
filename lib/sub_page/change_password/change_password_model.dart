import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  Local state fields for this page.

  bool isOldPasswordNotCorrect = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for OldPassword widget.
  FocusNode? oldPasswordFocusNode;
  TextEditingController? oldPasswordTextController;
  String? Function(BuildContext, String?)? oldPasswordTextControllerValidator;
  // Stores action output result for [Custom Action - passwordHash] action in OldPassword widget.
  String? hashedPassword;
  // State field(s) for NewPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // Stores action output result for [Custom Action - passwordHash] action in Button widget.
  String? hashed;

  @override
  void initState(BuildContext context) {
    newPasswordVisibility = false;
  }

  @override
  void dispose() {
    oldPasswordFocusNode?.dispose();
    oldPasswordTextController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();
  }
}
