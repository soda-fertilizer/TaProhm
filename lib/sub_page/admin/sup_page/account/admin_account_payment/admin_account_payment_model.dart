import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_account_payment_widget.dart' show AdminAccountPaymentWidget;
import 'package:flutter/material.dart';

class AdminAccountPaymentModel
    extends FlutterFlowModel<AdminAccountPaymentWidget> {
  ///  Local state fields for this page.

  String? uploadedImage;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createUser2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
