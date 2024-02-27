local inspect = require("inspect")
local internet = require("internet")
 
local handle = internet.request("https://www.google.com")
local result = ""
for chunk in handle do result = result..chunk end
-- Print the body of the HTTP response
-- print(result)
 
-- Grab the metatable for the handle. This contains the
-- internal HTTPRequest object.
local mt = getmetatable(handle)
 
-- The response method grabs the information for
-- the HTTP response code, the response message, and the
-- response headers.
local code, message, headers = mt.__index.response()
print("code = "..tostring(code))
print("message = "..tostring(message))
print(inspect(headers))
read()