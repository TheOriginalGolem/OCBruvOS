local shell = require("shell")
local filesystem = require("filesystem")

shell.execute("rm -v /home/Main.lua")
shell.execute("rm -v /home/BruvAI.lua")
shell.execute("rm -v /home/Password.lua")
shell.execute("rm -v /home/Employee.lua")
shell.execute("rm -v /home/DoorControl.lua")
shell.execute("rm -v /home/Maintenance.lua")
shell.execute("rm -v /home/Logo.txt")

shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Main.lua /home/Main.lua")

shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/BruvAI.lua /home/BruvAI.lua")

shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Password.lua /home/Password.lua")

shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Employee.lua /home/Employee.lua")

shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/DoorControl.lua /home/DoorControl.lua")

shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Maintenance.lua /home/Maintenance.lua")

shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Logo.txt /home/Logo.txt")

shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/.passwordHash /home/.passwordHash")

local startup = io.open("/home/.shrc", "w")
startup:write("Main.lua")
startup:close()

shell.execute("rm /home/Installer.Lua")
print("\nPress enter to Reboot")
io.read()
shell.execute("reboot")