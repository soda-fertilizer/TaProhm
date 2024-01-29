import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_user_for_officer_widget.dart' show CreateUserForOfficerWidget;
import 'package:flutter/material.dart';

class CreateUserForOfficerModel
    extends FlutterFlowModel<CreateUserForOfficerWidget> {
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
  // Stores action output result for [Backend Call - API (Get max phone number)] action in CreateUserForOfficer widget.
  ApiCallResponse? maxPhoneNumber;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NormalFullName widget.
  FocusNode? normalFullNameFocusNode;
  TextEditingController? normalFullNameController;
  String? Function(BuildContext, String?)? normalFullNameControllerValidator;
  // State field(s) for NormalPassword widget.
  FocusNode? normalPasswordFocusNode;
  TextEditingController? normalPasswordController;
  late bool normalPasswordVisibility;
  String? Function(BuildContext, String?)? normalPasswordControllerValidator;
  // State field(s) for NormalPhoneNumber widget.
  FocusNode? normalPhoneNumberFocusNode;
  TextEditingController? normalPhoneNumberController;
  String? Function(BuildContext, String?)? normalPhoneNumberControllerValidator;
  // State field(s) for NormalReferral widget.
  FocusNode? normalReferralFocusNode;
  TextEditingController? normalReferralController;
  String? Function(BuildContext, String?)? normalReferralControllerValidator;
  // State field(s) for NormalInvite widget.
  FocusNode? normalInviteFocusNode;
  TextEditingController? normalInviteController;
  String? Function(BuildContext, String?)? normalInviteControllerValidator;
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    normalPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    normalFullNameFocusNode?.dispose();
    normalFullNameController?.dispose();

    normalPasswordFocusNode?.dispose();
    normalPasswordController?.dispose();

    normalPhoneNumberFocusNode?.dispose();
    normalPhoneNumberController?.dispose();

    normalReferralFocusNode?.dispose();
    normalReferralController?.dispose();

    normalInviteFocusNode?.dispose();
    normalInviteController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
