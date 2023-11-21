import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String tittle;
  @HiveField(1)
  String description;

  Note({required this.tittle, required this.description});
}

Box<Note>? notebox;

Future<void> initBox() async {
  notebox = await Hive.openBox("notesBox");
}
