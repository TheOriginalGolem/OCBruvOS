local shell = require("shell")

shell.execute("rm /home/Main.lua")
shell.execute("rm /home/Password.lua")
shell.execute("rm /home/DoorControl.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Main.lua /home/Main.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Password.lua /home/Password.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/DoorControl.lua /home/DoorControl.lua")

local startup = io.open("/home/.shrc", "w")
startup:write("Main.lua")
startup:close()

shell.execute("rm /home/Installer.Lua")
shell.execute("reboot")