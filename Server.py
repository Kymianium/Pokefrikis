# This is the server. The server listens in the port 4200 and handles the requests from the client.

import socket
import os
import threading
from datetime import date

class color:
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    WHITE = '\033[97m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    END = '\033[0m'


server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# We set the port to 4200 and the IP to localhost
PORT = 4200
IP = "192.168.1.13" #TODO put your IP here

# We bind the server to the IP and the port

try:
    server.bind((IP, PORT))
except socket.error as e:
    print(str(e))
    exit()

# We set the server to listen for connections

server.listen(1024) # 1024 is the number of connections that the server can handle

# We define the fucntion that answers to the queries

def handle_client(conn, addr):
    while True:
        try:
            message = conn.recv(2048).decode("utf-8")
            command = message.split("|", -1)
            # The first argument is the name of the player.
            # First, we will check if a file with the name of the player exists.
            # If not, we will create it.
            # The file will consist in 152 rows with integers.
            # The first integer will represent the money of the player.
            # The following 151 integers will represent the number of the cards that the player has.

            print(color.BOLD + color.YELLOW + "The player " + command[0] + " has sent the command " + command[1] + color.END)
            if not os.path.exists(command[0]):
                f = open(command[0], "w")
                f.write("500\n")
                for i in range(151):
                    f.write("0\n")
                f.close()
            # Now, we check the command





            print(color.RED + command[1] + color.END)# TODO borrar esto
            # We send a generic answer
            conn.sendall(bytes("Houston, te escuchamos.", "utf-8"))
            print(color.BOLD + "Respuesta enviada" + color.END)





        except: 
            continue


# We create a list with the users that have already connected today
users = []
# We get the date, since we will need to restart the list of users each time the day changes
today = date.today()

print(color.BOLD + color.GREEN + "The server is listening in the port " + str(PORT) + color.END)
while True:
    conn, addr = server.accept()
    print(color.GREEN + "Connection from: " + str(addr) + color.END)
    t = threading.Thread(target=handle_client, args=(conn, addr))
    t.start()
