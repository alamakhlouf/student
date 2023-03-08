import 'package:flutter/material.dart';
import '../flutter_utils/ff_theme.dart';
import '../flutter_utils/internationalization.dart';
import '/flutter_utils/ff_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class EditUserProfileButtonWidget extends StatefulWidget {
  final onPressed;
  final text ;

  const EditUserProfileButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  State<EditUserProfileButtonWidget> createState() => _EditUserProfileButtonWidgetState();
}

class _EditUserProfileButtonWidgetState extends State<EditUserProfileButtonWidget> {
  late var _onPressed ;
  late var _text ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _onPressed = widget.onPressed ;
    _text  = widget.text ;

  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
    onPressed: _onPressed,
    text: FFLocalizations.of(context).getText(
      _text /* Save Changes */,
    ),
    options: FFButtonOptions(
    width: 340.0,
    height: 60.0,
    padding:
    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
    iconPadding:
    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
    color: FFTheme.of(context).primaryColor,
    textStyle: FFTheme.of(context).subtitle2.override(
fontFamily: 'Lexend Deca',
color: Colors.white,
fontSize: 16.0,
fontWeight: FontWeight.normal,
useGoogleFonts: GoogleFonts.asMap().containsKey(
FFTheme.of(context).subtitle2Family),
),
elevation: 2.0,
borderSide: BorderSide(
color: Colors.transparent,
width: 1.0,
),
),
)   ;
  }
}
