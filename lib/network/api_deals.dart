import 'dart:convert';

import 'package:flutter_interfaz/models/deals_model.dart';
import 'package:flutter_interfaz/models/games_model.dart';
import 'package:flutter_interfaz/models/stores_model.dart';
import 'package:http/http.dart' as http;

class ApiDeals {
  var URLDEALS = Uri.parse('https://www.cheapshark.com/api/1.0/deals');

  Future<List<DealDAO>?> getAllDeals() async {
    var response = await http.get(URLDEALS);
    if (response.statusCode == 200) {
      var deals = jsonDecode(response.body) as List;
      return deals.map((deal) => DealDAO.fromJson(deal)).toList();
    } else {
      return null;
    }
  }

  var URLGAMES = Uri.parse('https://www.cheapshark.com/api/1.0/deals');
  Future<List<GamesDAO>?> getAllGames() async {
    var response = await http.get(URLGAMES);
    if (response.statusCode == 200) {
      var games = jsonDecode(response.body) as List;
      return games.map((games) => GamesDAO.fromJson(games)).toList();
    } else {
      return null;
    }
  }

  var URLSTORES = Uri.parse('https://www.cheapshark.com/api/1.0/stores');
  Future<List<StoresDAO>?> getStores() async {
    var response = await http.get(URLSTORES);
    if (response.statusCode == 200) {
      var stores = jsonDecode(response.body) as List;
      return stores.map((stores) => StoresDAO.fromJson(stores)).toList();
    } else {
      return null;
    }
  }
}
