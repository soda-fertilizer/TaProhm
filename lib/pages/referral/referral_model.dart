import '/component/nav_padding/nav_padding_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'referral_widget.dart' show ReferralWidget;
import 'package:flutter/material.dart';

class ReferralModel extends FlutterFlowModel<ReferralWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavPadding component.
  late NavPaddingModel navPaddingModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navPaddingModel = createModel(context, () => NavPaddingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    navPaddingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
