import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_member_widget.dart' show SearchMemberWidget;
import 'package:flutter/material.dart';

class SearchMemberModel extends FlutterFlowModel<SearchMemberWidget> {
  ///  Local state fields for this page.

  LatLng? selectLocation;

  int? selectIndex;

  bool isSearch = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (search user and company)] action in TextField widget.
  ApiCallResponse? apiResultgy4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
