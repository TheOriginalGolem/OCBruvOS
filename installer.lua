local shell = require("shell")
local filesystem = require("filesystem")

shell.execute("rm /home/Main.lua")
shell.execute("rm /home/Password.lua")
shell.execute("rm /home/Employee.lua")
shell.execute("rm /home/DoorControl.lua")
shell.execute("rm /home/Maintenance.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Main.lua /home/Main.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Password.lua /home/Password.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Employee.lua /home/Employee.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/DoorControl.lua /home/DoorControl.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Maintenance.lua /home/Maintenance.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/passwordHash.txt /home/passwordHash.txt")

local startup = io.open("/home/.shrc", "w")
startup:write("Main.lua")
startup:close()

shell.execute("rm /home/Installer.Lua")
shell.execute("reboot")