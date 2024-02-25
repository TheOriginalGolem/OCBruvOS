local component = require("component")
local filesystem = require("filesystem")

loggedIn = true

function setupSystem()
    clearScreen()
    print("Welcome to Bruv OS. Please enter a master password.")
    io.write("Password: ")
    --local passwordHash = component.data.md5(read())
    local file = io.open("passwordHash.txt", "w")

    if file then
        -- Write the data to the file
        file:write(read())

        -- Close the file
        file:close()
        print("Data written to the file successfully.")
    else
        print("Failed to open the file for writing.")
    end
end

-- Function to request and validate the password
function login()
    local file = io.open("passwordHash.txt", "r")
    
    local correctPassword = file:read("*a")
    file:close()
    clearScreen()
    io.write("Enter password: ")
    local enteredPassword = read()
    return enteredPassword == correctPassword
end