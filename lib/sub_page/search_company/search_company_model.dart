import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_company_widget.dart' show SearchCompanyWidget;
import 'package:flutter/material.dart';

class SearchCompanyModel extends FlutterFlowModel<SearchCompanyWidget> {
  ///  Local state fields for this page.

  bool isSearch = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Search company)] action in TextField widget.
  ApiCallResponse? apiResultbfs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
