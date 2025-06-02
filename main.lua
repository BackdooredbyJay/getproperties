local json = request({
    Url = "https://anaminus.github.io/rbx/json/api/latest.json",
    Method = "GET",
}).Body
local json_to_luatbl = function(js)
    local converted = game:GetService("HttpService"):JSONDecode(js)
    return converted
end
local function getproperties(instance)
    local property_structure = {}
    for i,v in pairs(json_to_luatbl(json)) do
        if v.Class == instance.ClassName and v.type == "Property" then
            property_structure[v.Name] = instance[v.Name]
        end
    end
    return property_structure
end
return getproperties
