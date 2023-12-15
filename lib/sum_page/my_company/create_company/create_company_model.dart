import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'create_company_widget.dart' show CreateCompanyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class CreateCompanyModel extends FlutterFlowModel<CreateCompanyWidget> {
  ///  Local state fields for this page.

  int imageLoop = 0;

  int? selectImageIndex;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for CompanyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for TelegramLink widget.
  FocusNode? telegramLinkFocusNode;
  TextEditingController? telegramLinkController;
  String? Function(BuildContext, String?)? telegramLinkControllerValidator;
  // State field(s) for InviteID widget.
  FocusNode? inviteIDFocusNode;
  TextEditingController? inviteIDController;
  String? Function(BuildContext, String?)? inviteIDControllerValidator;
  // State field(s) for Discount widget.
  FocusNode? discountFocusNode;
  TextEditingController? discountController;
  String? Function(BuildContext, String?)? discountControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    telegramLinkFocusNode?.dispose();
    telegramLinkController?.dispose();

    inviteIDFocusNode?.dispose();
    inviteIDController?.dispose();

    discountFocusNode?.dispose();
    discountController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
