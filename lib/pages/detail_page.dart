import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widgets/poke_information.dart';

import '../widgets/poke_type_name.dart';

class PageDetail extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PageDetail({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, pokeballImageUrl)
        : _buildLanscapeBody(context, pokeballImageUrl);
  }

  Scaffold _buildPortraitBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemonModel.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          PokeTypeName(pokemonModel: pokemonModel),
          SizedBox(height: 20.r),
          Expanded(
            child: Stack(children: [
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  'images/pokeball.png',
                  height: 0.15.sh,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0.10.sh,
                child: PokeInformation(pokemonModel: pokemonModel),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: pokemonModel.id!,
                  child: CachedNetworkImage(
                    imageUrl: pokemonModel.img ?? '',
                    height: 0.25.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ]),
          )
        ],
      )),
    );
  }

  Scaffold _buildLanscapeBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemonModel.type![0]),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(0.10.sh),
            child: IconButton(
              iconSize: 18.w,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PokeTypeName(pokemonModel: pokemonModel),
                    Hero(
                        tag: pokemonModel.id!,
                        child: CachedNetworkImage(
                          imageUrl: pokemonModel.img ?? '',
                          height: 0.25.sw,
                          fit: BoxFit.fitHeight,
                        ))
                  ],
                ),
              ),
              Expanded(
                  flex: 3, child: PokeInformation(pokemonModel: pokemonModel))
            ],
          ))
        ]),
      ),
    );
  }
}
