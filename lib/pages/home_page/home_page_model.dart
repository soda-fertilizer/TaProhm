import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/component/nav_bar/nav_bar_widget.dart';
import '/component/nav_padding/nav_padding_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

  LatLng? selectLocation;

  int? buttonClickindex;

  double selectLat = 0.0;

  double selectLon = 0.0;

  int? selectProvinceID;

  int? buttonClickindex2;

  double? selectDistrictID;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (AppVersion)] action in HomePage widget.
  ApiCallResponse? appVersion;
  // Stores action output result for [Backend Call - API (check password change)] action in HomePage widget.
  ApiCallResponse? passwordChange;
  // Model for NavPadding component.
  late NavPaddingModel navPaddingModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navPaddingModel = createModel(context, () => NavPaddingModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navPaddingModel.dispose();
    navBarModel.dispose();
  }
}
