import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokeImageAndBall({Key? key, required this.pokemonModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            width: UIHelper.calculatePokeImageandBallSize(),
            height: UIHelper.calculatePokeImageandBallSize(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemonModel.id!,
            child: CachedNetworkImage(
              imageUrl: pokemonModel.img ?? '',
              width: UIHelper.calculatePokeImageandBallSize(),
              height: UIHelper.calculatePokeImageandBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
    {}
  }
}
