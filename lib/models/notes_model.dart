class NotesDAO {
  int? idNota;
  String? titulo;
  String? dscNota;

  NotesDAO({this.idNota, this.titulo, this.dscNota});
  factory NotesDAO.fromMap(Map<String, dynamic> noteMap) {
    return NotesDAO(
        idNota: noteMap['idNota'],
        titulo: noteMap['titulo'],
        dscNota: noteMap['dscNota']);
  }
  Map<String,dynamic> toMap(){
    return {
      "idNota":this.idNota,
      "titulo":this.titulo,
      "dscNota":this.dscNota
    };
  }
}
