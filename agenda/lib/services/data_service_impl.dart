import 'package:agenda/models/contact_model.dart';
import 'package:agenda/repositories/data_repository.dart';
import 'package:agenda/services/data_service.dart';

class DataServiceImpl implements DataService {
  DataRepository _dataRepository;

  DataServiceImpl({required DataRepository dataRepository})
      : this._dataRepository = dataRepository;

  @override
  Future<List<ContactModel>> getContatos() => _dataRepository.getContatos();

  @override
  Future<bool> saveContato(ContactModel contato) =>
      _dataRepository.saveContato(contato);

  @override
  Future<ContactModel?> getContatoById(String id) =>
      _dataRepository.getContatoById(id);

  @override
  Future<bool> editContato(ContactModel contato) =>
      _dataRepository.editContato(contato);
}
