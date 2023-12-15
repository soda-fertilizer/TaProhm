import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/component/login_component/login_component_widget.dart';
import '/component/login_only/login_only_widget.dart';
import '/component/nav_bar/nav_bar_widget.dart';
import '/component/nav_padding/nav_padding_widget.dart';
import '/component/show_shop/show_shop_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'map_page_widget.dart' show MapPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapPageModel extends FlutterFlowModel<MapPageWidget> {
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
  // Stores action output result for [Backend Call - API (Company Location)] action in MapPage widget.
  ApiCallResponse? apiResult8il;
  // Model for NavPadding component.
  late NavPaddingModel navPaddingModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navPaddingModel = createModel(context, () => NavPaddingModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navPaddingModel.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
