class UserModel{
   String email = "";
   String uid = "";
   String? fullName = "";
   String? phone = "";
   String? photo = "";
   String? job_description = "";
   String? job_title = "";
   bool? fingerprint = false;

  UserModel(
      {required this.uid, required this.email, this.fullName, this.phone, this.job_description, this.job_title, this.photo,  this.fingerprint});

  factory UserModel.fromJson(Map<String, dynamic>? json){
         return UserModel(
           fingerprint : json?["fingerprint"],
           uid: json?["uid"], email: json?["email"],
           fullName:  json?["fullName"],
           job_description:  json?["job_description"],
           job_title:  json?["job_title"],
           phone:  json?["phone"],
           photo:  json?["photo"],);
   }

   Map<String , dynamic> toMap()
   { return {
   "email" : email,
   "uid" : uid,
   "fullName" : fullName,
   "phone" : phone,
   "photo" : photo,
   "job_description" : job_description,
   "job_title" : job_title,
     "fingerprint" : false
   };
}

}