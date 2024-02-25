local shell = require("shell")
local filesystem = require("filesystem")

filesystem.remove("/home/Main.lua")
filesystem.remove("/home/Password.lua")
filesystem.remove("/home/DoorControl.lua")
filesystem.remove("/home/Maintenance.lua")


shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Main.lua /home/Main.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Password.lua /home/Password.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/DoorControl.lua /home/DoorControl.lua")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Maintenance.lua /home/Maintenance.lua")

local startup = io.open("/home/.shrc", "w")
startup:write("Main.lua")
startup:close()

shell.execute("rm /home/Installer.Lua")
shell.execute("reboot")