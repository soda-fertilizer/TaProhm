import '/flutter_flow/flutter_flow_util.dart';
import 'company_widget.dart' show CompanyWidget;
import 'package:flutter/material.dart';

class CompanyModel extends FlutterFlowModel<CompanyWidget> {
  ///  Local state fields for this page.

  int imageLoop = 0;

  int? selectImageIndex;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
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
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    amountFocusNode?.dispose();
    amountController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    telegramNumberFocusNode?.dispose();
    telegramNumberController?.dispose();

    telegramUsernameFocusNode?.dispose();
    telegramUsernameController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
