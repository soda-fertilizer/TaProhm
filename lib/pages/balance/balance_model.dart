import '/component/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'balance_widget.dart' show BalanceWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class BalanceModel extends FlutterFlowModel<BalanceWidget> {
  ///  Local state fields for this page.

  String inputMoney = 'Deposit';

  String giveMoney = 'Withdrawal';

  String tranfer = 'Transfer';

  String buy = 'Buy';

  ///  State fields for stateful widgets in this page.

  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
