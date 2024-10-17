import '/flutter_flow/flutter_flow_util.dart';
import 'team_payment_widget.dart' show TeamPaymentWidget;
import 'package:flutter/material.dart';

class TeamPaymentModel extends FlutterFlowModel<TeamPaymentWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
