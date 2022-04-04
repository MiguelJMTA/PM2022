class MovieDAO {
  int? id;
  String? title;

  MovieDAO({this.id, this.title});
  factory MovieDAO.fromMap(Map<String, dynamic> movieMap) {
    return MovieDAO(
        id: movieMap['id'],
        title: movieMap['title']);
  }
  Map<String,dynamic> toMap(){
    return {
      "id":this.id,
      "title":this.title,
    };
  }
}
