class User {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;

  User({ required this.uid, required this.firstName, required this.lastName, required this.email });

  factory User.fromMap(Map data) {
    return User(
      uid: data['uid'] ?? 'defaultuid', 
      firstName: data['firstName'] ?? 'John', 
      lastName: data['lastName'] ?? 'Doe', 
      email: data['email'] ?? 'johndoe@gmail.com'
    );
  }
}
