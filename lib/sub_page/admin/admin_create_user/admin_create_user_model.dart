import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'admin_create_user_widget.dart' show AdminCreateUserWidget;
import 'package:flutter/material.dart';
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for TeamFullName widget.
  FocusNode? teamFullNameFocusNode;
  TextEditingController? teamFullNameController;
  String? Function(BuildContext, String?)? teamFullNameControllerValidator;
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
  // State field(s) for MemberInvite widget.
  FocusNode? memberInviteFocusNode1;
  TextEditingController? memberInviteController1;
  String? Function(BuildContext, String?)? memberInviteController1Validator;
  // State field(s) for MemberTelegramNumber widget.
  FocusNode? memberTelegramNumberFocusNode1;
  TextEditingController? memberTelegramNumberController1;
  String? Function(BuildContext, String?)?
      memberTelegramNumberController1Validator;
  // State field(s) for MemberPassword widget.
  FocusNode? memberPasswordFocusNode1;
  TextEditingController? memberPasswordController1;
  late bool memberPasswordVisibility1;
  String? Function(BuildContext, String?)? memberPasswordController1Validator;
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
  FocusNode? memberInviteFocusNode2;
  TextEditingController? memberInviteController2;
  String? Function(BuildContext, String?)? memberInviteController2Validator;
  // State field(s) for MemberTelegramNumber widget.
  FocusNode? memberTelegramNumberFocusNode2;
  TextEditingController? memberTelegramNumberController2;
  String? Function(BuildContext, String?)?
      memberTelegramNumberController2Validator;
  // State field(s) for MemberPassword widget.
  FocusNode? memberPasswordFocusNode2;
  TextEditingController? memberPasswordController2;
  late bool memberPasswordVisibility2;
  String? Function(BuildContext, String?)? memberPasswordController2Validator;
  // State field(s) for MemberSector widget.
  String? memberSectorValue;
  FormFieldController<String>? memberSectorValueController;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createdUser;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    memberPasswordVisibility1 = false;
    memberPasswordVisibility2 = false;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    teamFullNameFocusNode?.dispose();
    teamFullNameController?.dispose();

    memberInviteFocusNode1?.dispose();
    memberInviteController1?.dispose();

    memberTelegramNumberFocusNode1?.dispose();
    memberTelegramNumberController1?.dispose();

    memberPasswordFocusNode1?.dispose();
    memberPasswordController1?.dispose();

    memberFullNameFocusNode?.dispose();
    memberFullNameController?.dispose();

    memberReferrFocusNode?.dispose();
    memberReferrController?.dispose();

    memberInviteFocusNode2?.dispose();
    memberInviteController2?.dispose();

    memberTelegramNumberFocusNode2?.dispose();
    memberTelegramNumberController2?.dispose();

    memberPasswordFocusNode2?.dispose();
    memberPasswordController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
