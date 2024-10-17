import '/flutter_flow/flutter_flow_util.dart';
import 'edit_event_widget.dart' show EditEventWidget;
import 'package:flutter/material.dart';

class EditEventModel extends FlutterFlowModel<EditEventWidget> {
  ///  Local state fields for this page.

  DateTime? eventDate;

  String? selectImage;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for Details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsTextController;
  String? Function(BuildContext, String?)? detailsTextControllerValidator;
  DateTime? datePicked;
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
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    detailsFocusNode?.dispose();
    detailsTextController?.dispose();
  }
}
