import 'package:flutter/material.dart';
import 'package:flutter_interfaz/database/database_notes.dart';
import 'package:flutter_interfaz/models/notes_model.dart';

class AddNoteScreen extends StatefulWidget {
  NotesDAO? objNote;
  AddNoteScreen({Key? key, this.objNote}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  var txtTitleController = TextEditingController();
  var txtDescController = TextEditingController();

  late DatabaseNotes _dbNotes;
  @override
  void initState() {
    super.initState();
    if (widget.objNote != null) {
      txtTitleController.text == widget.objNote!.titulo!;
      txtDescController.text == widget.objNote!.dscNota!;
    }
    _dbNotes = DatabaseNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.objNote == null ? Text('Add Note') : Text("Edit Note"),
      ),
      body: ListView(
        children: [
          _createTextFieldTitle(),
          SizedBox(height: 3),
          _createTextFieldDesc(),
          SizedBox(height: 3),
          _createButtonSave(),
        ],
      ),
    );
  }

  Widget _createTextFieldTitle() {
    return TextField(
      controller: txtTitleController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  Widget _createTextFieldDesc() {
    return TextField(
      controller: txtDescController,
      keyboardType: TextInputType.text,
      maxLines: 8,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  Widget _createButtonSave() {
    return ElevatedButton(
      onPressed: () {
        if (widget.objNote == null) {
          NotesDAO objNote = NotesDAO(
            titulo: txtTitleController.text,
            dscNota: txtDescController.text,
          );
          _dbNotes.insert(objNote.toMap()).then((value) {
            if (value > 0) {
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Error")));
            }
          });
        } else {
          widget.objNote!.titulo == txtTitleController.text;
          widget.objNote!.dscNota == txtDescController.text;
          _dbNotes.update(widget.objNote!.toMap()).then((value) {
            if (value > 0) {
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Error")));
            }
          });
        }
      },
      child: Text('Save note'),
    );
  }
}
