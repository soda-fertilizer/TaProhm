import '/flutter_flow/flutter_flow_util.dart';
import 'view_company_widget.dart' show ViewCompanyWidget;
import 'package:flutter/material.dart';

class ViewCompanyModel extends FlutterFlowModel<ViewCompanyWidget> {
  ///  Local state fields for this page.

  int imageLoop = 0;

  int? selectImageIndex;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CompanyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  // State field(s) for TelegramNumber widget.
  FocusNode? telegramNumberFocusNode;
  TextEditingController? telegramNumberController;
  String? Function(BuildContext, String?)? telegramNumberControllerValidator;
  // State field(s) for TelegramUsername widget.
  FocusNode? telegramUsernameFocusNode;
  TextEditingController? telegramUsernameController;
  String? Function(BuildContext, String?)? telegramUsernameControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    telegramNumberFocusNode?.dispose();
    telegramNumberController?.dispose();

    telegramUsernameFocusNode?.dispose();
    telegramUsernameController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
