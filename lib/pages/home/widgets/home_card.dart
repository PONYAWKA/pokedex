import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/core.dart';
import 'package:pokedex/pages/details/view/details_page.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Flexible(
                child: Hero(
                    tag: '${pokemon.name}',
                    child: CachedNetworkImage(
                      imageUrl: pokemon.getImageUrl,
                      fit: BoxFit.fitHeight,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                        color: Colors.greenAccent,
                      )),
                    ))),
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
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsPage(pokemon: pokemon))),
    );
  }
}
