import '/flutter_flow/flutter_flow_util.dart';
import 'company_payment_widget.dart' show CompanyPaymentWidget;
import 'package:flutter/material.dart';

class CompanyPaymentModel extends FlutterFlowModel<CompanyPaymentWidget> {
  ///  Local state fields for this page.

  String? uploadedImage;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
