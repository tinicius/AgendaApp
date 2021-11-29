class ContactModel {
  final String name;
  final String phoneNumber;
  final String profilePhotoUrl;

  String? id;

  ContactModel({
    required this.profilePhotoUrl,
    required this.name,
    required this.phoneNumber,
  });
}
