import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_account_model.dart';
export 'edit_account_model.dart';

class EditAccountWidget extends StatefulWidget {
  const EditAccountWidget({
    Key? key,
    required this.userID,
  }) : super(key: key);

  final int? userID;

  @override
  _EditAccountWidgetState createState() => _EditAccountWidgetState();
}

class _EditAccountWidgetState extends State<EditAccountWidget> {
  late EditAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditAccountModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldFocusNode3 ??= FocusNode();
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

    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'UserID',
          widget.userID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRow> editAccountUsersRowList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final editAccountUsersRow = editAccountUsersRowList.isNotEmpty
            ? editAccountUsersRowList.first
            : null;
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
                  'Edit Account',
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                          setState(() => _model.isDataUploading = true);
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
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl = downloadUrls.first;
                            });
                            showUploadMessage(context, 'Success!');
                          } else {
                            setState(() {});
                            showUploadMessage(context, 'Failed to upload data');
                            return;
                          }
                        }

                        setState(() {});
                      },
                      child: Container(
                        width: 120.0,
                        height: 120.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: _model.uploadedFileUrl == null ||
                                  _model.uploadedFileUrl == ''
                              ? editAccountUsersRow!.profile
                              : _model.uploadedFileUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _model.textController1 ??=
                          TextEditingController(
                        text: editAccountUsersRow?.fullName,
                      ),
                      focusNode: _model.textFieldFocusNode1,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'User name',
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryText,
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
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator:
                          _model.textController1Validator.asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.textController2 ??=
                          TextEditingController(
                        text: editAccountUsersRow?.phoneNumber,
                      ),
                      focusNode: _model.textFieldFocusNode2,
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
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator:
                          _model.textController2Validator.asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.textController3 ??=
                          TextEditingController(
                        text: editAccountUsersRow?.userReferral,
                      ),
                      focusNode: _model.textFieldFocusNode3,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Invite ID',
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryText,
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
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator:
                          _model.textController3Validator.asValidator(context),
                    ),
                    if (editAccountUsersRow?.sectorID != null)
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
                          List<SectorsRow> dropDownSectorsRowList =
                              snapshot.data!;
                          return FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController ??=
                                FormFieldController<String>(
                              _model.dropDownValue ??=
                                  editAccountUsersRow?.sectorID != null
                                      ? dropDownSectorsRowList
                                          .where((e) =>
                                              e.sectorID ==
                                              editAccountUsersRow?.sectorID)
                                          .toList()
                                          .first
                                          .sectorName
                                      : 'វិស័យកសិកម្ម ជលផល និងបរិស្ថាន',
                            ),
                            options: dropDownSectorsRowList
                                .map((e) => valueOrDefault<String>(
                                      e.sectorName,
                                      'null',
                                    ))
                                .toList(),
                            onChanged: (val) async {
                              setState(() => _model.dropDownValue = val);
                              setState(() {
                                _model.sectorID = valueOrDefault<int>(
                                  editAccountUsersRow?.sectorID,
                                  1,
                                );
                              });
                            },
                            width: double.infinity,
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
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    if (false)
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            editAccountUsersRow!.paymentImage!,
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Are you sure?'),
                                      content: Text(
                                          'Are you sure you want to delete the account?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Confirm'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await CompaniesTable().update(
                                data: {
                                  'IsActive': false,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'UserID',
                                  editAccountUsersRow?.userID,
                                ),
                              );
                              await UsersTable().update(
                                data: {
                                  'IsActive': false,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'PhoneNumber',
                                  editAccountUsersRow?.phoneNumber,
                                ),
                              );
                              if (FFAppState().UserInfo.isAdmin) {
                                await CompaniesTable().update(
                                  data: {
                                    'IsActive': false,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'UserID',
                                    editAccountUsersRow?.userID,
                                  ),
                                );
                                await UsersTable().update(
                                  data: {
                                    'IsActive': false,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'PhoneNumber',
                                    editAccountUsersRow?.phoneNumber,
                                  ),
                                );
                                context.safePop();
                                return;
                              } else {
                                await CompaniesTable().update(
                                  data: {
                                    'IsActive': false,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'UserID',
                                    editAccountUsersRow?.userID,
                                  ),
                                );
                                await UsersTable().update(
                                  data: {
                                    'IsActive': false,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'PhoneNumber',
                                    editAccountUsersRow?.phoneNumber,
                                  ),
                                );
                                FFAppState().update(() {
                                  FFAppState().deleteUserInfo();
                                  FFAppState().UserInfo = UserInfoStruct();

                                  FFAppState().IsLogged = false;
                                });
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.safePop();
                                return;
                              }
                            } else {
                              return;
                            }
                          },
                          text: 'Delete',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).error,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                        FFButtonWidget(
                          onPressed: () async {
                            _model.updatedUser = await UsersTable().update(
                              data: {
                                'PhoneNumber': _model.textController2.text,
                                'SectorID': _model.sectorID == null
                                    ? editAccountUsersRow?.sectorID
                                    : _model.sectorID,
                                'FullName': _model.textController1.text,
                                'Profile': _model.uploadedFileUrl == null ||
                                        _model.uploadedFileUrl == ''
                                    ? editAccountUsersRow?.profile
                                    : _model.uploadedFileUrl,
                              },
                              matchingRows: (rows) => rows.eq(
                                'UserID',
                                widget.userID,
                              ),
                              returnRows: true,
                            );
                            if (!FFAppState().UserInfo.isAdmin) {
                              setState(() {
                                FFAppState().updateUserInfoStruct(
                                  (e) => e
                                    ..fullName = _model.textController1.text
                                    ..phoneNumber = _model.textController2.text
                                    ..sectorID = _model.sectorID
                                    ..profile =
                                        _model.uploadedFileUrl == null ||
                                                _model.uploadedFileUrl == ''
                                            ? editAccountUsersRow?.profile
                                            : _model.uploadedFileUrl,
                                );
                              });
                            }
                            context.safePop();

                            setState(() {});
                          },
                          text: 'Update',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                      ],
                    ),
                  ].divide(SizedBox(height: 15.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
