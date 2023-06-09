import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'album.dart';
import 'globals.dart' as globals;
import 'network/network.dart' as network;

void main() {
  for(int i = 0; i < globals.rarity.length; i++){
    globals.totalRarity += globals.rarity[i];
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokéfrikis',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pokéfrikis (Generación uno)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _user;


  /* We will check if the username is already set. If it is not, you will
     be forced to decide it. Here, we could have used SQLite as well. 
     Indeed, it was my first option. However, I considered it was not
     appropiate to store such a small amount of data localy. */

  @override
  void initState() {
    super.initState();
    _user = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('username') ?? '';
    });
  }



  @override
  Widget build(BuildContext context) {


    network.connect();

    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: _user,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // We make the user choose a username if it is not already set (minimun length 3)
                  // If the username is already set, we will navigate to the collection page.
                  if (snapshot.data!.length < 3){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Elige un nombre de usuario (mínimo 3 caracteres)'),
                        SizedBox(height: 10),
                        Container(
                          width: 200,
                          child: TextField(
                            onChanged: (String value) {
                              globals.username = value;
                            },
                            decoration: const InputDecoration(
                                          hintText: 'Elige sabiamente...',
                                        ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (globals.username.length > 2){
                              _prefs.then((SharedPreferences prefs) {
                                prefs.setString('username', globals.username);
                              });
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (BuildContext context) => const Album()),
                                (Route<dynamic> route) => false,
                              );
                            }
                          },
                          child: const Text('Continuar'),
                        ),



                        ]
                            );
                  } else {
                    globals.username = snapshot.data!;
                    // We must wait for the first build to complete.
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => const Album()),
                        (Route<dynamic> route) => false,
                      );

                    });
                    return const Text('Cargando...');
                  }

                }
            }
          }
    )
        )
        );
  }
}
