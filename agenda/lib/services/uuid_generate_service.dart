import 'package:uuid/uuid.dart';

class UuidGenerateService {
  String generateUuid() {
    Uuid uuid = new Uuid();

    String newId = uuid.v4();

    return newId;
  }
}
