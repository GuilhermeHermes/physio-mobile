// client.dart

class Client {
  int id;
  String name;
  String email;
  String photoUrl; // Novo campo para a foto

  Client(
      {required this.id,
      required this.name,
      required this.email,
      required this.photoUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      photoUrl: map['photoUrl'],
    );
  }
}
