import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'admin_create_user_widget.dart' show AdminCreateUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminCreateUserModel extends FlutterFlowModel<AdminCreateUserWidget> {
  ///  Local state fields for this page.

  int selectSectorID = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for FullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;
  // State field(s) for Referr widget.
  FocusNode? referrFocusNode;
  TextEditingController? referrController;
  String? Function(BuildContext, String?)? referrControllerValidator;
  // State field(s) for TelegramNumber widget.
  FocusNode? telegramNumberFocusNode;
  TextEditingController? telegramNumberController;
  String? Function(BuildContext, String?)? telegramNumberControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createdUser;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameController?.dispose();

    referrFocusNode?.dispose();
    referrController?.dispose();

    telegramNumberFocusNode?.dispose();
    telegramNumberController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
