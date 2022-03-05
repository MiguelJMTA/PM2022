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
}
