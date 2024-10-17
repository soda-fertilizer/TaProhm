import '/component/nav_bar/nav_bar_widget.dart';
import '/component/nav_padding/nav_padding_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'locator_widget.dart' show LocatorWidget;
import 'package:flutter/material.dart';

class LocatorModel extends FlutterFlowModel<LocatorWidget> {
  ///  State fields for stateful widgets in this page.

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
