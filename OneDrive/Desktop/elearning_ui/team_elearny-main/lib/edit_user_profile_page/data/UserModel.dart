class UserModel {
  late  String firstname , lastname  , email , address,phone_number, profile_picture,
      bio,company,role,user_id,birth_date, password ;

  UserModel({ required this.user_id, required this.firstname, required this.lastname,
    required this.email, required this.address, required this.phone_number, required this.profile_picture,
    required this.bio, required this.company, required this.role, required this.birth_date,
  required this.password}) ;

  toJson() {
    return {
      "user_id" : user_id,
      "first_name" : firstname,
      "last_name" : lastname,
      "email" : email,
      "password" : password,
      "address" : address,
      "phone_number": phone_number,
      "profile_picture": profile_picture,
      "bio" : bio,
      "company" : company,
      "role" : role,
      "birth_date" : birth_date
    } ;
  }


}
UserModel userModel = UserModel(user_id: "user_id", firstname: " ", lastname: " ", password : "",
    email: " ", address: " ",
    phone_number: " ", profile_picture: " ", bio: " ", company: " " , role: " ", birth_date: " ") ;