import "dart:math";



double height = 1;
double width = 1;
String username = "";

int coins = 500;
var server;


List<int> cards = List<int>.filled(151, 0);

List<String> names = ["Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Wartotle", "Blastoise", "Caterpie", "Metapod", "Butterfree", "Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto", "Pidgeot", "Rattata", "Raticate", "Spearow", "Fearow", "Ekans", "Arbok", "Pikachu", "Raichu", "Sandshrew", "Sandslash", "Nidoran H", "Nidorina", "Nidoqueen", "Nidoran M", "Nidorino", "Nidoking", "Clefairy", "Clefable", "Vulpix", "Ninetales", "Jigglypuff", "Wigglytuff", "Zubat", "Golbat", "Oddish", "Gloom", "Vileplume", "Paras", "Parasect", "Venonat", "Venomoth", "Diglett", "Dugtrio", "Meowth", "Persian", "Psyduck", "Golduck", "Mankey", "Primeape", "Growlithe", "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra", "Kadabra", "Alakazam", "Machop", "Machoke", "Machamp", "Bellsprout", "Weepinbell", "Victreebel", "Tentacool", "Tentacruel", "Geodude", "Graveler", "Golem", "Ponyta", "Rapidash", "Slowpoke", "Slowbro", "Magnemite", "Magneton", "Farfetch'd", "Doduo", "Dodrio", "Seel", "Dewgong", "Grimmer", "Muk", "Shellder", "Cloyster", "Gastly", "Haunter", "Gengar", "Onix", "Drowzee", "Hypno", "Krabby", "Kingler", "Voltorb", "Electrode", "Exeggcute", "Exeggutor", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan", "Lickitung", "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey", "Tangela", "Kangaskhan", "Horsea", "Seadra", "Goldeen", "Seaking", "Staryu", "Starmie", "Mr Mime", "Scyther", "Jynx", "Electabuzz", "Magmar", "Pinsir", "Tauros", "Magikarp", "Gyarados", "Lapras", "Ditto", "Eevee", "Vaporeon uwu", "Jolteon", "Flareon", "Porygon", "Omanyte", "Omastar", "Kabuto", "Kabutops", "Aerodactyl", "Snorlax", "Articuno", "Zapdos", "Moltres", "Dratini", "Dragonair", "Dragonite", "Mewtwo", "Mew"];

// We will use 20 for commons, 10 for rare, 5 for epic, 1 for legendary
int common = 20;
int rare = 10;
int epic = 5;
int legendary = 2;

List<int> rarity = [common,
    rare,
    epic,
    common,
    rare,
    legendary,
    common,
    rare,
    epic,
    common,
    common,
    rare,
    common,
    common,
    rare,
    common,
    common,
    rare,
    common,
    common,
    common,
    rare,
    common,
    rare,
    rare,
    epic,
    common,
    rare,
    common,
    rare,
    rare,
    common,
    rare,
    rare,
    common,
    common,
    rare,
    epic,
    common,
    rare,
    common,
    common,
    common,
    common,
    rare,
    common,
    common,
    common,
    common,
    common,
    rare,
    common,
    rare,
    common,
    rare,
    common,
    rare,
    rare,
    epic,
    common,
    common,
    rare,
    common,
    rare,
    epic,
    common,
    rare,
    rare,
    common,
    common,
    common,
    common,
    rare,
    common,
    rare,
    rare,
    common,
    rare,
    common,
    rare,
    common,
    rare,
    common,
    common,
    rare,
    common,
    common,
    common,
    rare,
    common,
    rare,
    common,
    rare,
    epic,
    rare,
    common,
    rare,
    common,
    common,
    common,
    rare,
    common,
    rare,
    common,
    rare,
    common,
    common,
    common,
    common,
    rare,
    common,
    rare,
    common,
    common,
    rare,
    rare,
    epic,
    common,
    common,
    common,
    rare,
    rare,
    rare,
    common,
    common,
    common,
    rare, 
    rare,
    common,
    epic,
    epic,
    epic,
    common,
    legendary,
    rare,
    rare,
    rare,
    common,
    rare,
    common,
    rare,
    epic,
    epic,
    legendary,
    legendary,
    legendary,
    rare,
    epic,
    epic,
    legendary,
    legendary
    ];

    int totalRarity = 0;

    List<int> generateCards(){
      List<int> generatedCards = [];
      for(int i = 0; i < 10; i++){
        // We generate a random number with the maximum of the total rarity
        int card = Random().nextInt(totalRarity);
        int index = 0;
        while(card>0){
          card -= rarity[index];
          index++;
        }
        index--;
        generatedCards.add(index);
      }
      return generatedCards;
    }

