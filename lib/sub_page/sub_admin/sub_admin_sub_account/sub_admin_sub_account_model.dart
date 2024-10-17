import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'sub_admin_sub_account_widget.dart' show SubAdminSubAccountWidget;
import 'package:flutter/material.dart';

class SubAdminSubAccountModel
    extends FlutterFlowModel<SubAdminSubAccountWidget> {
  ///  State fields for stateful widgets in this page.

  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
