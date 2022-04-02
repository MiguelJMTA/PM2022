import 'package:flutter/material.dart';
import 'package:flutter_interfaz/models/popular_model.dart';

class CardPopularView extends StatelessWidget {
  CardPopularView({Key? key, this.popularModel}) : super(key: key);
  PopularModel? popularModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black, offset: Offset(0, 5.0), blurRadius: 2.5),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              child: FadeInImage(
                fadeInDuration: Duration(milliseconds: 500),
                placeholder: AssetImage('images/activity_indicator.gif'),
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${popularModel!.backdropPath}'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(61, 0, 0, 0),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    popularModel!.title!,
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/movies_detail',
                            arguments: {'title': popularModel!.title});
                      },
                      icon: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
