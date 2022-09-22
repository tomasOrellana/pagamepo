import 'package:hive_flutter/hive_flutter.dart';
import 'package:oepaga/models/index.dart';

class HiveData {
  const HiveData();

  Future<int> saveDocument(Document document) async {
    final Box<Document> box = await Hive.openBox<Document>('documents');
    return box.add(document);
  }

  Future<List<Document>> get documents async {
    final Box<Document> box = await Hive.openBox<Document>('documents');
    return box.values.toList();
  }
}
