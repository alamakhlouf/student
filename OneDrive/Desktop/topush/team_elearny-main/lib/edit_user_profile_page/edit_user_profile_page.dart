import 'package:firebase_storage/firebase_storage.dart';
import 'package:team_elearny/edit_user_profile_page/data/UserModel.dart';
import 'package:dob_input_field/dob_input_field.dart';
import '/flutter_utils/ff_icon_button.dart';
import '/flutter_utils/ff_theme.dart';
import '/flutter_utils/ff_util.dart';
import '/flutter_utils/ff_widgets.dart';
import '/flutter_utils/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bloc/input_bloc/input_bloc.dart';
import 'edit_user_profile_page_model.dart';
import 'edit_user_profile_input_widget.dart';
export 'edit_user_profile_page_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_page_button_widget.dart';
import 'data/Edit_User_Profile_Repo.dart';

class EditUserProfilePage extends StatefulWidget {
  const EditUserProfilePage({Key? key}) : super(key: key);

  @override
  _EditUserProfilePageState createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  late EditUserProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late var image = null;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditUserProfilePageModel());
    _model.yourNameController ??= TextEditingController();
    _model.emailAddressController ??= TextEditingController();
    _model.myBioController ??= TextEditingController();
    _model.phoneNumberController ??= TextEditingController();
    _model.addressController ??= TextEditingController();
    _model.companyController ??= TextEditingController();
    _model.lastNameController ??= TextEditingController();
    _model.birthDateController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FFTheme.of(context).secondaryBackground,
      appBar: responsiveVisibility(
        context: context,
        desktop: true,
      )
          ? PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: AppBar(
                backgroundColor: FFTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: FFIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: FFTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 0.0, 10.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'edit_profile_text' /* Edit Profile */,
                                ),
                                style: FFTheme.of(context).title2.override(
                                      fontFamily:
                                          FFTheme.of(context).title2Family,
                                      color: FFTheme.of(context).primaryText,
                                      fontSize: 22.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FFTheme.of(context).title2Family),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
            )
          : null,
      body: SingleChildScrollView(
          child: SafeArea(
        child: BlocProvider(
          create: (_) => InputBloc(),
          child: BlocListener<InputBloc, InputState>(
            listener: (context, state) {
              if (!state.loadingData) {
                _model.birthDateController.text = userModel.birth_date;
              }
              // TODO: implement listener
            },
            child: BlocBuilder<InputBloc, InputState>(
              builder: (context, state) {
                state.loadingData
                    ? BlocProvider.of<InputBloc>(context).add(LoadingData())
                    : null;

                return !state.loadingData
                    ? Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFDBE2E7),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 2.0, 2.0, 2.0),
                                  child: Container(
                                    width: 90.0,
                                    height: 90.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: mounted
                                        ? Image(
                                            image: state.image,
                                            fit: BoxFit.fitWidth,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isMediaUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                ))
                                            .toList();
                                      } finally {
                                        _model.isMediaUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'change_photo_text' /* Change Photo */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FFTheme.of(context).primaryBackground,
                                    textStyle: FFTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color:
                                              FFTheme.of(context).primaryColor,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(FFTheme.of(context)
                                                  .bodyText1Family),
                                        ),
                                    elevation: 1.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //FirstName
                          EditUserProfileInputWidget(
                              initialValue: userModel.firstname,
                              model: _model.yourNameController,
                              validator: _model.yourNameControllerValidator
                                  .asValidator(context),
                              text: 'your_name_text',
                              enabled: state.isEnabled,
                              onChanged: (value) => userModel.firstname = value,
                              obscureText: false),
                          //LastName
                          EditUserProfileInputWidget(
                              initialValue: userModel.lastname,
                              model: _model.lastNameController,
                              validator: _model.lastNameControllerValidator
                                  .asValidator(context),
                              text: 'lastname_text',
                              enabled: state.isEnabled,
                              onChanged: (value) => userModel.lastname = value,
                              obscureText: false),
                          //Email
                          EditUserProfileInputWidget(
                              initialValue: userModel.email,
                              model: _model.emailAddressController,
                              validator: _model.emailAddressControllerValidator
                                  .asValidator(context),
                              text: 'email_address_text',
                              enabled: state.isEnabled,
                              onChanged: (value) => userModel.email = value,
                              obscureText: false),
                          //Phone
                          EditUserProfileInputWidget(
                              initialValue: userModel.phone_number,
                              model: _model.phoneNumberController,
                              validator: _model.phoneNumberControllerValidator
                                  .asValidator(context),
                              text: 'phone_text',
                              enabled: state.isEnabled,
                              onChanged: (value) =>
                                  userModel.phone_number = value,
                              obscureText: false),
                          //Address
                          EditUserProfileInputWidget(
                              initialValue: userModel.address,
                              model: _model.addressController,
                              validator: _model.addressControllerValidator
                                  .asValidator(context),
                              text: 'address_text',
                              enabled: state.isEnabled,
                              onChanged: (value) => userModel.address = value,
                              obscureText: false),
                          //Company
                          EditUserProfileInputWidget(
                              initialValue: userModel.company,
                              model: _model.companyController,
                              validator: _model.companyControllerValidator
                                  .asValidator(context),
                              text: 'company_text',
                              enabled: state.isEnabled,
                              onChanged: (value) => userModel.company = value,
                              obscureText: false),
                          //Bio
                          EditUserProfileInputWidget(
                              initialValue: userModel.bio,
                              model: _model.myBioController,
                              validator: _model.myBioControllerValidator
                                  .asValidator(context),
                              text: 'your_bio_text',
                              enabled: state.isEnabled,
                              maxLines: 3,
                              onChanged: (value) => userModel.bio = value,
                              obscureText: false),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 16.0),
                            //Date Of Birth
                            child: TextFormField(
                                onTap: () async {
                                  //  DateTime now = new DateTime.now();
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now());

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    userModel.birth_date = formattedDate;
                                    _model.birthDateController.text = formattedDate;
                                  }
                                },
                                enabled: state.isEnabled,
                                readOnly: true,
                                controller: _model.birthDateController,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    "BirthDate" /* Your Name */,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color:
                                        FFTheme.of(context).secondaryBackground,
                                    width: 1.0,
                                  )),
                                  labelStyle: FFTheme.of(context).bodyText2,
                                  hintStyle: FFTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FFTheme.of(context).primaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FFTheme.of(context).secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 0.0, 24.0),
                                ),
                                style: FFTheme.of(context).bodyText1,
                                validator: _model.birthDateControllerValidator
                                    .asValidator(context)),
                          ),

                          Align(
                            alignment: AlignmentDirectional(0.0, 0.05),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: !state.isEnabled
                                  ? EditUserProfileButtonWidget(
                                      onPressed: () =>
                                          BlocProvider.of<InputBloc>(context)
                                              .add(EnableInputsEvent()),
                                      text: 'edit_text')
                                  : Align(
                                      alignment:
                                          AlignmentDirectional(0.0, 0.05),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: Column(
                                          children: [
                                            EditUserProfileButtonWidget(
                                                onPressed: () {
                                                  BlocProvider.of<InputBloc>(
                                                          context)
                                                      .add(SavingData());
                                                },
                                                text: 'save_changes_text'),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            EditUserProfileButtonWidget(
                                                onPressed: () => BlocProvider
                                                        .of<InputBloc>(context)
                                                    .add(DisableInputsEvent()),
                                                text: 'cancel_changes_text'),
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                          strokeWidth: 5.0,
                        ),
                      );
              },
            ),
          ),
        ),
      )),
    );
  }

  void getImage() async {}
}
