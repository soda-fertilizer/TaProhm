import '/flutter_flow/flutter_flow_util.dart';
import 'company_info_widget.dart' show CompanyInfoWidget;
import 'package:flutter/material.dart';

class CompanyInfoModel extends FlutterFlowModel<CompanyInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
