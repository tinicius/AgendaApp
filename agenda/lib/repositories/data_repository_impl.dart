import 'package:agenda/models/contact_model.dart';
import 'package:agenda/repositories/data_repository.dart';
import 'package:uuid/uuid.dart';

class DataRepositoryImpl implements DataRepository {
  List<ContactModel> contatos = [
    ContactModel(
        profilePhotoUrl:
            'https://www.publicdomainpictures.net/pictures/130000/velka/royal-letter-a.jpg',
        name: 'João',
        phoneNumber: '(37) 123321-1221')
  ];

  @override
  Future<List<ContactModel>> getContatos() async {
    //Carregar dados da agenda
    return this.contatos;
  }

  @override
  Future<ContactModel?> getContatoById(id) async {
    try {
      var resultContato;

      contatos.forEach((ContactModel element) {
        if (element.id == id) {
          resultContato = element;
        }
      });

      return resultContato;
    } catch (e) {
      return null;
    }
  }

  @override
  String generateUuid() {
    Uuid uuid = new Uuid();

    String newId = uuid.v4();

    return newId;
  }

  @override
  Future<bool> editContato(ContactModel contato) async {
    //List<ContactModel> allContacts = await getContatos();

    return false;
  }

  @override
  Future<bool> saveContato(ContactModel contato) async {
    List<ContactModel> allContacts = await getContatos();

    allContacts.map((e) {
      if (e.phoneNumber == contato.phoneNumber) {
        throw Exception("Contato já existe");
      }
    });

    contato.id = generateUuid();

    contatos.add(contato);

    return true;
  }
}
