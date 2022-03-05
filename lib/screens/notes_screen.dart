import 'package:flutter/material.dart';
import 'package:flutter_interfaz/database/database_notes.dart';

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
      appBar: AppBar(title: Text('Notas'),),
     // body: FutureBuilder(
      //  future: dbNotes.getAllNotes(),
       // builder: (BuildContext context, AsyncSnapshot<List<NotesDAO>> snapshot>){
         // return Text('XXXXX');
        //},
     // ),
    );
  }
}