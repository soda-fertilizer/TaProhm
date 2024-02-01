import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'admin_create_user_model.dart';
export 'admin_create_user_model.dart';

class AdminCreateUserWidget extends StatefulWidget {
  const AdminCreateUserWidget({
    super.key,
    this.selectID,
  });

  final String? selectID;

  @override
  State<AdminCreateUserWidget> createState() => _AdminCreateUserWidgetState();
}

class _AdminCreateUserWidgetState extends State<AdminCreateUserWidget>
    with TickerProviderStateMixin {
  late AdminCreateUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminCreateUserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.maxPhoneNumber = await GetMaxPhoneNumberCall.call();
      if ((_model.maxPhoneNumber?.succeeded ?? true)) {
        setState(() {
          _model.isLodaingCompleted = true;
        });
        return;
      } else {
        await action_blocks.noInternet(context);
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.normalFullNameController ??= TextEditingController();
    _model.normalFullNameFocusNode ??= FocusNode();

    _model.normalPasswordController ??= TextEditingController();
    _model.normalPasswordFocusNode ??= FocusNode();

    _model.normalPhoneNumberController ??= TextEditingController();
    _model.normalPhoneNumberFocusNode ??= FocusNode();

    _model.normalReferralController ??=
        TextEditingController(text: widget.selectID);
    _model.normalReferralFocusNode ??= FocusNode();

    _model.normalInviteController ??=
        TextEditingController(text: widget.selectID);
    _model.normalInviteFocusNode ??= FocusNode();

    _model.memberFullNameController ??= TextEditingController();
    _model.memberFullNameFocusNode ??= FocusNode();

    _model.memberPasswordController ??= TextEditingController();
    _model.memberPasswordFocusNode ??= FocusNode();

    _model.memberReferrController ??=
        TextEditingController(text: widget.selectID);
    _model.memberReferrFocusNode ??= FocusNode();
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
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Create user',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Align(
                alignment: const Alignment(0.0, 0),
                child: TabBar(
                  labelColor: FlutterFlowTheme.of(context).primaryText,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium,
                  unselectedLabelStyle: const TextStyle(),
                  indicatorColor: FlutterFlowTheme.of(context).primary,
                  padding: const EdgeInsets.all(4.0),
                  tabs: const [
                    Tab(
                      text: 'Member',
                    ),
                    Tab(
                      text: 'Officer',
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [() async {}, () async {}][i]();
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    KeepAliveWidgetWrapper(
                      builder: (context) => Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    storageFolderPath: 'Users',
                                    maxWidth: 1080.00,
                                    maxHeight: 1080.00,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading1 = true);
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
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
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
                                      _model.isDataUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile1 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl1 =
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
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      _model.uploadedFileUrl1,
                                      'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: TextFormField(
                                    controller: _model.normalFullNameController,
                                    focusNode: _model.normalFullNameFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText: 'Full Name',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model
                                        .normalFullNameControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: TextFormField(
                                    controller: _model.normalPasswordController,
                                    focusNode: _model.normalPasswordFocusNode,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText:
                                        !_model.normalPasswordVisibility,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText: 'Password',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => _model
                                                  .normalPasswordVisibility =
                                              !_model.normalPasswordVisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.normalPasswordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: const Color(0xFF757575),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model
                                        .normalPasswordControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('^[^\\s]*\$'))
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: TextFormField(
                                    controller:
                                        _model.normalPhoneNumberController,
                                    focusNode:
                                        _model.normalPhoneNumberFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText: 'Phone',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model
                                        .normalPhoneNumberControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('^[^\\s]*\$'))
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: TextFormField(
                                    controller: _model.normalReferralController,
                                    focusNode: _model.normalReferralFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText: 'Referral ID',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model
                                        .normalReferralControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('^[^\\s]*\$'))
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: TextFormField(
                                    controller: _model.normalInviteController,
                                    focusNode: _model.normalInviteFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText: 'Invite ID',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model
                                        .normalInviteControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('^[^\\s]*\$'))
                                    ],
                                  ),
                                ),
                              ),
                              FutureBuilder<List<SectorsRow>>(
                                future: SectorsTable().queryRows(
                                  queryFn: (q) => q,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<SectorsRow> normalSectorSectorsRowList =
                                      snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller:
                                        _model.normalSectorValueController ??=
                                            FormFieldController<String>(
                                      _model.normalSectorValue ??=
                                          normalSectorSectorsRowList
                                              .where((e) =>
                                                  e.sectorID ==
                                                  _model.selectSectorID)
                                              .toList()
                                              .first
                                              .sectorName,
                                    ),
                                    options: normalSectorSectorsRowList
                                        .map((e) => valueOrDefault<String>(
                                              e.sectorName,
                                              'null',
                                            ))
                                        .toList(),
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.normalSectorValue = val);
                                      setState(() {
                                        _model.selectSectorID =
                                            normalSectorSectorsRowList
                                                .where((e) =>
                                                    e.sectorName ==
                                                    _model.normalSectorValue)
                                                .toList()
                                                .first
                                                .sectorID;
                                      });
                                    },
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 14.0,
                                        ),
                                    hintText: 'Please select sector',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 0.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    borderWidth: 1.0,
                                    borderRadius: 30.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                decoration: const BoxDecoration(),
                              ),
                              if (false)
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var shouldSetState = false;
                                        if ((_model.normalFullNameController.text != '') &&
                                            (_model
                                                        .normalPasswordController
                                                        .text !=
                                                    '') &&
                                            (_model.normalPhoneNumberController
                                                        .text !=
                                                    '') &&
                                            (_model.normalReferralController
                                                        .text !=
                                                    '') &&
                                            (_model.normalInviteController
                                                        .text !=
                                                    '')) {
                                          _model.checkphonenumber =
                                              await UsersGroup
                                                  .checkPhoneNumberCall
                                                  .call(
                                            phoneNumber: _model
                                                .normalPhoneNumberController
                                                .text,
                                          );
                                          shouldSetState = true;
                                          if ((_model.checkphonenumber
                                                  ?.succeeded ??
                                              true)) {
                                            _model.checkreferral =
                                                await UsersGroup
                                                    .checkReferralCall
                                                    .call(
                                              phoneNumber: _model
                                                  .normalReferralController
                                                  .text,
                                            );
                                            shouldSetState = true;
                                            if ((_model
                                                    .checkreferral?.succeeded ??
                                                true)) {
                                              _model.checkinvide =
                                                  await UsersGroup
                                                      .checkReferralCall
                                                      .call(
                                                phoneNumber: _model
                                                    .normalInviteController
                                                    .text,
                                              );
                                              shouldSetState = true;
                                              if ((_model
                                                      .checkinvide?.succeeded ??
                                                  true)) {
                                                if (Navigator.of(context)
                                                    .canPop()) {
                                                  context.pop();
                                                }
                                                context.pushNamed(
                                                  'AdminAccountPayment',
                                                  queryParameters: {
                                                    'name': serializeParam(
                                                      _model
                                                          .normalFullNameController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'referral': serializeParam(
                                                      _model
                                                          .normalReferralController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'password': serializeParam(
                                                      _model
                                                          .normalPasswordController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'sectorID': serializeParam(
                                                      _model.selectSectorID,
                                                      ParamType.int,
                                                    ),
                                                    'isMember': serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'profile': serializeParam(
                                                      _model.uploadedFileUrl1 ==
                                                                  ''
                                                          ? 'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png'
                                                          : _model
                                                              .uploadedFileUrl1,
                                                      ParamType.String,
                                                    ),
                                                    'phoneNumber':
                                                        serializeParam(
                                                      _model
                                                          .normalPhoneNumberController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'inviteID': serializeParam(
                                                      _model
                                                          .normalInviteController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );

                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Invide ID Unregisted!'),
                                                      content: const Text(
                                                          'You can\'t use this Invide ID try another.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Referral ID Unregisted!'),
                                                    content: const Text(
                                                        'You can\'t use this Referral ID try another.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Phone number ready exist!'),
                                                  content: const Text(
                                                      'Please try another.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title:
                                                    const Text('Some fild is emty!'),
                                                content: const Text(
                                                    'Please complete all the fild!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (shouldSetState) setState(() {});
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: 230.0,
                                        height: 52.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var shouldSetState = false;
                                      if ((_model.normalFullNameController.text != '') &&
                                          (_model.normalPasswordController
                                                      .text !=
                                                  '') &&
                                          (_model.normalPhoneNumberController
                                                      .text !=
                                                  '') &&
                                          (_model.normalReferralController
                                                      .text !=
                                                  '') &&
                                          (_model.normalInviteController
                                                      .text !=
                                                  '')) {
                                        _model.checkphonenumberNew =
                                            await UsersGroup
                                                .checkPhoneNumberCall
                                                .call(
                                          phoneNumber: _model
                                              .normalPhoneNumberController.text,
                                        );
                                        shouldSetState = true;
                                        if ((_model.checkphonenumberNew
                                                ?.succeeded ??
                                            true)) {
                                          _model.checkreferralNew =
                                              await UsersGroup.checkReferralCall
                                                  .call(
                                            phoneNumber: _model
                                                .normalReferralController.text,
                                          );
                                          shouldSetState = true;
                                          if ((_model.checkreferralNew
                                                  ?.succeeded ??
                                              true)) {
                                            _model.checkinvideNew =
                                                await UsersGroup
                                                    .checkReferralCall
                                                    .call(
                                              phoneNumber: _model
                                                  .normalInviteController.text,
                                            );
                                            shouldSetState = true;
                                            if ((_model.checkinvideNew
                                                    ?.succeeded ??
                                                true)) {
                                              await UsersTable().insert({
                                                'PhoneNumber': _model
                                                    .normalPhoneNumberController
                                                    .text,
                                                'Password': _model
                                                    .normalPasswordController
                                                    .text,
                                                'Balance': 0.0,
                                                'SectorID':
                                                    _model.selectSectorID,
                                                'Profile': _model.uploadedFileUrl1 ==
                                                            ''
                                                    ? 'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png'
                                                    : _model.uploadedFileUrl1,
                                                'FullName': _model
                                                    .normalFullNameController
                                                    .text,
                                                'UserReferral': _model
                                                    .normalReferralController
                                                    .text,
                                                'IsMember': false,
                                                'Invite': _model
                                                    .normalInviteController
                                                    .text,
                                                'CreatedBy': FFAppState()
                                                    .UserInfo
                                                    .userID,
                                              });
                                              context.safePop();
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Invide ID Unregisted!'),
                                                    content: const Text(
                                                        'You can\'t use this Invide ID try another.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Referral ID Unregisted!'),
                                                  content: const Text(
                                                      'You can\'t use this Referral ID try another.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Phone number ready exist!'),
                                                content:
                                                    const Text('Please try another.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Some fild is emty!'),
                                              content: const Text(
                                                  'Please complete all the fild!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (shouldSetState) setState(() {});
                                    },
                                    text: 'Create',
                                    options: FFButtonOptions(
                                      width: 230.0,
                                      height: 52.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ),
                    KeepAliveWidgetWrapper(
                      builder: (context) => Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  storageFolderPath: 'Users',
                                  maxWidth: 1080.00,
                                  maxHeight: 1080.00,
                                  allowPhoto: true,
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
                                      _model.uploadedLocalFile2 =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl2 =
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
                              },
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    _model.uploadedFileUrl2,
                                    'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              _model.isLodaingCompleted
                                  ? 'ID: ${GetMaxPhoneNumberCall.value(
                                      (_model.maxPhoneNumber?.jsonBody ?? ''),
                                    )}'
                                  : 'ID: Loading...',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: TextFormField(
                                  controller: _model.memberFullNameController,
                                  focusNode: _model.memberFullNameFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Full Name',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .memberFullNameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: TextFormField(
                                  controller: _model.memberPasswordController,
                                  focusNode: _model.memberPasswordFocusNode,
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: !_model.memberPasswordVisibility,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Password',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => _model.memberPasswordVisibility =
                                            !_model.memberPasswordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.memberPasswordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0xFF757575),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .memberPasswordControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('^[^\\s]*\$'))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: TextFormField(
                                  controller: _model.memberReferrController,
                                  focusNode: _model.memberReferrFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Referral ID',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.number,
                                  validator: _model
                                      .memberReferrControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('^[^\\s]*\$'))
                                  ],
                                ),
                              ),
                            ),
                            FutureBuilder<List<SectorsRow>>(
                              future: SectorsTable().queryRows(
                                queryFn: (q) => q,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<SectorsRow> memberSectorSectorsRowList =
                                    snapshot.data!;
                                return FlutterFlowDropDown<String>(
                                  controller:
                                      _model.memberSectorValueController ??=
                                          FormFieldController<String>(
                                    _model.memberSectorValue ??=
                                        memberSectorSectorsRowList
                                            .where((e) =>
                                                e.sectorID ==
                                                _model.selectSectorID)
                                            .toList()
                                            .first
                                            .sectorName,
                                  ),
                                  options: memberSectorSectorsRowList
                                      .map((e) => valueOrDefault<String>(
                                            e.sectorName,
                                            'null',
                                          ))
                                      .toList(),
                                  onChanged: (val) async {
                                    setState(
                                        () => _model.memberSectorValue = val);
                                    setState(() {
                                      _model.selectSectorID =
                                          memberSectorSectorsRowList
                                              .where((e) =>
                                                  e.sectorName ==
                                                  _model.memberSectorValue)
                                              .toList()
                                              .first
                                              .sectorID;
                                    });
                                  },
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height: 40.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                      ),
                                  hintText: 'Please select sector',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 0.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  borderWidth: 1.0,
                                  borderRadius: 30.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              decoration: const BoxDecoration(),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var shouldSetState = false;
                                    if ((_model.memberFullNameController
                                                    .text !=
                                                '') &&
                                        (_model.memberReferrController
                                                    .text !=
                                                '') &&
                                        (_model.memberPasswordController
                                                    .text !=
                                                '')) {
                                      _model.apiResultbep = await UsersGroup
                                          .checkReferralCall
                                          .call(
                                        phoneNumber:
                                            _model.memberReferrController.text,
                                      );
                                      shouldSetState = true;
                                      if ((_model.apiResultbep?.succeeded ??
                                          true)) {
                                        _model.createUser =
                                            await UsersTable().insert({
                                          'PhoneNumber': getJsonField(
                                            (_model.maxPhoneNumber?.jsonBody ??
                                                ''),
                                            r'''$''',
                                          ).toString(),
                                          'Password': _model
                                              .memberPasswordController.text,
                                          'IsApprove': true,
                                          'Balance': 0.0,
                                          'SectorID': _model.selectSectorID,
                                          'Profile': _model.uploadedFileUrl2 == ''
                                              ? 'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png'
                                              : _model.uploadedFileUrl2,
                                          'FullName': _model
                                              .memberFullNameController.text,
                                          'UserReferral': _model
                                              .memberReferrController.text,
                                          'IsMember': true,
                                          'Invite': _model
                                              .memberReferrController.text,
                                          'CreatedBy':
                                              FFAppState().UserInfo.userID,
                                        });
                                        shouldSetState = true;
                                        unawaited(
                                          () async {
                                            await AllowToReferralsTable()
                                                .insert({
                                              'UserPhoneNumber': _model
                                                  .createUser?.phoneNumber,
                                            });
                                          }(),
                                        );
                                        context.safePop();
                                        if (shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Referral ID Unregisted!'),
                                              content: const Text(
                                                  'You can\'t use this referral try another.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Some fild is emty!'),
                                            content: const Text(
                                                'Please complete all the fild!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (shouldSetState) setState(() {});
                                  },
                                  text: 'Create',
                                  options: FFButtonOptions(
                                    width: 230.0,
                                    height: 52.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
