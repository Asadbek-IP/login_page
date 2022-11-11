class User {
  String? email;
  String? password;

  User({required this.email, required this.password});

  factory User.fromJson(Map json) {
    return User(email: json['email'], password: json['password']);
  }

  Map toJson(){
    return {
     'email' : email,
     "password" :  password
    };
  }
}
