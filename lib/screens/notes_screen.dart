import 'package:flutter/material.dart';
import 'package:flutter_interfaz/database/database_notes.dart';
import 'package:flutter_interfaz/models/notes_model.dart';
import 'package:flutter_interfaz/screens/add_note_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  late DatabaseNotes dbNotes;
  @override
  void initState() {
    super.initState();
    dbNotes = DatabaseNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notas'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_note').whenComplete(() {
                  setState(() {});
                });
              },
              icon: Icon(Icons.note_add))
        ],
      ),
      body: FutureBuilder(
        future: dbNotes.getAllNotes(),
        builder:
            (BuildContext context, AsyncSnapshot<List<NotesDAO>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Ocurrió un error al ejecutar"));
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return _ListNotes(snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }

  Widget _ListNotes(List<NotesDAO> notes) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notes[index].titulo!),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddNoteScreen(objNote: notes[index])))
                        .whenComplete(() {
                      setState(() { });
                    });
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Mensaje de la APP"),
                            content: Text("Estás seguro del borrado"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    dbNotes
                                        .delete(notes[index].idNota!)
                                        .then((value) {
                                      if (value == 1) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Borrado correctamente")));
                                        setState(() {});
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text("Error")));
                                      }
                                    });
                                  },
                                  child: Text("Si")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("No")),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.delete)),
            ],
          ),
        );
      },
      itemCount: notes.length,
    );
  }
}
