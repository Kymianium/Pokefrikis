import 'models/pokedex.dart';
import 'globals.dart' as globals;
import 'package:flutter/material.dart';
import 'opening.dart';

class Album extends StatefulWidget {
  const Album({super.key});

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  @override
Widget build(BuildContext context) {
    // We need to get the screen size in order to resize the screen.
    globals.width = MediaQuery.of(context).size.width;
    globals.height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Money

          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Álbum de ${globals.username} \t\t " + globals.coins.toString()),
                Image.asset('lib/resources/misc/coin.png', height: 15, width: 10)
              ]
            )
          ),


          // Pokemons
          Container(
            height: globals.height*0.8,
            width: globals.width,
            child: const Pokedex()
          ),

          ],
        ),
      ),

          // Buying button

          floatingActionButton: SizedBox(
            width: 120,
            height: 40,
            child: FloatingActionButton(onPressed: () {
              if (globals.coins >= 70){
                globals.coins -= 70;
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Opening()));
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No tienes suficientes monedas")));
              }
           },
            backgroundColor: Colors.blue,
            shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(15.0))
                   ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("70 "),
                Image.asset('lib/resources/misc/coin.png', height: 10, width: 10),
                Text(" - x10 "),
                Image.asset('lib/resources/misc/background.png', height: 30, width: 15),
              ],
            )
          ),

       )
    );
  }
}
