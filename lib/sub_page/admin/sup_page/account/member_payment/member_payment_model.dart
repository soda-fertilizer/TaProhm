import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/component/show_k_h_q_r/show_k_h_q_r_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/permissions_util.dart';
import 'member_payment_widget.dart' show MemberPaymentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
