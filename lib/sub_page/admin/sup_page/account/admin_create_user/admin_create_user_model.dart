import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import 'admin_create_user_widget.dart' show AdminCreateUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminCreateUserModel extends FlutterFlowModel<AdminCreateUserWidget> {
  ///  Local state fields for this page.

  int selectSectorID = 1;

  String? selectCityPhoneNumber;

  String? selectDistrictPhoneNumber;

  String? selectCommunePhoneNumber;

  String? selectSectorPhoneNumber = '';

  String? selectReferral = '';

  bool isLodaingCompleted = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get max phone number)] action in AdminCreateUser widget.
  ApiCallResponse? maxPhoneNumber;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for NormalFullName widget.
  FocusNode? normalFullNameFocusNode;
  TextEditingController? normalFullNameController;
  String? Function(BuildContext, String?)? normalFullNameControllerValidator;
  // State field(s) for NormalPassword widget.
  FocusNode? normalPasswordFocusNode;
  TextEditingController? normalPasswordController;
  late bool normalPasswordVisibility;
  String? Function(BuildContext, String?)? normalPasswordControllerValidator;
  // State field(s) for NormalInvite widget.
  FocusNode? normalInviteFocusNode;
  TextEditingController? normalInviteController;
  String? Function(BuildContext, String?)? normalInviteControllerValidator;
  // State field(s) for NormalPhoneNumber widget.
  FocusNode? normalPhoneNumberFocusNode;
  TextEditingController? normalPhoneNumberController;
  String? Function(BuildContext, String?)? normalPhoneNumberControllerValidator;
  // State field(s) for Sector widget.
  String? sectorValue;
  FormFieldController<String>? sectorValueController;
  // State field(s) for city widget.
  String? cityValue;
  FormFieldController<String>? cityValueController;
  // State field(s) for district widget.
  String? districtValue;
  FormFieldController<String>? districtValueController;
  // State field(s) for commune widget.
  String? communeValue;
  FormFieldController<String>? communeValueController;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for MemberFullName widget.
  FocusNode? memberFullNameFocusNode;
  TextEditingController? memberFullNameController;
  String? Function(BuildContext, String?)? memberFullNameControllerValidator;
  // State field(s) for MemberReferr widget.
  FocusNode? memberReferrFocusNode;
  TextEditingController? memberReferrController;
  String? Function(BuildContext, String?)? memberReferrControllerValidator;
  // State field(s) for MemberInvite widget.
  FocusNode? memberInviteFocusNode;
  TextEditingController? memberInviteController;
  String? Function(BuildContext, String?)? memberInviteControllerValidator;
  // State field(s) for MemberPassword widget.
  FocusNode? memberPasswordFocusNode;
  TextEditingController? memberPasswordController;
  late bool memberPasswordVisibility;
  String? Function(BuildContext, String?)? memberPasswordControllerValidator;
  // State field(s) for MemberSector widget.
  String? memberSectorValue;
  FormFieldController<String>? memberSectorValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    normalPasswordVisibility = false;
    memberPasswordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    normalFullNameFocusNode?.dispose();
    normalFullNameController?.dispose();

    normalPasswordFocusNode?.dispose();
    normalPasswordController?.dispose();

    normalInviteFocusNode?.dispose();
    normalInviteController?.dispose();

    normalPhoneNumberFocusNode?.dispose();
    normalPhoneNumberController?.dispose();

    memberFullNameFocusNode?.dispose();
    memberFullNameController?.dispose();

    memberReferrFocusNode?.dispose();
    memberReferrController?.dispose();

    memberInviteFocusNode?.dispose();
    memberInviteController?.dispose();

    memberPasswordFocusNode?.dispose();
    memberPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
