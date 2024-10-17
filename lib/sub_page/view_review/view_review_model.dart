import '/flutter_flow/flutter_flow_util.dart';
import 'view_review_widget.dart' show ViewReviewWidget;
import 'package:flutter/material.dart';

class ViewReviewModel extends FlutterFlowModel<ViewReviewWidget> {
  ///  Local state fields for this page.

  bool readyRating = false;

  bool isLoaded = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailTextController;
  String? Function(BuildContext, String?)? detailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    detailFocusNode?.dispose();
    detailTextController?.dispose();
  }
}
