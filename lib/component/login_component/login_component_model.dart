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
  TextEditingController? loginPhoneNumberController;
  String? Function(BuildContext, String?)? loginPhoneNumberControllerValidator;
  // State field(s) for LoginPassword widget.
  FocusNode? loginPasswordFocusNode;
  TextEditingController? loginPasswordController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordControllerValidator;
  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? login2;
  // Stores action output result for [Custom Action - initFirebaseMessage] action in Button widget.
  String? fcmToken;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for SingUpFullName widget.
  FocusNode? singUpFullNameFocusNode;
  TextEditingController? singUpFullNameController;
  String? Function(BuildContext, String?)? singUpFullNameControllerValidator;
  // State field(s) for SignUPPassword widget.
  FocusNode? signUPPasswordFocusNode;
  TextEditingController? signUPPasswordController;
  late bool signUPPasswordVisibility;
  String? Function(BuildContext, String?)? signUPPasswordControllerValidator;
  // State field(s) for SignUpPhoneNumber widget.
  FocusNode? signUpPhoneNumberFocusNode;
  TextEditingController? signUpPhoneNumberController;
  String? Function(BuildContext, String?)? signUpPhoneNumberControllerValidator;
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loginPasswordVisibility = false;
    signUPPasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    loginPhoneNumberFocusNode?.dispose();
    loginPhoneNumberController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordController?.dispose();

    singUpFullNameFocusNode?.dispose();
    singUpFullNameController?.dispose();

    signUPPasswordFocusNode?.dispose();
    signUPPasswordController?.dispose();

    signUpPhoneNumberFocusNode?.dispose();
    signUpPhoneNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
