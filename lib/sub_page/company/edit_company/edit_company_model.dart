import '/flutter_flow/flutter_flow_util.dart';
import 'edit_company_widget.dart' show EditCompanyWidget;
import 'package:flutter/material.dart';

class EditCompanyModel extends FlutterFlowModel<EditCompanyWidget> {
  ///  Local state fields for this page.

  int imageLoop = 0;

  int? selectImageIndex;

  List<String> selectImage = [];
  void addToSelectImage(String item) => selectImage.add(item);
  void removeFromSelectImage(String item) => selectImage.remove(item);
  void removeAtIndexFromSelectImage(int index) => selectImage.removeAt(index);
  void insertAtIndexInSelectImage(int index, String item) =>
      selectImage.insert(index, item);
  void updateSelectImageAtIndex(int index, Function(String) updateFn) =>
      selectImage[index] = updateFn(selectImage[index]);

  String profile = 'false';

  bool haveDocument = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for CompanyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for TelegramLink widget.
  FocusNode? telegramLinkFocusNode;
  TextEditingController? telegramLinkTextController;
  String? Function(BuildContext, String?)? telegramLinkTextControllerValidator;
  // State field(s) for Discount widget.
  FocusNode? discountFocusNode;
  TextEditingController? discountTextController;
  String? Function(BuildContext, String?)? discountTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Stores action output result for [Bottom Sheet - selectLocation] action in PickLocation widget.
  LatLng? getLocation;
  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    telegramLinkFocusNode?.dispose();
    telegramLinkTextController?.dispose();

    discountFocusNode?.dispose();
    discountTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
