class PasswordChangeModel{

 late String oldPassword , newPassword , confirmPassword ;

 PasswordChangeModel( {required this.oldPassword,required this.newPassword,required this.confirmPassword});
}

PasswordChangeModel passwordChangeModel = PasswordChangeModel(oldPassword: "", newPassword: "",
    confirmPassword: "") ;