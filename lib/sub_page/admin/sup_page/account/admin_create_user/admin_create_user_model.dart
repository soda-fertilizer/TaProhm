import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admin_create_user_widget.dart' show AdminCreateUserWidget;
import 'package:flutter/material.dart';

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
  TextEditingController? normalFullNameTextController;
  String? Function(BuildContext, String?)?
      normalFullNameTextControllerValidator;
  // State field(s) for NormalPassword widget.
  FocusNode? normalPasswordFocusNode;
  TextEditingController? normalPasswordTextController;
  late bool normalPasswordVisibility;
  String? Function(BuildContext, String?)?
      normalPasswordTextControllerValidator;
  // State field(s) for NormalPhoneNumber widget.
  FocusNode? normalPhoneNumberFocusNode;
  TextEditingController? normalPhoneNumberTextController;
  String? Function(BuildContext, String?)?
      normalPhoneNumberTextControllerValidator;
  // State field(s) for NormalReferral widget.
  FocusNode? normalReferralFocusNode;
  TextEditingController? normalReferralTextController;
  String? Function(BuildContext, String?)?
      normalReferralTextControllerValidator;
  // State field(s) for NormalInvite widget.
  FocusNode? normalInviteFocusNode;
  TextEditingController? normalInviteTextController;
  String? Function(BuildContext, String?)? normalInviteTextControllerValidator;
  // State field(s) for NormalSector widget.
  String? normalSectorValue;
  FormFieldController<String>? normalSectorValueController;
  // Stores action output result for [Backend Call - API (Check phone number)] action in Pay widget.
  ApiCallResponse? checkphonenumber;
  // Stores action output result for [Backend Call - API (Check referral)] action in Pay widget.
  ApiCallResponse? checkreferral;
  // Stores action output result for [Backend Call - API (Check referral)] action in Pay widget.
  ApiCallResponse? checkinvide;
  // Stores action output result for [Backend Call - API (Check phone number)] action in Button widget.
  ApiCallResponse? checkphonenumberNew;
  // Stores action output result for [Backend Call - API (Check referral)] action in Button widget.
  ApiCallResponse? checkreferralNew;
  // Stores action output result for [Backend Call - API (Check referral)] action in Button widget.
  ApiCallResponse? checkinvideNew;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for MemberFullName widget.
  FocusNode? memberFullNameFocusNode;
  TextEditingController? memberFullNameTextController;
  String? Function(BuildContext, String?)?
      memberFullNameTextControllerValidator;
  // State field(s) for MemberPassword widget.
  FocusNode? memberPasswordFocusNode;
  TextEditingController? memberPasswordTextController;
  late bool memberPasswordVisibility;
  String? Function(BuildContext, String?)?
      memberPasswordTextControllerValidator;
  // State field(s) for MemberReferr widget.
  FocusNode? memberReferrFocusNode;
  TextEditingController? memberReferrTextController;
  String? Function(BuildContext, String?)? memberReferrTextControllerValidator;
  // State field(s) for MemberSector widget.
  String? memberSectorValue;
  FormFieldController<String>? memberSectorValueController;
  // Stores action output result for [Backend Call - API (Check referral)] action in Button widget.
  ApiCallResponse? apiResultbep;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createUser;

  @override
  void initState(BuildContext context) {
    normalPasswordVisibility = false;
    memberPasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    normalFullNameFocusNode?.dispose();
    normalFullNameTextController?.dispose();

    normalPasswordFocusNode?.dispose();
    normalPasswordTextController?.dispose();

    normalPhoneNumberFocusNode?.dispose();
    normalPhoneNumberTextController?.dispose();

    normalReferralFocusNode?.dispose();
    normalReferralTextController?.dispose();

    normalInviteFocusNode?.dispose();
    normalInviteTextController?.dispose();

    memberFullNameFocusNode?.dispose();
    memberFullNameTextController?.dispose();

    memberPasswordFocusNode?.dispose();
    memberPasswordTextController?.dispose();

    memberReferrFocusNode?.dispose();
    memberReferrTextController?.dispose();
  }
}
