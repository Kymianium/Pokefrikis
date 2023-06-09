import 'package:flutter/material.dart';
import '../globals.dart' as globals;



/* This will be the pokemon card constructor. It receives an integer 
   as a parameter, which determines the pokedex number. If the number
   is not valid, a default image will be shown instead.  */ 

class Pokemon extends StatefulWidget {
	const Pokemon(this.number);


	final int number; // As commented before, this is the pokedex number.

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  @override
	Widget build(BuildContext context) {
    int number = widget.number;
		String nameDisplayed;
		if (globals.cards[number-1] == 0){
			nameDisplayed = "???";
		}
		else if (globals.cards[number-1] == 1){
			nameDisplayed = globals.names[number-1];
		}
		else {
			nameDisplayed = "${globals.names[number-1]}  x${globals.cards[number-1]}";
		}
		return Column(children:[
			Text(nameDisplayed),
			// The gesture dectector is here so you can tap on the card to get a better view.
			GestureDetector(
				// The good, pretty on tap gesture
				onTap: () async {
					await showDialog(
						context: context,
						builder: (_) => cardPicture(number),
					);
          setState(() {});
          // We need to rebuild the album if the coins change
          // TODO 
				},
				//The following line means that, if you don't own the card, you can't see the card :)// Image tapped
			child:
			Image.asset(globals.cards[number-1]!= 0 ? 'lib/resources/gen_1/${number.toString()}.png' : 'lib/resources/misc/background.png',
				width: 80, height: 160),
		),

		]);
	}
}


class cardPicture extends StatelessWidget {
	const cardPicture(this.number);
	final int number;

	@override
	Widget build(BuildContext context) {
		return Dialog(
      backgroundColor: Colors.transparent,
			child: Container(
				width: 200,
				height: 500,
				child: 
				Column(
					// Okay so I know this lines are kind of chaotic but basically they show the appropiate info depending on the number of copys
					// of the card that the user owns.
					children: [
						Image.asset(globals.cards[number-1]!= 0 ? 'lib/resources/gen_1/${number.toString()}.png' : 'lib/resources/misc/background.png'),
						globals.cards[number-1]> 1 ? Column(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: [
								ElevatedButton(
                  onPressed: (){
                    globals.cards[number-1]--;
                    globals.coins+=2;
                    Navigator.pop(context);
                  },	
									child: Text("Vender carta (2 monedas)")
								),
								ElevatedButton(
									onPressed: (){},	
									child: Text("Dar carta a...")
								)
							]
						) : Text("Se desbloquearán más opciones cuando tengas más copias de la carta."),
					],
				)
	    )
		);
	}
}
