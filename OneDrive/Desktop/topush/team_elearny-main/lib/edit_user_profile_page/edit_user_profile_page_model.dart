
import 'package:firebase_storage/firebase_storage.dart';

import '/flutter_utils/ff_util.dart';
import 'package:flutter/material.dart';


class EditUserProfilePageModel extends FFModel {
  ///  State fields for stateful widgets in this page.

  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for myBio widget.
  TextEditingController? myBioController;
  String? Function(BuildContext, String?)? myBioControllerValidator;

  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;

  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;

  TextEditingController? companyController;
  String? Function(BuildContext, String?)? companyControllerValidator;

  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;

  TextEditingController? birthDateController;
  String? Function(BuildContext, String?)? birthDateControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    yourNameController?.dispose();
    emailAddressController?.dispose();
    myBioController?.dispose();
  }




  /// Additional helper methods are added here.

}
