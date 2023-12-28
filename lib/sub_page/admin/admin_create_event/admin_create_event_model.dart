import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'admin_create_event_widget.dart' show AdminCreateEventWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminCreateEventModel extends FlutterFlowModel<AdminCreateEventWidget> {
  ///  Local state fields for this page.

  String? uploadImage;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for Details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsController;
  String? Function(BuildContext, String?)? detailsControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    titleFocusNode?.dispose();
    titleController?.dispose();

    detailsFocusNode?.dispose();
    detailsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
