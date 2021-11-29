import 'package:agenda/models/contact_model.dart';

abstract class DataRepository {
  Future<List<ContactModel>> getContatos();
  Future<ContactModel?> getContatoById(String id);
  Future<bool> saveContato(ContactModel contato);
  String generateUuid();
  Future<bool> editContato(ContactModel contato);
}
