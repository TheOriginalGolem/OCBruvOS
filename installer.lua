local shell = require("shell")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Main.lua /home/Main.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Password.lua /home/Password.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/DoorControl.lua /home/DoorControl.lua")

shell.execute("Main.lua")