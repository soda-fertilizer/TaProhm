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

  // Stores action output result for [Backend Call - API (Get max phone number)] action in CreateUserForOfficer widget.
  ApiCallResponse? maxPhoneNumber;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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

  @override
  void initState(BuildContext context) {
    normalPasswordVisibility = false;
  }

  @override
  void dispose() {
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
  }
}
