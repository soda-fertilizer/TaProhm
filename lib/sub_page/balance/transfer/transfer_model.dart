import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transfer_widget.dart' show TransferWidget;
import 'package:flutter/material.dart';

class TransferModel extends FlutterFlowModel<TransferWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  var scanner = '';
  // Stores action output result for [Backend Call - API (one user name)] action in Button widget.
  ApiCallResponse? responseUserName;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  TransactionsRow? ownTransfer;
  // Stores action output result for [Backend Call - API (Update Balance)] action in Button widget.
  ApiCallResponse? apiResult37s;
  // Stores action output result for [Backend Call - API (Update Balance)] action in Button widget.
  ApiCallResponse? apiResult23456;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  TransactionsRow? userTranfer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
