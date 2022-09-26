import 'package:oepaga/models/index.dart';

class Bill {
  final String id;
  final String name;
  final List<Member> members;
  Bill({required this.id, required this.name, required this.members});
}
