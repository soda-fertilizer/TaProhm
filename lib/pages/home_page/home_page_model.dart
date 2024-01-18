import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/component/nav_bar/nav_bar_widget.dart';
import '/component/nav_padding/nav_padding_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<CompaniesRow> sortList = [];
  void addToSortList(CompaniesRow item) => sortList.add(item);
  void removeFromSortList(CompaniesRow item) => sortList.remove(item);
  void removeAtIndexFromSortList(int index) => sortList.removeAt(index);
  void insertAtIndexInSortList(int index, CompaniesRow item) =>
      sortList.insert(index, item);
  void updateSortListAtIndex(int index, Function(CompaniesRow) updateFn) =>
      sortList[index] = updateFn(sortList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (check password change)] action in HomePage widget.
  ApiCallResponse? passwordChange;
  // Stores action output result for [Backend Call - API (AppVersion)] action in HomePage widget.
  ApiCallResponse? appVersion;
  // Stores action output result for [Backend Call - API (Check Maintenance mode)] action in HomePage widget.
  ApiCallResponse? check;
  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Stores action output result for [Custom Action - initFirebaseMessage] action in Text widget.
  String? jwt;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavPadding component.
  late NavPaddingModel navPaddingModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navPaddingModel = createModel(context, () => NavPaddingModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    navPaddingModel.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

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
