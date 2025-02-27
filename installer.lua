local shell = require("shell")
local filesystem = require("filesystem")

shell.execute("rm -v /home/Main.lua")
shell.execute("rm -v /home/BruvAI.lua")
shell.execute("rm -v /home/Password.lua")
shell.execute("rm -v /home/Users.lua")
shell.execute("rm -v /home/DoorControl.lua")
shell.execute("rm -v /home/Maintenance.lua")
shell.execute("rm -v /home/Updates.lua")
shell.execute("rm -v /home/Changelog.txt")
shell.execute("rm -v /home/Logo.txt")

if filesystem.exists("/home/Users") == false then
    filesystem.makeDirectory("/home/Users")
    print("Creating Users Directory")
else
    print("Users Directory Already Exists")
end

shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Main.lua /home/Main.lua")
shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/BruvAI.lua /home/BruvAI.lua")
shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Password.lua /home/Password.lua")
shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Users.lua /home/Users.lua")
shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/DoorControl.lua /home/DoorControl.lua")
shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Maintenance.lua /home/Maintenance.lua")
shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Updates.lua /home/Updates.lua")
shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Changelog.txt /home/Changelog.txt")
shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Logo.txt /home/Logo.txt")
--shell.execute("wget https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/.passwordHash /home/.passwordHash")

local passwordHash = io.open("/home/.passwordHash", "w")
passwordHash:write("")
passwordHash:close()

local startup = io.open("/home/.shrc", "w")
startup:write("Main.lua")
startup:close()

shell.execute("rm /home/Installer.Lua")
print("\nPress enter to Reboot")
io.read()
shell.execute("reboot")