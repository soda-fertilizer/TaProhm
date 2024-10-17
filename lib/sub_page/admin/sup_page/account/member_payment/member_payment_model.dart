import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'member_payment_widget.dart' show MemberPaymentWidget;
import 'package:flutter/material.dart';

class MemberPaymentModel extends FlutterFlowModel<MemberPaymentWidget> {
  ///  Local state fields for this page.

  String? uploadedImage;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createUser;
  // Stores action output result for [Backend Call - API (Referral)] action in Button widget.
  ApiCallResponse? apiResult1an;
  // Stores action output result for [Backend Call - API (Update Balance)] action in Button widget.
  ApiCallResponse? apiResulta5x;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
