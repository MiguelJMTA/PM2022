import 'package:flutter/material.dart';
import 'package:flutter_interfaz/models/popular_model.dart';
import 'package:flutter_interfaz/network/api_popular.dart';
import 'package:flutter_interfaz/views/card_popular.dart';

class PopularScreen extends StatefulWidget {
  PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  ApiPopular? apiPopular;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: FutureBuilder(
        builder: (BuildContext context,
            AsyncSnapshot<List<PopularModel>?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return _listPopularMovies(snapshot.data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
        future: apiPopular!.getAllPopular(),
      ),
    );
  }

  Widget _listPopularMovies(List<PopularModel>? movies) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            PopularModel popular = movies![index];
            return CardPopularView(popularModel: popular,);
          },
          separatorBuilder: (_, __) => Divider(
                height: 10,
              ),
          itemCount: movies!.length),
    );
  }
}
