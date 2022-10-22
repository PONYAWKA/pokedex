import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/core.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Hero(
        tag: ValueKey(pokemon.name),
        child: InkWell(
          child: Column(
            children: [
              Flexible(
                  child: CachedNetworkImage(
                imageUrl: pokemon.getImageUrl,
                fit: BoxFit.fitHeight,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator(color: Colors.greenAccent,)),
              )),
              Text(
                '${pokemon.name?.capitalize()}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '#${pokemon.id}',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
