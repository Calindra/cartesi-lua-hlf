-- Import the http library
local request = require("http.request")

-- Specify the URL you want to request
local url = "https://swapi.dev/api/people/1/"

local headers, stream = assert(request.new_from_uri(url):go())

local body = assert(stream:get_body_as_string())

if headers:get(":status") ~= "200" then
	error(body)
end

print(body)
