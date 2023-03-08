
import 'package:firebase_storage/firebase_storage.dart';

import '/flutter_utils/ff_util.dart';
import 'package:flutter/material.dart';


class ChangePasswordPageModel extends FFModel {
  ///  State fields for stateful widgets in this page.

  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for yourName widget.
  TextEditingController? oldPasswordController;
  String? Function(BuildContext, String?)? oldPasswordControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? newPasswordController;
  String? Function(BuildContext, String?)? newPasswordControllerValidator;
  // State field(s) for myBio widget.
  TextEditingController? confirmPasswordController;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;



  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    oldPasswordController?.dispose();
    newPasswordController?.dispose();
    confirmPasswordController?.dispose();
  }




  /// Additional helper methods are added here.

}
