import 'package:agenda/models/contact_model.dart';
import 'package:agenda/repositories/data_repository.dart';
import 'package:agenda/sqlite/sql_service.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class DataRepositoryImpl implements DataRepository {
  //List<ContactModel> contatos = [];
  SqlService _sqlService = Get.find<SqlService>();

  @override
  Future<List<ContactModel>> getContatos() async {
    //Carregar dados da agenda
    return _sqlService.contatos();

    //return this.contatos;
  }

  @override
  Future<ContactModel?> getContatoById(id) async {
    ContactModel resultContato;

    resultContato = await _sqlService.contatoById(id);

    return resultContato;
  }

  //TODO refatorar
  @override
  String generateUuid() {
    Uuid uuid = new Uuid();

    String newId = uuid.v4();

    return newId;
  }

  @override
  Future<void> editContato(ContactModel contato) async {
    _sqlService.updateContato(contato);
  }

  @override
  Future<bool> saveContato(ContactModel contato) async {
    List<ContactModel> allContacts = await _sqlService.contatos();

    allContacts.map((e) {
      if (e.phoneNumber == contato.phoneNumber) {
        throw Exception("Contato já existe");
      }
    });

    contato.id = generateUuid();
    print('contato = $contato');
    _sqlService.insertContato(contato);
    //contatos.add(contato);

    var data = await _sqlService.contatos();
    data.forEach((element) {
      print(element.toString());
    });

    return true;
  }

  @override
  Future<void> deleteContato(String id) async {
    _sqlService.deleteContato(id);
  }
}
