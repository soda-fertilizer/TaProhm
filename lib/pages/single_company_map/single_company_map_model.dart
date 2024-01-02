import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/nav_bar/nav_bar_widget.dart';
import '/component/nav_padding/nav_padding_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'single_company_map_widget.dart' show SingleCompanyMapWidget;
import 'package:flutter/material.dart';

class SingleCompanyMapModel extends FlutterFlowModel<SingleCompanyMapWidget> {
  ///  Local state fields for this page.

  int locationLoop = 0;

  List<CustomMapLocationStruct> locationList = [];
  void addToLocationList(CustomMapLocationStruct item) =>
      locationList.add(item);
  void removeFromLocationList(CustomMapLocationStruct item) =>
      locationList.remove(item);
  void removeAtIndexFromLocationList(int index) => locationList.removeAt(index);
  void insertAtIndexInLocationList(int index, CustomMapLocationStruct item) =>
      locationList.insert(index, item);
  void updateLocationListAtIndex(
          int index, Function(CustomMapLocationStruct) updateFn) =>
      locationList[index] = updateFn(locationList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    navPaddingModel.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
