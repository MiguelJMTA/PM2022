import 'package:flutter/material.dart';
import 'package:flutter_interfaz/database/database_movies.dart';
import 'package:flutter_interfaz/database/database_notes.dart';
import 'package:flutter_interfaz/models/movies_model.dart';
import 'package:flutter_interfaz/models/notes_model.dart';
import 'package:flutter_interfaz/screens/add_note_screen.dart';

class MovieFavoriteScreen extends StatefulWidget {
  MovieFavoriteScreen({Key? key}) : super(key: key);

  @override
  State<MovieFavoriteScreen> createState() => _MovieFavoriteScreenState();
}

class _MovieFavoriteScreenState extends State<MovieFavoriteScreen> {
  late DatabaseMovies databaseMovies;
  @override
  void initState() {
    super.initState();
    databaseMovies = DatabaseMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
      ),
      body: FutureBuilder(
        future: databaseMovies.getAll(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MovieDAO>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Ocurrió un error al ejecutar"));
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return _listMovies(snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }

  Widget _listMovies(List<MovieDAO> movie) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(movie[index].title!),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              databaseMovies.delete(movie[index].id!).then((value) {
                if (value == 1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Borrado correctamente")));
                  setState(() {});
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Error")));
                }
              });
            },
          ),
        );
      },
      itemCount: movie.length,
    );
  }
}
