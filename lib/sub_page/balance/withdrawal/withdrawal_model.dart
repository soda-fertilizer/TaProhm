import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'withdrawal_widget.dart' show WithdrawalWidget;
import 'package:flutter/material.dart';

class WithdrawalModel extends FlutterFlowModel<WithdrawalWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  TransactionsRow? requestDeposit;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
