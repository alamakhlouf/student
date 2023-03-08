import 'package:firebase_storage/firebase_storage.dart';
import 'package:team_elearny/edit_user_profile_page/data/UserModel.dart';

import '../edit_user_profile_page/edit_page_button_widget.dart';
import '/flutter_utils/ff_icon_button.dart';
import '/flutter_utils/ff_theme.dart';
import '/flutter_utils/ff_util.dart';
import '/flutter_utils/ff_widgets.dart';
import '/flutter_utils/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Data/PasswordChangeModel.dart';
import 'bloc/password_bloc.dart';
import 'change_password_page_model.dart';
import '../edit_user_profile_page/edit_user_profile_input_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late ChangePasswordPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late var image;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePasswordPageModel());
    _model.oldPasswordController ??= TextEditingController();
    _model.newPasswordController ??= TextEditingController();
    _model.confirmPasswordController ??= TextEditingController();
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
                                  'change_password_text' /* Edit Profile */,
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
          create: (context) => PasswordBloc(),
          child: BlocListener<PasswordBloc, PasswordState>(
  listener: (context, state) {
    if (state.response != "") {
      showSnackBar(state.response) ;
      _model.confirmPasswordController.text = "" ;
    }
    if (state.changed) {
      _model.confirmPasswordController.text = "" ;
      _model.newPasswordController.text = "" ;
      _model.oldPasswordController.text = "" ;
    }
  },
  child: BlocBuilder<PasswordBloc, PasswordState>(
            builder: (context, state) {
              return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      EditUserProfileInputWidget(
                        initialValue: "",
                        model: _model.oldPasswordController,
                        validator: _model.oldPasswordControllerValidator
                            .asValidator(context),
                        text: 'old_password_text',
                        enabled: true,
                        onChanged: (value) =>
                            passwordChangeModel.oldPassword = value,
                        obscureText : true
                      ),
                      EditUserProfileInputWidget(
                          initialValue: "",
                          model: _model.newPasswordController,
                          validator: _model.newPasswordControllerValidator
                              .asValidator(context),
                          text: 'new_password_text',
                          enabled: true,
                          onChanged: (value) =>
                          passwordChangeModel.newPassword = value,
                          obscureText : true),
                      EditUserProfileInputWidget(
                          initialValue: "",
                          model: _model.confirmPasswordController,
                          validator: _model.confirmPasswordControllerValidator
                              .asValidator(context),
                          text: 'confirm_password_text',
                          enabled: true,
                          onChanged: (value) =>
                              passwordChangeModel.confirmPassword = value,
                          obscureText : true),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.05),
                        child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: EditUserProfileButtonWidget(
                                onPressed: () async {
                                  BlocProvider.of<PasswordBloc>(context)
                                      .add(ChangePassword());
                                },
                                text: 'change_password_text')),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ));
            },
          ),
),
        )),
      ),
    );
  }

  showSnackBar(String result) {
    SnackBar snackBar =   SnackBar(
      content:  Text(
        result,
        style:  const TextStyle(fontSize: 16, letterSpacing: 3, color: Colors.black ),
      ),
      backgroundColor: Colors.indigo,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar) ;
  }
}
