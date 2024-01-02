import '/flutter_flow/flutter_flow_util.dart';
import 'approve_transaction_widget.dart' show ApproveTransactionWidget;
import 'package:flutter/material.dart';

class ApproveTransactionModel
    extends FlutterFlowModel<ApproveTransactionWidget> {
  ///  Local state fields for this page.

  String depositType = 'Deposit';

  String withdrawalType = 'Withdrawal';

  DateTime? fromDate;

  DateTime? toDate;

  String transfer = 'Transfer';

  String buy = 'Buy';

  String referral = 'Referral';

  String receive = 'Receive';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  DateTime? datePicked1;
  DateTime? datePicked2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
