class User {
  final String uid;
  final String email;
  final String password;
  final String name;
  final int hours;
  final String id;

  final bool emailVerified;
  // Add other properties as needed

  User(
      {required this.uid,
      required this.email,
      required this.emailVerified,
      required this.name,
      required this.id,
      required this.hours,
      required this.password

      // Add other properties as needed
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      emailVerified: json['emailVerified'] ?? false,
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      hours: json['hours'] ?? 0,
      password: json['password'] ?? '',

      // Map other properties accordingly
    );
  }
}

class Album {
  final String message;
  final User user;

  Album({required this.message, required this.user});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      message: json['message'] ?? '',
      user: User.fromJson(json['response'] ?? {}),
    );
  }
}

class regAlbum {
  final String message;

  final String error;

  regAlbum({
    required this.message,
    required this.error,
  });

  factory regAlbum.fromJson(Map<String, dynamic> json) {
    return regAlbum(
      message: json['message'] ?? '',
      error: json['error'].toString(),
    );
  }
}

// class loginAlbum {
//   final String message;
//   final String name;
//   final String id;

//   loginAlbum({required this.message, required this.name, required this.id});

//   factory loginAlbum.fromJson(Map<String, dynamic> json) {
//     return loginAlbum(
//       message: json['message'] ?? '',
//       name: json['name'] ?? '',
//       id: json['id'] ?? '',
//     );
//   }
// }



// email: test@reddam.house, password: admin12345, name: admin,
// grade: , house: , hours: 0,