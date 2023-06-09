import 'package:flutter/material.dart';
import 'pokemon.dart';

/* This is a kind of evolution (pun intended) of the
   pokemon class. It receives, as a parameter, the 
   beggining of the evolution line and the length
   of it. It then builds a row with the pokemons! */


class EvolutionLine extends StatelessWidget {
	const EvolutionLine(this.beggining, this.length);

	final int beggining;
	final int length;

	@override
	Widget build(BuildContext context) {

		List<Pokemon> pokemons = [];
		for(int i = beggining; i < beggining + length; i++){
			pokemons.add(Pokemon(i));	
		}


		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceEvenly,
			children: pokemons,
		);
	}
}
