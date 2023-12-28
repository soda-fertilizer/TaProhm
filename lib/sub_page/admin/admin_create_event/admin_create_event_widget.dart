import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_create_event_model.dart';
export 'admin_create_event_model.dart';

class AdminCreateEventWidget extends StatefulWidget {
  const AdminCreateEventWidget({Key? key}) : super(key: key);

  @override
  _AdminCreateEventWidgetState createState() => _AdminCreateEventWidgetState();
}

class _AdminCreateEventWidgetState extends State<AdminCreateEventWidget> {
  late AdminCreateEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminCreateEventModel());

    _model.titleController ??= TextEditingController();
    _model.titleFocusNode ??= FocusNode();

    _model.detailsController ??= TextEditingController();
    _model.detailsFocusNode ??= FocusNode();
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
          title: Text(
            'Create Event',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: TextFormField(
                      controller: _model.titleController,
                      focusNode: _model.titleFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Title',
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
                          _model.titleControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.detailsController,
                        focusNode: _model.detailsFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Details',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        maxLines: null,
                        validator: _model.detailsControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 39.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9ECEE),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Add image',
                          style: FlutterFlowTheme.of(context).bodyMedium,
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
                                setState(() {
                                  _model.uploadImage = null;
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
                                // Upload1
                                final selectedMedia = await selectMedia(
                                  storageFolderPath: 'Users',
                                  maxWidth: 1080.00,
                                  maxHeight: 1080.00,
                                  mediaSource: MediaSource.photoGallery,
                                  multiImage: false,
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

                                setState(() {
                                  _model.uploadImage = _model.uploadedFileUrl1;
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
                                  storageFolderPath: 'Users',
                                  maxWidth: 1080.00,
                                  maxHeight: 1080.00,
                                  multiImage: false,
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

                                setState(() {
                                  _model.uploadImage = _model.uploadedFileUrl2;
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
                ),
                if (_model.uploadImage != null && _model.uploadImage != '')
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 500),
                      fadeOutDuration: Duration(milliseconds: 500),
                      imageUrl: _model.uploadImage!,
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                FFButtonWidget(
                  onPressed: () async {
                    await EventsTable().insert({
                      'Title': _model.titleController.text,
                      'Details': _model.detailsController.text,
                      'Image': _model.uploadImage,
                    });
                    context.safePop();
                  },
                  text: 'Create',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(SizedBox(height: 15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
