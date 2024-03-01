--local inspect = require("inspect")
local internet = require("internet")

local url = "https://192.168.88.223:5001/api/v1/generate"
local data = '{"max_context_length": 2048,"max_length": 100,"prompt": "Define GPU","quiet": false,"rep_pen": 1.1,"rep_pen_range": 256,"rep_pen_slope": 1,"temperature": 0.5,"tfs": 1,"top_a": 0,"top_k": 100,"top_p": 0.9,"typical": 1}'


local handle = internet.request(url,data,{'accept: application/json','Content-Type: application/json'},"POST")

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
--print(inspect(headers))
read()