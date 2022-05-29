import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokeInformation({Key? key, required this.pokemonModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.w),
          ),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildInformationRow('Name', pokemonModel.name),
          _buildInformationRow('Height', pokemonModel.height),
          _buildInformationRow('Weight', pokemonModel.weight),
          _buildInformationRow('Spawn Time', pokemonModel.spawnTime),
          _buildInformationRow('Weakness', pokemonModel.weaknesses),
          _buildInformationRow('Pre Evolution', pokemonModel.prevEvolution),
          _buildInformationRow('Next Evolution', pokemonModel.nextEvolution),
        ],
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          if (value is List && value.isNotEmpty)
            Text(
              value.join(' , '),
              style: const TextStyle(color: Colors.black),
            )
          else if (value == null)
            const Text(
              'Nat available',
              style: TextStyle(color: Colors.black),
            )
          else
            Text(
              value,
              style: const TextStyle(color: Colors.black),
            )
        ],
      ),
    );
  }
}
