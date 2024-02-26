local component = require("component")
local event = require("event")
local term = require("term")
local filesystem = require("filesystem")

local filePath = "/home/Doors.txt"

-- Function to save text to file
function saveToFile(text)

end

function displayDoors()
    -- Display saved entries
    print("Saved entries:")

    local file, err = io.open(filePath, "r")

    if not file then
        print("Error opening file for reading: " .. err)
        return
    end

    local line = file:read("*line")

    while line do
        print(line)
        line = file:read("*line")
    end
    file:close()
end

-- Main function
function doorControlMain()
    displayDoors()
end