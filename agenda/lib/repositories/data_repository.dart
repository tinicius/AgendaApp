import 'package:agenda/models/contact_model.dart';
import 'package:agenda/services/data_service.dart';
import 'package:agenda/services/firebase_service_impl.dart';

class DataRepository {
  //DataService _service = SqlService();
  DataService _service = FirebaseServiceImpl();

  Future<List<ContactModel>> getContatos() async {
    print("a");
    return _service.getContatos();
  }

  Future<ContactModel?> getContatoById(id) async {
    ContactModel resultContato = await _service.getContatoById(id);
    return resultContato;
  }

  Future<void> editContato(ContactModel contato) async {
    _service.editContato(contato);
  }

  Future<void> addContato(ContactModel contato) async {
    List<ContactModel> allContacts = await _service.getContatos();

    allContacts.map((e) {
      if (e.phoneNumber == contato.phoneNumber) {
        throw Exception("Contato já existe");
      }
    });

    _service.addContato(contato);
  }

  Future<void> deleteContato(String id) async {
    _service.deleteContato(id);
  }
}
