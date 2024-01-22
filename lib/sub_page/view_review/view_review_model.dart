import '/flutter_flow/flutter_flow_util.dart';
import 'view_review_widget.dart' show ViewReviewWidget;
import 'package:flutter/material.dart';

class ViewReviewModel extends FlutterFlowModel<ViewReviewWidget> {
  ///  Local state fields for this page.

  bool readyRating = false;

  bool isLoaded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailController;
  String? Function(BuildContext, String?)? detailControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    detailFocusNode?.dispose();
    detailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
