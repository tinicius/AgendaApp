import 'package:agenda/models/contact_model.dart';
import 'package:agenda/services/data_service.dart';
import 'package:agenda/services/uuid_generate_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServiceImpl implements DataService {
  FirebaseFirestore? _firestore;

  UuidGenerateService uuidGenerateService = UuidGenerateService();

  Future<FirebaseFirestore?> get firestore async {
    if (_firestore != null) {
      return _firestore;
    } else {
      _firestore = await _init();
      return _firestore;
    }
  }

  Future<FirebaseFirestore> _init() async {
    return FirebaseFirestore.instance;
  }

  @override
  Future<void> addContato(ContactModel contato) async {
    CollectionReference contacts = (await firestore)!.collection("contacts");

    if (contato.id == null) {
      contato.id = uuidGenerateService.generateUuid();
    }

    await contacts.add({
      "id": contato.id,
      "name": contato.name,
      "phoneNumber": contato.phoneNumber,
      "profilePhotoUrl": contato.profilePhotoUrl,
    });
  }

  @override
  Future<void> deleteContato(String id) async {
    CollectionReference contacts = (await firestore)!.collection("contacts");

    //Buscando pelos contatos com o Id determinado
    QuerySnapshot contactsQuery =
        await contacts.where("id", isEqualTo: id).get();

    if (contactsQuery.docs.length > 1) {
      throw Exception("Erro; mais de um contato com o mesmo Id");
    }

    await contacts.doc(contactsQuery.docs.first.id).delete();
  }

  @override
  Future<void> editContato(ContactModel contato) async {
    CollectionReference contacts = (await firestore)!.collection("contacts");

    //Buscando pelos contatos com o Id determinado
    QuerySnapshot contactsQuery =
        await contacts.where("id", isEqualTo: contato.id).get();

    if (contactsQuery.docs.length > 1) {
      throw Exception("Erro; mais de um contato com o mesmo Id");
    }

    await contacts.doc(contactsQuery.docs.first.id).update({
      "id": contato.id,
      "name": contato.name,
      "phoneNumber": contato.phoneNumber,
      "profilePhotoUrl": contato.profilePhotoUrl
    });
  }

  @override
  Future<ContactModel> getContatoById(String id) async {
    CollectionReference contacts = (await firestore)!.collection("contacts");

    //Buscando pelos contatos com o Id determinado
    QuerySnapshot contactsQuery =
        await contacts.where("id", isEqualTo: id).get();

    if (contactsQuery.docs.length > 1) {
      throw Exception("Erro; mais de um contato com o mesmo Id");
    }

    Map<String, dynamic> data =
        await contactsQuery.docs.first.data() as Map<String, dynamic>;

    return ContactModel.fromJson(data);
  }

  @override
  Future<List<ContactModel>> getContatos() async {
    CollectionReference contactsData =
        (await firestore)!.collection("contacts");

    List<ContactModel> contacts = [];

    QuerySnapshot contactsQuery = await contactsData.get();

    for (var element in contactsQuery.docs) {
      Map<String, dynamic> data = await element.data() as Map<String, dynamic>;

      contacts.add(ContactModel.fromJson(data));
    }

    return contacts;
  }
}
