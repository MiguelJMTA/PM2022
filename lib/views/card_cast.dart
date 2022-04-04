import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_interfaz/models/cast_model.dart';
import 'package:flutter_interfaz/models/popular_model.dart';
import 'package:flutter_interfaz/network/api_popular.dart';

class CastCard extends StatefulWidget {
  var id;

  CastCard({Key? key, required this.id}) : super(key: key);

  @override
  State<CastCard> createState() => _CastCardState();
}

class _CastCardState extends State<CastCard> {
  ApiPopular? apiPopular;
  void initState() {
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        builder:
            (BuildContext context, AsyncSnapshot<List<CastModel>?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return _listCast(snapshot.data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
        future: apiPopular!.getCast(widget.id),
      ),
    );
  }

  Widget _listCast(List<CastModel>? casts) {
    return Expanded(
      child: Container(
        height: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    CastModel cast = casts![index];
                    return Container(
                      height: 200,
                      width: 150,
                      child: Card(
                        elevation: 1,
                        margin: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage((() {
                                    if (cast.profile_path!.isEmpty) {
                                      return "";
                                    } else {
                                      return "https://image.tmdb.org/t/p/w500/" +
                                          cast.profile_path.toString();
                                    }
                                  }())),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Text(cast.character.toString()),
                                Padding(padding: EdgeInsets.all(10)),
                                Text(cast.name.toString()),
                              ]),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: casts!.length),
            ),
          ],
        ),
      ),
    );
  }
}
