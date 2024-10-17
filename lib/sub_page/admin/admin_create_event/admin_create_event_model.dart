import '/flutter_flow/flutter_flow_util.dart';
import 'admin_create_event_widget.dart' show AdminCreateEventWidget;
import 'package:flutter/material.dart';

class AdminCreateEventModel extends FlutterFlowModel<AdminCreateEventWidget> {
  ///  Local state fields for this page.

  DateTime? eventDate;

  String? selectImage;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
    tabBarController?.dispose();
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    detailsFocusNode?.dispose();
    detailsTextController?.dispose();
  }
}
