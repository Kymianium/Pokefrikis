// Function to connect to the server
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import '../globals.dart' as globals;

void connect() async {
  // TODO PUT YOUR IP HERE!
  // I used the port 4200 because I was born the 4th of February of 2000 :)
  try {
    globals.server = await Socket.connect("85.59.205.10", 4200);
  } catch (error) {
    print("Error connecting to the server: $error"); 
    throw Exception("Error connecting to the server: $error");
  }

  print("Conectado al servidor\n");

  globals.server.listen((Uint8List data) async {
    processData(utf8.decode(data));
  }, onError: (error) {
    print("Error: $error");
  });
}

void send(String message) {
  globals.server.write("${globals.username}|" + message);
}


void processData(String data) {
  print(data);
}
