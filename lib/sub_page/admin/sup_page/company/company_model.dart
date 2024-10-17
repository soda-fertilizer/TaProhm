import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'company_widget.dart' show CompanyWidget;
import 'package:flutter/material.dart';

class CompanyModel extends FlutterFlowModel<CompanyWidget> {
  ///  Local state fields for this page.

  int imageLoop = 0;

  int? selectImageIndex;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
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
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Stores action output result for [Backend Call - API (sector phone number)] action in Button widget.
  ApiCallResponse? sectorPhoneNumber;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    telegramNumberFocusNode?.dispose();
    telegramNumberTextController?.dispose();

    telegramUsernameFocusNode?.dispose();
    telegramUsernameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
