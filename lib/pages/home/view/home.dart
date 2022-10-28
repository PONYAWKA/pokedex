import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/pages/home/provider/home_provider.dart';
import 'package:pokedex/pages/home/provider/home_state.dart';
import 'package:pokedex/pages/home/widgets/home_card.dart';

class Home extends ConsumerWidget {
  Home({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(context, ref) {
    var state = ref.watch(homeProvider);
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (state.status != HomeStatus.loadMore) {
          ref.read(homeProvider.notifier).getPokemonsList();
        }
      }
    });

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('lib/assets/images/Logo.png'),
            ),
            floating: true,
            backgroundColor: Colors.green,
          ),
          SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0),
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    HomeCard(pokemon: state.data.results![index]),
                childCount: state.data.results?.length ?? 0,
              )),
          SliverToBoxAdapter(
            child: Visibility(
              visible: state.errorMsg != '',
              child: Center(
                  child: Text(state.errorMsg,
                      style: const TextStyle(fontSize: 20))),
            ),
          ),
          SliverToBoxAdapter(
            child: Visibility(
              visible: state.status == HomeStatus.loadMore,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: state.status == HomeStatus.loadMore
            ? const CircularProgressIndicator(color: Colors.greenAccent)
            : const Icon(Icons.arrow_upward),
        onPressed: () {
          _scrollController.jumpTo(0);
        },
      ),
    );
  }
}
