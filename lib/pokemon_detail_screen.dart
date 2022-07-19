import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen(
      {Key? key,
      required this.pokemonDetail,
      required this.color,
      required this.heroTag})
      : super(key: key);

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 40,
                  color: Colors.white,
                )),
          ),
          Positioned(
              top: 80,
              left: 20,
              child: Text(
                widget.pokemonDetail['name'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
          Positioned(
            top: 140,
            left: 20,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.pokemonDetail['type'].join(', '),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.black26,
              ),
            ),
          ),
          Positioned(
              top: height * 0.10,
              right: 20,
              child: Image.asset(
                'images/pokeball.png',
                height: 200,
                fit: BoxFit.fitHeight,
              )),
          Positioned(
            bottom: 0,
            child: Container(
              height: height * 0.6,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18,
                                  ),
                                )),
                            Container(
                              width: width * 0.3,
                              child: Text(
                                widget.pokemonDetail['name'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  "Height",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18,
                                  ),
                                )),
                            Container(
                              width: width * 0.3,
                              child: Text(
                                widget.pokemonDetail['height'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  "Weight",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18,
                                  ),
                                )),
                            Container(
                              width: width * 0.3,
                              child: Text(
                                widget.pokemonDetail['weight'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  "Spawn Time",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18,
                                  ),
                                )),
                            Container(
                              width: width * 0.3,
                              child: Text(
                                widget.pokemonDetail['spawn_time'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  "Weakness",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18,
                                  ),
                                )),
                            Container(
                              child: Text(
                                widget.pokemonDetail['weaknesses'].join(', '),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  "Spawn Time",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18,
                                  ),
                                )),
                            Container(
                              width: width * 0.3,
                              child: Text(
                                widget.pokemonDetail['spawn_time'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  "Weakness",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18,
                                  ),
                                )),
                            Container(
                              child: Text(
                                widget.pokemonDetail['weaknesses'].join(', '),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Pre Evolution',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                              child:
                                  widget.pokemonDetail['prev_evolution'] != null
                                      ? SizedBox(
                                          height: 20,
                                          width: width * 0.55,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: widget
                                                .pokemonDetail['prev_evolution']
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  widget.pokemonDetail[
                                                          'prev_evolution']
                                                      [index]['name'],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : Text(
                                          "Just Hatched",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Next Evolution',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                              child:
                                  widget.pokemonDetail['next_evolution'] != null
                                      ? SizedBox(
                                          height: 20,
                                          width: width * 0.55,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: widget
                                                .pokemonDetail['next_evolution']
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Text(
                                                  widget.pokemonDetail[
                                                          'next_evolution']
                                                      [index]['name'],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : Text(
                                          "Maxed Out",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: height * 0.18,
            left: (width / 2) - 100,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                  imageUrl: widget.pokemonDetail['img'],
                  height: 200,
                  fit: BoxFit.fitHeight),
            ),
          )
        ],
      ),
    );
  }
}
