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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'create_user_for_officer_model.dart';
export 'create_user_for_officer_model.dart';

class CreateUserForOfficerWidget extends StatefulWidget {
  const CreateUserForOfficerWidget({
    super.key,
    this.selectedID,
  });

  final String? selectedID;

  @override
  State<CreateUserForOfficerWidget> createState() =>
      _CreateUserForOfficerWidgetState();
}

class _CreateUserForOfficerWidgetState
    extends State<CreateUserForOfficerWidget> {
  late CreateUserForOfficerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateUserForOfficerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.maxPhoneNumber = await GetMaxPhoneNumberCall.call();

      if ((_model.maxPhoneNumber?.succeeded ?? true)) {
        _model.isLodaingCompleted = true;
        safeSetState(() {});
        return;
      } else {
        await action_blocks.noInternet(context);
        return;
      }
    });

    _model.normalFullNameTextController ??= TextEditingController();
    _model.normalFullNameFocusNode ??= FocusNode();

    _model.normalPasswordTextController ??= TextEditingController();
    _model.normalPasswordFocusNode ??= FocusNode();

    _model.normalPhoneNumberTextController ??= TextEditingController();
    _model.normalPhoneNumberFocusNode ??= FocusNode();

    _model.normalReferralTextController ??=
        TextEditingController(text: widget.selectedID);
    _model.normalReferralFocusNode ??= FocusNode();

    _model.normalInviteTextController ??=
        TextEditingController(text: widget.selectedID);
    _model.normalInviteFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'CreateUserForOfficer',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
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
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() => _model.isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
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
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl = downloadUrls.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              safeSetState(() {});
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
                              _model.uploadedFileUrl,
                              'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: TextFormField(
                            controller: _model.normalFullNameTextController,
                            focusNode: _model.normalFullNameFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Full Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model
                                .normalFullNameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: TextFormField(
                            controller: _model.normalPasswordTextController,
                            focusNode: _model.normalPasswordFocusNode,
                            autofocus: false,
                            textCapitalization: TextCapitalization.none,
                            obscureText: !_model.normalPasswordVisibility,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Password',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              suffixIcon: InkWell(
                                onTap: () => safeSetState(
                                  () => _model.normalPasswordVisibility =
                                      !_model.normalPasswordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.normalPasswordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: const Color(0xFF757575),
                                  size: 24.0,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model
                                .normalPasswordTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('^[^\\s]*\$'))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: TextFormField(
                            controller: _model.normalPhoneNumberTextController,
                            focusNode: _model.normalPhoneNumberFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Phone',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model
                                .normalPhoneNumberTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('^[^\\s]*\$'))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: TextFormField(
                            controller: _model.normalReferralTextController,
                            focusNode: _model.normalReferralFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Referral ID',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model
                                .normalReferralTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('^[^\\s]*\$'))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: TextFormField(
                            controller: _model.normalInviteTextController,
                            focusNode: _model.normalInviteFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Invite ID',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model
                                .normalInviteTextControllerValidator
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<SectorsRow> normalSectorSectorsRowList =
                              snapshot.data!;

                          return FlutterFlowDropDown<String>(
                            controller: _model.normalSectorValueController ??=
                                FormFieldController<String>(
                              _model.normalSectorValue ??=
                                  normalSectorSectorsRowList
                                      .where((e) =>
                                          e.sectorID == _model.selectSectorID)
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
                              safeSetState(
                                  () => _model.normalSectorValue = val);
                              _model.selectSectorID = normalSectorSectorsRowList
                                  .where((e) =>
                                      e.sectorName == _model.normalSectorValue)
                                  .toList()
                                  .first
                                  .sectorID;
                              safeSetState(() {});
                            },
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Please select sector',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 0.0,
                            borderColor:
                                FlutterFlowTheme.of(context).secondaryText,
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
                                if ((_model.normalFullNameTextController.text != '') &&
                                    (_model.normalPasswordTextController
                                                .text !=
                                            '') &&
                                    (_model.normalPhoneNumberTextController
                                                .text !=
                                            '') &&
                                    (_model.normalReferralTextController
                                                .text !=
                                            '') &&
                                    (_model.normalInviteTextController
                                                .text !=
                                            '')) {
                                  _model.checkphonenumber = await UsersGroup
                                      .checkPhoneNumberCall
                                      .call(
                                    phoneNumber: _model
                                        .normalPhoneNumberTextController.text,
                                  );

                                  shouldSetState = true;
                                  if ((_model.checkphonenumber?.succeeded ??
                                      true)) {
                                    _model.checkreferral =
                                        await UsersGroup.checkReferralCall.call(
                                      phoneNumber: _model
                                          .normalReferralTextController.text,
                                    );

                                    shouldSetState = true;
                                    if ((_model.checkreferral?.succeeded ??
                                        true)) {
                                      _model.checkinvide = await UsersGroup
                                          .checkReferralCall
                                          .call(
                                        phoneNumber: _model
                                            .normalInviteTextController.text,
                                      );

                                      shouldSetState = true;
                                      if ((_model.checkinvide?.succeeded ??
                                          true)) {
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                          'AdminAccountPayment',
                                          queryParameters: {
                                            'name': serializeParam(
                                              _model
                                                  .normalFullNameTextController
                                                  .text,
                                              ParamType.String,
                                            ),
                                            'referral': serializeParam(
                                              _model
                                                  .normalReferralTextController
                                                  .text,
                                              ParamType.String,
                                            ),
                                            'password': serializeParam(
                                              _model
                                                  .normalPasswordTextController
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
                                              _model.uploadedFileUrl ==
                                                          ''
                                                  ? 'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png'
                                                  : _model.uploadedFileUrl,
                                              ParamType.String,
                                            ),
                                            'phoneNumber': serializeParam(
                                              _model
                                                  .normalPhoneNumberTextController
                                                  .text,
                                              ParamType.String,
                                            ),
                                            'inviteID': serializeParam(
                                              _model.normalInviteTextController
                                                  .text,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );

                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Invide ID Unregisted!'),
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
                                          safeSetState(() {});
                                        }
                                        return;
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title:
                                                const Text('Referral ID Unregisted!'),
                                            content: const Text(
                                                'You can\'t use this Referral ID try another.'),
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
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              const Text('Phone number ready exist!'),
                                          content: const Text('Please try another.'),
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
                                    if (shouldSetState) safeSetState(() {});
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
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }

                                if (shouldSetState) safeSetState(() {});
                              },
                              text: 'Next',
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
                                      letterSpacing: 0.0,
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
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var shouldSetState = false;
                              if ((_model.normalFullNameTextController.text != '') &&
                                  (_model.normalPasswordTextController
                                              .text !=
                                          '') &&
                                  (_model.normalPhoneNumberTextController
                                              .text !=
                                          '') &&
                                  (_model.normalReferralTextController
                                              .text !=
                                          '') &&
                                  (_model.normalInviteTextController.text !=
                                          '')) {
                                _model.checkphonenumberNew =
                                    await UsersGroup.checkPhoneNumberCall.call(
                                  phoneNumber: _model
                                      .normalPhoneNumberTextController.text,
                                );

                                shouldSetState = true;
                                if ((_model.checkphonenumber?.succeeded ??
                                    true)) {
                                  _model.checkreferralNew =
                                      await UsersGroup.checkReferralCall.call(
                                    phoneNumber: _model
                                        .normalReferralTextController.text,
                                  );

                                  shouldSetState = true;
                                  if ((_model.checkreferral?.succeeded ??
                                      true)) {
                                    _model.checkinvideNew =
                                        await UsersGroup.checkReferralCall.call(
                                      phoneNumber: _model
                                          .normalInviteTextController.text,
                                    );

                                    shouldSetState = true;
                                    if ((_model.checkinvide?.succeeded ??
                                        true)) {
                                      await UsersTable().insert({
                                        'PhoneNumber': _model
                                            .normalPhoneNumberTextController
                                            .text,
                                        'Password': _model
                                            .normalPasswordTextController.text,
                                        'Balance': 0.0,
                                        'SectorID': _model.selectSectorID,
                                        'Profile': _model.uploadedFileUrl == ''
                                            ? 'https://kwlydfajqnlgqirgtgze.supabase.co/storage/v1/object/public/images/profile.png'
                                            : _model.uploadedFileUrl,
                                        'FullName': _model
                                            .normalFullNameTextController.text,
                                        'UserReferral': _model
                                            .normalReferralTextController.text,
                                        'IsMember': false,
                                        'Invite': _model
                                            .normalInviteTextController.text,
                                        'CreatedBy':
                                            FFAppState().UserInfo.userID,
                                      });
                                      context.safePop();
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title:
                                                const Text('Invide ID Unregisted!'),
                                            content: const Text(
                                                'You can\'t use this Invide ID try another.'),
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
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              const Text('Referral ID Unregisted!'),
                                          content: const Text(
                                              'You can\'t use this Referral ID try another.'),
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
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title:
                                            const Text('Phone number ready exist!'),
                                        content: const Text('Please try another.'),
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
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Some fild is emty!'),
                                      content:
                                          const Text('Please complete all the fild!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (shouldSetState) safeSetState(() {});
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
                                    letterSpacing: 0.0,
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
          ),
        ));
  }
}
