import 'package:pokedex/core/core.dart';

extension PokemonResponseExtantions on PokemonResponse{
  PokemonResponse append(PokemonResponse appending){
    return PokemonResponse(
    count: appending.count,
      next: appending.next,
      previous: appending.previous,
      results: [
        ...?this.results,
        ...?appending.results,
      ]
    );
  }
}