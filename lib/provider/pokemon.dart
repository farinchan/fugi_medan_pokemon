import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fugi_gathering2/models/detail_pokemon_model.dart';
import 'package:fugi_gathering2/models/list_pokemon_model.dart';
import 'package:http/http.dart' as http;

class Pokemon extends ChangeNotifier {
  bool isLoadingList = false;
  bool isLoadingDetail = false;
  ListPokemon? listPokemon;
  DetailPokemon? detailPokemon;

  Future<void> list() async {
    isLoadingList = true;
    notifyListeners();

    var response =
        await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/"));
    listPokemon = ListPokemon.fromJson(json.decode(response.body));

    isLoadingList = false;
    notifyListeners();
  }

  Future<void> detail(String url) async {
    isLoadingDetail = true;
    notifyListeners();

    var response = await http.get(Uri.parse(url));
    detailPokemon = DetailPokemon.fromJson(json.decode(response.body));

    isLoadingDetail = false;
    notifyListeners();
    print(detailPokemon);
  }
}
