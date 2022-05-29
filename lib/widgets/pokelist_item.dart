import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/widgets/poke_img_and_ball.dart';

import '../model/pokemon_model.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PageDetail(pokemonModel: pokemon),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(
          pokemon.type![0],
        ),
        child: Column(
          children: [
            Text(pokemon.name ?? 'NA'),
            Chip(label: Text(pokemon.type![0])),
            Expanded(child: PokeImageAndBall(pokemonModel: pokemon)),
          ],
        ),
      ),
    );
  }
}
