import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'login_component_widget.dart' show LoginComponentWidget;
import 'package:flutter/material.dart';

class LoginComponentModel extends FlutterFlowModel<LoginComponentWidget> {
  ///  Local state fields for this component.

  int selectSectorID = 1;

  String selectReferralAndInvite = '';

  String selectedProvince = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for LoginPhoneNumber widget.
  FocusNode? loginPhoneNumberFocusNode;
  TextEditingController? loginPhoneNumberTextController;
  String? Function(BuildContext, String?)?
      loginPhoneNumberTextControllerValidator;
  // State field(s) for LoginPassword widget.
  FocusNode? loginPasswordFocusNode;
  TextEditingController? loginPasswordTextController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordTextControllerValidator;
  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? login2;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for SingUpFullName widget.
  FocusNode? singUpFullNameFocusNode;
  TextEditingController? singUpFullNameTextController;
  String? Function(BuildContext, String?)?
      singUpFullNameTextControllerValidator;
  // State field(s) for SignUPPassword widget.
  FocusNode? signUPPasswordFocusNode;
  TextEditingController? signUPPasswordTextController;
  late bool signUPPasswordVisibility;
  String? Function(BuildContext, String?)?
      signUPPasswordTextControllerValidator;
  // State field(s) for SignUpPhoneNumber widget.
  FocusNode? signUpPhoneNumberFocusNode;
  TextEditingController? signUpPhoneNumberTextController;
  String? Function(BuildContext, String?)?
      signUpPhoneNumberTextControllerValidator;
  // State field(s) for SingUpProvince widget.
  String? singUpProvinceValue;
  FormFieldController<String>? singUpProvinceValueController;
  // State field(s) for SingUpDistrict widget.
  String? singUpDistrictValue;
  FormFieldController<String>? singUpDistrictValueController;
  // Stores action output result for [Backend Call - API (Check phone number)] action in Button widget.
  ApiCallResponse? checkPhoneNumber;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createdUser;
  // Stores action output result for [Custom Action - initFirebaseMessage] action in Button widget.
  String? token;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? updateToken;

  @override
  void initState(BuildContext context) {
    loginPasswordVisibility = false;
    signUPPasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    loginPhoneNumberFocusNode?.dispose();
    loginPhoneNumberTextController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordTextController?.dispose();

    singUpFullNameFocusNode?.dispose();
    singUpFullNameTextController?.dispose();

    signUPPasswordFocusNode?.dispose();
    signUPPasswordTextController?.dispose();

    signUpPhoneNumberFocusNode?.dispose();
    signUpPhoneNumberTextController?.dispose();
  }
}
