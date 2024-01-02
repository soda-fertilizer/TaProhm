import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/permissions_util.dart';
import 'transfer_widget.dart' show TransferWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransferModel extends FlutterFlowModel<TransferWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  var scanner = '';
  // Stores action output result for [Backend Call - API (one user name)] action in Button widget.
  ApiCallResponse? responseUserName;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  TransactionsRow? ownTransfer;
  // Stores action output result for [Backend Call - API (Update Balance)] action in Button widget.
  ApiCallResponse? apiResult37s;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  TransactionsRow? userTranfer;
  // Stores action output result for [Backend Call - API (Update Balance)] action in Button widget.
  ApiCallResponse? apiResult23456;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    amountFocusNode?.dispose();
    amountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
