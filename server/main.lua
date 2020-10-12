onlinePlayers = {}

RegisterServerEvent('tgiann-showid:add-id')
AddEventHandler('tgiann-showid:add-id', function()
    TriggerClientEvent("tgiann-showid:client:add-id", source, onlinePlayers)
    local topText = "undefined " .. TGIANN.which
    local identifiers = GetPlayerIdentifiers(source)
    if TGIANN.which == "steam" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'steam:') then
                topText = v
                break
            end
        end
    elseif TGIANN.which == "steamv2" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'steam:') then
                topText = string.sub(v, 7)
                break
            end
        end
    elseif TGIANN.which == "license" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'license:') then
                topText = v
                break
            end
        end
    elseif TGIANN.which == "licensev2" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'license:') then
                topText = string.sub(v, 9)
                break
            end
        end
    elseif TGIANN.which == "name" then 
        topText = GetPlayerName(source)
    end
    onlinePlayers[tostring(source)] = topText
    TriggerClientEvent("tgiann-showid:client:add-id", -1, topText, tostring(source))
end)

AddEventHandler('playerDropped', function(reason)
    onlinePlayers[tostring(source)] = nil
end)