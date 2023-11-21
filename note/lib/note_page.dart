import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/my_colors.dart';
import 'package:note/note_list.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: solidColors.scafoldBg,
        //floatbutton
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: MaterialButton(
          elevation: 10,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(24),
          )),
          color: solidColors.floatButton,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddNoteDialog(
                onAdd: (Note note) {
                  notebox?.add(note);
                  setState(() {});
                },
              ),
            );
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.add,
                color: solidColors.floatIcon,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "افزودن",
                style: TextStyle(
                  color: solidColors.floatText,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "یادداشت ها",
              style: TextStyle(
                color: solidColors.textTitle,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              
              child: ListView.builder(
                
                itemCount: notebox?.length?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: solidColors.noteListBg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                notebox?.getAt(index)?.tittle ?? "",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: solidColors.textTitle,
                                ),
                              ),
                            ),
                            const Icon(Icons.edit),
                            const SizedBox(
                              width: 2,
                            ),
                            GestureDetector(
                              onTap: () {
                                notebox?.deleteAt(index);
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.delete,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          notebox?.getAt(index)?.description ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: solidColors.secondryText,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

//dialog
class AddNoteDialog extends StatelessWidget {
  const AddNoteDialog({super.key, required this.onAdd});

  final Function(Note note) onAdd;

  @override
  Widget build(BuildContext context) {
    TextEditingController txtTittle = TextEditingController();
    TextEditingController txtdescription = TextEditingController();
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              " افزودن یادداشت",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: txtTittle,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  fillColor: const Color(0xfffbf2ff),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: txtdescription,
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfffbf2ff),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: MaterialButton(
                onPressed: () {
                  onAdd(Note(
                      tittle: txtTittle.text,
                      description: txtdescription.text));
                  Navigator.pop(context);
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                color: solidColors.floatButton,
                child: const Text(
                  "افزودن",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
