import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail_screen.dart';
import 'pokemon_detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pokedex;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            )),
        Positioned(
            top: 100,
            left: 20,
            child: Text(
              "Pokedex",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
        Positioned(
          top: 150,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              pokedex != null
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.4,
                        ),
                        itemCount: pokedex.length,
                        itemBuilder: (context, index) {
                          var type = pokedex[index]['type'][0];
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: type == 'Grass'
                                      ? Colors.greenAccent
                                      : type == "Fire"
                                          ? Colors.redAccent
                                          : type == "Water"
                                              ? Colors.blueAccent
                                              : type == "Electric"
                                                  ? Colors.yellow
                                                  : type == "Rock"
                                                      ? Colors.grey
                                                      : type == "Ground"
                                                          ? Colors.brown
                                                          : type == "Psychic"
                                                              ? Colors.indigo
                                                              : type ==
                                                                      "Fighting"
                                                                  ? Colors
                                                                      .orange
                                                                  : type ==
                                                                          "Bug"
                                                                      ? Colors
                                                                          .lightGreenAccent
                                                                      : type ==
                                                                              "Ghost"
                                                                          ? Colors
                                                                              .deepPurple
                                                                          : type == "Normal"
                                                                              ? Colors.grey
                                                                              : type == "Poison"
                                                                                  ? Colors.deepPurpleAccent
                                                                                  : Colors.pink,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Stack(children: [
                                  Positioned(
                                    bottom: -10,
                                    right: 10,
                                    child: Image.asset(
                                      'images/pokeball.png',
                                      height: 100,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: Hero(
                                      tag: index,
                                      child: CachedNetworkImage(
                                          imageUrl: pokedex[index]['img'],
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                          placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )),
                                    ),
                                  ),
                                  Positioned(
                                      top: 20,
                                      left: 10,
                                      child: Text(
                                        pokedex[index]['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white),
                                      )),
                                  Positioned(
                                    top: 45,
                                    left: 20,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                            top: 4.0,
                                            bottom: 4.0),
                                        child: Text(
                                          type.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),

                                ]),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PokemonDetailScreen(pokemonDetail: pokedex[index],
                                          color: type == 'Grass'
                                      ? Colors.greenAccent
                                      : type == "Fire"
                                          ? Colors.redAccent
                                          : type == "Water"
                                              ? Colors.blueAccent
                                              : type == "Electric"
                                                  ? Colors.yellow
                                                  : type == "Rock"
                                                      ? Colors.grey
                                                      : type == "Ground"
                                                          ? Colors.brown
                                                          : type == "Psychic"
                                                              ? Colors.indigo
                                                              : type ==
                                                                      "Fighting"
                                                                  ? Colors
                                                                      .orange
                                                                  : type ==
                                                                          "Bug"
                                                                      ? Colors
                                                                          .lightGreenAccent
                                                                      : type ==
                                                                              "Ghost"
                                                                          ? Colors
                                                                              .deepPurple
                                                                          : type == "Normal"
                                                                              ? Colors.black26
                                                                              : type == "Poison"
                                                                                  ? Colors.deepPurpleAccent
                                                                                  : Colors.pink, heroTag: index,
                                                                                  )));
                            },
                          );
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ),
      ]),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];
        setState(() {
          print(pokedex[0]['name']);
        });
      }
    });
  }
}
