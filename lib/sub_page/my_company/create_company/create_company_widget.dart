import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'create_company_model.dart';
export 'create_company_model.dart';

class CreateCompanyWidget extends StatefulWidget {
  const CreateCompanyWidget({
    Key? key,
    this.pickedLatLng,
  }) : super(key: key);

  final LatLng? pickedLatLng;

  @override
  _CreateCompanyWidgetState createState() => _CreateCompanyWidgetState();
}

class _CreateCompanyWidgetState extends State<CreateCompanyWidget> {
  late CreateCompanyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateCompanyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(cameraPermission);
      await requestPermission(photoLibraryPermission);
      if ((await getPermissionStatus(cameraPermission)) &&
          (await getPermissionStatus(photoLibraryPermission))) {
        return;
      }

      await requestPermission(cameraPermission);
      await requestPermission(photoLibraryPermission);
      return;
    });

    _model.companyNameController ??=
        TextEditingController(text: FFAppState().CreateCompanyHolder.name);
    _model.companyNameFocusNode ??= FocusNode();

    _model.phoneNumberController ??= TextEditingController(
        text: FFAppState().CreateCompanyHolder.phoneNumber);
    _model.phoneNumberFocusNode ??= FocusNode();

    _model.telegramLinkController ??= TextEditingController(
        text: FFAppState().CreateCompanyHolder.telegramLink);
    _model.telegramLinkFocusNode ??= FocusNode();

    _model.discountController ??= TextEditingController(
        text: FFAppState().CreateCompanyHolder.discount.toString());
    _model.discountFocusNode ??= FocusNode();

    _model.textController5 ??=
        TextEditingController(text: FFAppState().CreateCompanyHolder.details);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Create Company',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          storageFolderPath: 'Companies/Profile',
                          maxWidth: 1080.00,
                          maxHeight: 1080.00,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading1 = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          var downloadUrls = <String>[];
                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();

                            downloadUrls = await uploadSupabaseStorageFiles(
                              bucketName: 'images',
                              selectedFiles: selectedMedia,
                            );
                          } finally {
                            _model.isDataUploading1 = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile1 =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl1 = downloadUrls.first;
                            });
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        setState(() {
                          FFAppState().updateCreateCompanyHolderStruct(
                            (e) => e
                              ..profile = valueOrDefault<String>(
                                _model.uploadedFileUrl1,
                                'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                              ),
                          );
                        });
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            valueOrDefault<String>(
                                          _model.uploadedFileUrl1,
                                          'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                                        ) ==
                                        null ||
                                    valueOrDefault<String>(
                                          _model.uploadedFileUrl1,
                                          'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                                        ) ==
                                        ''
                                ? FFAppState().CreateCompanyHolder.profile
                                : valueOrDefault<String>(
                                    _model.uploadedFileUrl1,
                                    'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                                  ),
                            'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _model.companyNameController,
                    focusNode: _model.companyNameFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Company name',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator: _model.companyNameControllerValidator
                        .asValidator(context),
                  ),
                  TextFormField(
                    controller: _model.phoneNumberController,
                    focusNode: _model.phoneNumberFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Phone number',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator: _model.phoneNumberControllerValidator
                        .asValidator(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                  ),
                  TextFormField(
                    controller: _model.telegramLinkController,
                    focusNode: _model.telegramLinkFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Telegram link',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator: _model.telegramLinkControllerValidator
                        .asValidator(context),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount (%): ',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        child: TextFormField(
                          controller: _model.discountController,
                          focusNode: _model.discountFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Discount',
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.number,
                          validator: _model.discountControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (false)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue ??=
                                FFAppState().CreateCompanyHolder.isVertify,
                            onChanged: (newValue) async {
                              setState(() => _model.checkboxValue = newValue!);
                              if (newValue!) {
                                setState(() {
                                  FFAppState().updateCreateCompanyHolderStruct(
                                    (e) => e..isVertify = true,
                                  );
                                });
                              } else {
                                setState(() {
                                  FFAppState().updateCreateCompanyHolderStruct(
                                    (e) => e..isVertify = false,
                                  );
                                });
                              }
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                        Text(
                          'I have document',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 1.0,
                      ),
                    ),
                    child: TextFormField(
                      controller: _model.textController5,
                      focusNode: _model.textFieldFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintText: 'Company detail',
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      maxLines: 5,
                      validator:
                          _model.textController5Validator.asValidator(context),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'PinLocation',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    text: FFAppState().CreateCompanyHolder.location == null
                        ? 'Pin location'
                        : FFAppState().CreateCompanyHolder.location!.toString(),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await actions.printAction(
                              FFAppState().CreateCompanyHolder.phoneNumber,
                            );
                          },
                          child: Text(
                            'Add image',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().update(() {
                                  FFAppState().updateCreateCompanyHolderStruct(
                                    (e) => e
                                      ..updateImageDetails(
                                        (e) => e
                                            .removeAt(_model.selectImageIndex!),
                                      ),
                                  );
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/icons8-remove-48.png',
                                  width: 30.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia = await selectMedia(
                                  storageFolderPath: 'Companies/Detaillmage',
                                  maxWidth: 1080.00,
                                  maxHeight: 1080.00,
                                  mediaSource: MediaSource.photoGallery,
                                  multiImage: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(
                                      () => _model.isDataUploading2 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls =
                                        await uploadSupabaseStorageFiles(
                                      bucketName: 'images',
                                      selectedFiles: selectedMedia,
                                    );
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    _model.isDataUploading2 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFiles2 =
                                          selectedUploadedFiles;
                                      _model.uploadedFileUrls2 = downloadUrls;
                                    });
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload data');
                                    return;
                                  }
                                }

                                while (_model.imageLoop <
                                    _model.uploadedFileUrls2.length) {
                                  setState(() {
                                    FFAppState()
                                        .updateCreateCompanyHolderStruct(
                                      (e) => e
                                        ..updateImageDetails(
                                          (e) => e.add(_model.uploadedFileUrls2[
                                              _model.imageLoop]),
                                        ),
                                    );
                                  });
                                  setState(() {
                                    _model.imageLoop = _model.imageLoop + 1;
                                  });
                                }
                                setState(() {
                                  _model.isDataUploading2 = false;
                                  _model.uploadedLocalFiles2 = [];
                                  _model.uploadedFileUrls2 = [];
                                });

                                setState(() {
                                  _model.imageLoop = 0;
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/icons8-image-48.png',
                                  width: 30.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia = await selectMedia(
                                  storageFolderPath: 'Companies/Detaillmage',
                                  maxWidth: 1080.00,
                                  maxHeight: 1080.00,
                                  multiImage: false,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(
                                      () => _model.isDataUploading3 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls =
                                        await uploadSupabaseStorageFiles(
                                      bucketName: 'images',
                                      selectedFiles: selectedMedia,
                                    );
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    _model.isDataUploading3 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile3 =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl3 =
                                          downloadUrls.first;
                                    });
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload data');
                                    return;
                                  }
                                }

                                setState(() {
                                  FFAppState().updateCreateCompanyHolderStruct(
                                    (e) => e
                                      ..updateImageDetails(
                                        (e) => e.add(_model.uploadedFileUrl3),
                                      ),
                                  );
                                });
                                setState(() {
                                  _model.isDataUploading3 = false;
                                  _model.uploadedLocalFile3 = FFUploadedFile(
                                      bytes: Uint8List.fromList([]));
                                  _model.uploadedFileUrl3 = '';
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/icons8-camera-48.png',
                                  width: 30.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      final images = FFAppState()
                          .CreateCompanyHolder
                          .imageDetails
                          .toList();
                      return Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: List.generate(images.length, (imagesIndex) {
                          final imagesItem = images[imagesIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.selectImageIndex = imagesIndex;
                              });
                              await actions.printAction(
                                _model.selectImageIndex?.toString(),
                              );
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.42,
                              height: 150.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: imagesIndex == _model.selectImageIndex
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  width: 1.0,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: OctoImage(
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                    FFAppConstants.BlurHash,
                                  ),
                                  image: CachedNetworkImageProvider(
                                    imagesItem,
                                  ),
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.42,
                                  height: 150.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      currentUserLocationValue = await getCurrentUserLocation(
                          defaultLocation: LatLng(0.0, 0.0));
                      if (FFAppState().CreateCompanyHolder.location == null) {
                        setState(() {
                          FFAppState().updateCreateCompanyHolderStruct(
                            (e) => e
                              ..name = _model.companyNameController.text
                              ..phoneNumber = _model.phoneNumberController.text
                              ..telegramLink =
                                  _model.telegramLinkController.text
                              ..details = _model.textController5.text
                              ..discount =
                                  int.tryParse(_model.discountController.text)
                              ..location = currentUserLocationValue
                              ..profile = valueOrDefault<String>(
                                _model.uploadedFileUrl1,
                                'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                              ),
                          );
                        });
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          'CompanyPayment',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );

                        return;
                      } else {
                        setState(() {
                          FFAppState().updateCreateCompanyHolderStruct(
                            (e) => e
                              ..name = _model.companyNameController.text
                              ..phoneNumber = _model.phoneNumberController.text
                              ..telegramLink =
                                  _model.telegramLinkController.text
                              ..details = _model.textController5.text
                              ..discount =
                                  int.tryParse(_model.discountController.text)
                              ..profile = valueOrDefault<String>(
                                _model.uploadedFileUrl1,
                                'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                              ),
                          );
                        });
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          'CompanyPayment',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );

                        return;
                      }
                    },
                    text: 'Next',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
