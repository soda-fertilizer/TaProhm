import '/component/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_company_widget.dart' show MyCompanyWidget;
import 'package:flutter/material.dart';

class MyCompanyModel extends FlutterFlowModel<MyCompanyWidget> {
  ///  State fields for stateful widgets in this page.

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
}
