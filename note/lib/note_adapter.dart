import 'package:hive/hive.dart';
import 'package:note/note_list.dart';

class NoteAdapter extends TypeAdapter<Note> {
  @override
  Note read(BinaryReader reader) {
    final tittle = reader.readString();
    final description = reader.readString();
    return Note(tittle: tittle, description: description);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Note obj) {
    writer.writeString(obj.tittle);
    writer.writeString(obj.description);
  }
}
