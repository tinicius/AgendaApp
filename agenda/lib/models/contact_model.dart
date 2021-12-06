class ContactModel {
  final String name;
  final String phoneNumber;
  String profilePhotoUrl;

  String? id;

  ContactModel(
      {required this.profilePhotoUrl,
      required this.name,
      required this.phoneNumber,
      this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'profilePhotoUrl': profilePhotoUrl
    };
  }

  @override
  String toString() {
    return 'Contato{id: $id, name: $name}';
  }
}
