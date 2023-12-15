import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'company_widget.dart' show CompanyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {}

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
