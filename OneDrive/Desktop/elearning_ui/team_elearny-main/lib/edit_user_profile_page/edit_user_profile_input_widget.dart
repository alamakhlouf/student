import 'package:flutter/material.dart';
import '../flutter_utils/ff_theme.dart';
import '../flutter_utils/internationalization.dart';
import 'edit_user_profile_page_model.dart';

class EditUserProfileInputWidget extends StatefulWidget {
  final model;

  final validator;

  final text;

  final enabled;

  final initialValue;

  final maxLines;

  final onChanged;

  final obscureText;

  const EditUserProfileInputWidget(
      {Key? key,
      required this.initialValue,
      required this.model,
      required this.validator,
      required this.text,
      required this.enabled,
      required this.onChanged,
      required this.obscureText,
      this.maxLines = null})
      : super(key: key);

  @override
  State<EditUserProfileInputWidget> createState() =>
      _EditUserProfileInputWidgetState();
}

class _EditUserProfileInputWidgetState
    extends State<EditUserProfileInputWidget> {
  late var _model;

  late var _validator;

  late var _text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = widget.model;
    _validator = widget.validator;
    _text = widget.text;
    _model.text = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
      child: widget.obscureText
          ? TextFormField(
              enabled: widget.enabled,
              controller: _model,
              onChanged: widget.onChanged,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                labelText: FFLocalizations.of(context).getText(
                  _text /* Your Name */,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: FFTheme.of(context).secondaryBackground,
                  width: 1.0,
                )),
                labelStyle: FFTheme.of(context).bodyText2,
                hintStyle: FFTheme.of(context).bodyText2,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FFTheme.of(context).primaryBackground,
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
                fillColor: FFTheme.of(context).secondaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
              ),
              style: FFTheme.of(context).bodyText1,
              validator: _validator)
          : TextFormField(
              enabled: widget.enabled,
              controller: _model,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                labelText: FFLocalizations.of(context).getText(
                  _text /* Your Name */,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: FFTheme.of(context).secondaryBackground,
                  width: 1.0,
                )),
                labelStyle: FFTheme.of(context).bodyText2,
                hintStyle: FFTheme.of(context).bodyText2,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FFTheme.of(context).primaryBackground,
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
                fillColor: FFTheme.of(context).secondaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
              ),
              style: FFTheme.of(context).bodyText1,
              maxLines: widget.maxLines,
              validator: _validator),
    );
  }
}
