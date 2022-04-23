class GamesDAO {
  String? gameID;
  String? steamAppID;
  String? cheapest;
  String? cheapestDealID;
  String? external;
  String? thumb;

  GamesDAO(
      {this.gameID,
      this.steamAppID,
      this.cheapest,
      this.cheapestDealID,
      this.external,
      this.thumb});

  GamesDAO.fromJson(Map<String, dynamic> json) {
    gameID = json['gameID'];
    steamAppID = json['steamAppID'];
    cheapest = json['cheapest'];
    cheapestDealID = json['cheapestDealID'];
    external = json['external'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gameID'] = this.gameID;
    data['steamAppID'] = this.steamAppID;
    data['cheapest'] = this.cheapest;
    data['cheapestDealID'] = this.cheapestDealID;
    data['external'] = this.external;
    data['thumb'] = this.thumb;
    return data;
  }
}
