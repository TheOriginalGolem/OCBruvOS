local shell = require("shell")
local filesystem = require("filesystem")

function systemUpdate()
    shell.execute("wget -f https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/installer.lua /home/Installer.Lua")
    shell.execute("/home/Installer.Lua")
end

updateAvailable = false

function currentVersion()
    local file = io.open("Changelog.txt", "r")
    local currentVersion = file:read(4)
    file:close()
    return currentVersion
end

function updateChecker(isQuiet)
    local quiet = isQuiet or false
    if quiet == false then
        io.write("Checking for Updates")
        dots(3)
    end

    shell.execute("wget -fq https://raw.githubusercontent.com/TheOriginalGolem/OCBruvOS/main/Changelog.txt /home/NewChangelog.txt")
    local file = io.open("NewChangelog.txt", "r")
    local newVersion = file:read(4)
    file:close()
    filesystem.remove("/home/NewChangelog.txt")
    
    if currentVersion() == newVersion then
        if quiet == false then
            print("\nUpdate Found!")
            os.sleep(3)
        end
        return false
    else
        if quiet == false then
            print("\nNo Update Found")
            os.sleep(3)
        end
        updateAvailable = true
        return true
    end

end

function viewChangelog()
    local file = io.open("Changelog.txt", "r")

    local changelogText = file:read("*a")
    file:close()
    clearScreen()
    print(changelogText)
    print("\n\nPress enter to close")
    io.read()
end

function UpdateMenu()
    while true do
        clearScreen()
        print("Update Menu:")
        if updateAvailable == false then
            print("[1] Check for Updates")
        elseif updateAvailable == true then
            print("[1] Update Available - Update Now")
        end

        print("[2] Force System Update")
        print("[3] View Changelog")
        print("[0] Exit")

        local selectedOption = read();
        if selectedOption == "1" then
            if updateAvailable == false then
                updateChecker()
            elseif updateAvailable == true then
                systemUpdate()
            end
        elseif selectedOption == "2" then
            systemUpdate()
        elseif selectedOption == "3" then
            viewChangelog()
        elseif selectedOption == "0" then
            break
        else
            print("Invalid option. Please select a valid option.")
            os.sleep(1.5)
        end
    end
    
end