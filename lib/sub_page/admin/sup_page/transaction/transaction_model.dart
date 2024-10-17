import '/flutter_flow/flutter_flow_util.dart';
import 'transaction_widget.dart' show TransactionWidget;
import 'package:flutter/material.dart';

class TransactionModel extends FlutterFlowModel<TransactionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
