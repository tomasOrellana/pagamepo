import 'package:hive_flutter/hive_flutter.dart';

part 'document.g.dart';

@HiveType(typeId: 0)
class Document extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final List<String> members;
  Document({required this.name, required this.members});
}
