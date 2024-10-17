import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'review_widget.dart' show ReviewWidget;
import 'package:flutter/material.dart';

class ReviewModel extends FlutterFlowModel<ReviewWidget> {
  ///  Local state fields for this page.

  bool readyRating = false;

  bool isLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (check rating)] action in Review widget.
  ApiCallResponse? apiResultsmu;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailTextController;
  String? Function(BuildContext, String?)? detailTextControllerValidator;
  // State field(s) for ReadyRatingBar widget.
  double? readyRatingBarValue;
  // State field(s) for ReadyDetail widget.
  FocusNode? readyDetailFocusNode;
  TextEditingController? readyDetailTextController;
  String? Function(BuildContext, String?)? readyDetailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    detailFocusNode?.dispose();
    detailTextController?.dispose();

    readyDetailFocusNode?.dispose();
    readyDetailTextController?.dispose();
  }
}
