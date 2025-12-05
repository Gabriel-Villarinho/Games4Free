import 'dart:convert';

import 'package:freetogame_gabriel/Model/jogoModel.dart';
import 'package:http/http.dart' as http;

class Service {
  final String baseUrl = "https://www.freetogame.com/api";

  Future<List<Jogo>> getAllGames() async {
    final response = await http.get(Uri.parse("https://corsproxy.io/?$baseUrl/games"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data as List).map((json) => Jogo.fromJson(json)).toList();
    } else {
      return List.empty();
    }
  }

  Future<Jogo> getGame(int id) async {
    final response = await http.get(Uri.parse("https://corsproxy.io/?https://www.freetogame.com/api/game?id=$id"));
    return Jogo.fromJson(json.decode(response.body));
  }

}
