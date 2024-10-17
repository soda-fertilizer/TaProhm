import '/flutter_flow/flutter_flow_util.dart';
import 'view_company_widget.dart' show ViewCompanyWidget;
import 'package:flutter/material.dart';

class ViewCompanyModel extends FlutterFlowModel<ViewCompanyWidget> {
  ///  Local state fields for this page.

  int imageLoop = 0;

  int? selectImageIndex;

  ///  State fields for stateful widgets in this page.

  // State field(s) for CompanyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  // State field(s) for TelegramNumber widget.
  FocusNode? telegramNumberFocusNode;
  TextEditingController? telegramNumberTextController;
  String? Function(BuildContext, String?)?
      telegramNumberTextControllerValidator;
  // State field(s) for TelegramUsername widget.
  FocusNode? telegramUsernameFocusNode;
  TextEditingController? telegramUsernameTextController;
  String? Function(BuildContext, String?)?
      telegramUsernameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    telegramNumberFocusNode?.dispose();
    telegramNumberTextController?.dispose();

    telegramUsernameFocusNode?.dispose();
    telegramUsernameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();
  }
}
