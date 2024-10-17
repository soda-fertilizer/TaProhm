import '/component/nav_bar/nav_bar_widget.dart';
import '/component/nav_padding/nav_padding_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
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
