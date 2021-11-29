import 'package:agenda/models/contact_model.dart';

abstract class DataService {
  Future<List<ContactModel>> getContatos();
  Future<ContactModel?> getContatoById(String id);
  Future<bool> saveContato(ContactModel contato);
}
