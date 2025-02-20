local shell = require("shell")

function systemUpdate()
    shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/installer.lua /home/Installer.Lua")
    shell.execute("/home/Installer.Lua")
end


function UpdateMenu()
    while true do
        clearScreen()
        print("Update Menu:")
        print("[1] Check for Updates")
        print("[2] Force System Update")
        print("[0] Exit")

        local selectedOption = read();
        if selectedOption == "1" then
            print("WIP")
            os.sleep(1.5)
        elseif selectedOption == "2" then
            systemUpdate()
        elseif selectedOption == "0" then
            break
        else
            print("Invalid option. Please select a valid option.")
            os.sleep(1.5)
        end
    end
    
end