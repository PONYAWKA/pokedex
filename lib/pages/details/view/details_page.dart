import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pokedex/core/core.dart';
import 'package:pokedex/pages/details/provider/details_provider.dart';

class DetailsPage extends ConsumerWidget {
  DetailsPage({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context, ref) {
    final details = ref.watch(detailsProvider(pokemon.name!));

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(pokemon.name!.toUpperCase()),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        SliverToBoxAdapter(
          child: Hero(
              tag: "${pokemon.name}",
              child: CachedNetworkImage(imageUrl: pokemon.getImageUrl)),
        ),
        details.when(data: (data) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Wrap(alignment: WrapAlignment.spaceEvenly, children: [
                  const Text(
                    'Types:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: data.types!
                          .map((e) => Chip(
                                label: Text(
                                  e.type!.name!.toUpperCase(),
                                ),
                              ))
                          .toList()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 160,
                        child: Card(
                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          color: Colors.greenAccent,
                          child: Center(
                            child: Text(
                              'weight:\n${data.weight! / 10} Kg',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 160,
                        child: Card(
                          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          color: Colors.greenAccent,
                          child: Center(
                            child: Text(
                              'weight:\n${data.weight! / 10} Kg',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ])
              ]),
            ),
          );
        }, error: (err, _) {
          return SliverToBoxAdapter(
            child: Text(err.toString()),
          );
        }, loading: () {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator.adaptive()));
        })
      ],
    ));
  }
}
