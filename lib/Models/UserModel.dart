class userModel{
   String email = "";
   String uid = "";
   String? fullName = "";
   String? phone = "";
   String? photo = "";
   String? job_description = "";
   String? job_title = "";

  userModel(
      {required this.uid, required this.email, this.fullName, this.phone, this.job_description, this.job_title, this.photo});

  factory userModel.fromJson(Map<String , dynamic> json){
         return userModel(
           uid: json["users"]["uid"],
           email: json["users"]["uid"]["email"],
           fullName:  json["users"]["uid"]["fullName"],
           job_description:  json["users"]["uid"]["job_description"],
           job_title:  json["users"]["uid"]["job_title"],
           phone:  json["users"]["uid"]["phone"],
           photo:  json["users"]["uid"]["photo"],);
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
   };
}

}