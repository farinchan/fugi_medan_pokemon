// To parse this JSON data, do
//
//     final listPokemon = listPokemonFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListPokemon? listPokemonFromJson(String str) => ListPokemon.fromJson(json.decode(str));

String listPokemonToJson(ListPokemon? data) => json.encode(data!.toJson());

class ListPokemon {
    ListPokemon({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    final int? count;
    final String? next;
    final dynamic previous;
    final List<Result?>? results;

    factory ListPokemon.fromJson(Map<String, dynamic> json) => ListPokemon(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<Result?>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x!.toJson())),
    };
}

class Result {
    Result({
        required this.name,
        required this.url,
    });

    final String? name;
    final String? url;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
