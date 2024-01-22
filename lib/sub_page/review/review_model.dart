import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'review_widget.dart' show ReviewWidget;
import 'package:flutter/material.dart';

class ReviewModel extends FlutterFlowModel<ReviewWidget> {
  ///  Local state fields for this page.

  bool readyRating = false;

  bool isLoaded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (check rating)] action in Review widget.
  ApiCallResponse? apiResultsmu;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailController;
  String? Function(BuildContext, String?)? detailControllerValidator;
  // State field(s) for ReadyRatingBar widget.
  double? readyRatingBarValue;
  // State field(s) for ReadyDetail widget.
  FocusNode? readyDetailFocusNode;
  TextEditingController? readyDetailController;
  String? Function(BuildContext, String?)? readyDetailControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    detailFocusNode?.dispose();
    detailController?.dispose();

    readyDetailFocusNode?.dispose();
    readyDetailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
