import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'network/network.dart' as network;
import 'album.dart';

// This is an auxiliary class to open packs.

class Opening extends StatefulWidget {
  const Opening({super.key});

  @override
  State<Opening> createState() => _OpeningState();
}

class _OpeningState extends State<Opening> {
  List<int> cards = [];
  int index = 0;


  @override
  void initState() {
    super.initState();
    index = 0;
    cards = globals.generateCards();
    for (int c in cards){
      globals.cards[c]++;
    }
    // We send to the server the cards we got.
    network.send("add|${cards[0]} ${cards[1]} ${cards[2]} ${cards[3]} ${cards[4]} ${cards[5]} ${cards[6]} ${cards[7]} ${cards[8]} ${cards[9]}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Obtuviste... (${index+1}/10)"),
            globals.cards[cards[index]] != 1 ? Text(globals.names[index]) : Text("¡Nueva!"),
            SizedBox(height: 20),
            Image.asset('lib/resources/gen_1/${cards[index]+1}.png', height: 200, width: 100),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                index++;
                if (index == 10){
                  // We navigate to the album and clear the stack.
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Album()), (route) => false);
                }
                else{
                  setState(() {});
                }
              },
              child: index == 9 ? const Text("Volver") : const Text("Siguiente"),
            )
          ])
          )
          );

  }
}
