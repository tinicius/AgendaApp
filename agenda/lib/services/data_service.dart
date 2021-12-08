import 'package:agenda/models/contact_model.dart';

abstract class DataService {
  Future<List<ContactModel>> getContatos();
  Future<ContactModel> getContatoById(String id);
  Future<void> addContato(ContactModel contato);
  Future<void> editContato(ContactModel contato);
  Future<void> deleteContato(String id);
}
