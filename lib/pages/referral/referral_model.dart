import '/backend/supabase/supabase.dart';
import '/component/nav_padding/nav_padding_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'referral_widget.dart' show ReferralWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {
    navPaddingModel = createModel(context, () => NavPaddingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    navPaddingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
