import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokeTypeName({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pokemonModel.name ?? '',
              style: TextStyle(
                fontSize: UIHelper.getPokeFontSize(),
              ),
            ),
            Text(
              '#${pokemonModel.num}',
              style: TextStyle(
                fontSize: UIHelper.getPokeFontSize(),
              ),
            ),
          ],
        ),
        Chip(
          label: Text(pokemonModel.type?.join(' , ') ?? ''),
        ),
      ],
    );
  }
}
