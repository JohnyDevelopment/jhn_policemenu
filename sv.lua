ESX = exports["es_extended"]:getSharedObject()
local webhook = "https://canary.discord.com/api/webhooks/1081638779233767444/4seJcc5eXR3rD0vG7GYMYeKxe_z_rjYzxHXcNPNFMwz1gQjyXDAuBkkdykZIpUlWpdoI"
RegisterServerEvent('jhn_policemenu:kody')
AddEventHandler('jhn_policemenu:kody', function(kod)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (xPlayer.job.name == 'police') then
        xPlayer.showNotification('Wyslano wiadomosc')
        if (kod == 'zielony') then 
            local name = xPlayer.get('firstName').." "..xPlayer.get('lastName')
            local logpodwysylanie = {
                {
                    ["color"] = "65280",
                    ["title"] = "Ogłoszenie",
                    ["description"] = "Na miasto został wprowadzony kod **Zielony**",
                    ["footer"] = {
                        ["text"] = "Wprowadzil: "..name.." - "..os.date("%x %X %p"),
                    },
                }
            }
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = logpodwysylanie}), { ['Content-Type'] = 'application/json' })
            TriggerClientEvent("chat:addMessage", -1, "Na miasto został wprowadzony kod zielony")
        elseif (kod == "pomaranczowy") then 
            local name = xPlayer.get('firstName').." "..xPlayer.get('lastName')
            local logpodwysylanie = {
                {
                    ["color"] = "16751360",
                    ["title"] = "Ogłoszenie",
                    ["description"] = "Na miasto został wprowadzony kod **Pomaranczowy**",
                    ["footer"] = {
                        ["text"] = "Wprowadzil: "..name.." - "..os.date("%x %X %p"),
                    },
                }
            }
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = logpodwysylanie}), { ['Content-Type'] = 'application/json' })
            TriggerClientEvent("chat:addMessage", -1, "Na miasto został wprowadzony kod Pomaranczowy")
        elseif (kod == "czerwony") then 
            local name = xPlayer.get('firstName').." "..xPlayer.get('lastName')
            local logpodwysylanie = {
                {
                    ["color"] = "15548997",
                    ["title"] = "Ogłoszenie",
                    ["description"] = "Na miasto został wprowadzony kod **Czerwony**",
                    ["footer"] = {
                        ["text"] = "Wprowadzil: "..name.." - "..os.date("%x %X %p"),
                    },
                }
            }
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = logpodwysylanie}), { ['Content-Type'] = 'application/json' })
            TriggerClientEvent("chat:addMessage", -1, "Na miasto został wprowadzony kod Czerwony") 
        elseif (kod == "czarny") then 
            local name = xPlayer.get('firstName').." "..xPlayer.get('lastName')
            local logpodwysylanie = {
                {
                    ["color"] = "0",
                    ["title"] = "Ogłoszenie",
                    ["description"] = "Na miasto został wprowadzony kod **Czarny**",
                    ["footer"] = {
                        ["text"] = "Wprowadzil: "..name.." - "..os.date("%x %X %p"),
                    },
                }
            }
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = logpodwysylanie, username = name}), { ['Content-Type'] = 'application/json' })
            TriggerClientEvent("chat:addMessage", -1, "Na miasto został wprowadzony kod Czarny") 
        else
          xPlayer.showNotification('Blad') 
        end 
    else
        xPlayer.showNotification('Why are you cheater???')    
        -- ban trigger
    end
end)

RegisterServerEvent('jhn_policemenu:custom')
AddEventHandler('jhn_policemenu:custom', function(msg)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (xPlayer.job.name == "police") then 
        local name = xPlayer.get('firstName').." "..xPlayer.get('lastName')
            local logpodwysylanie = {
                {
                    ["color"] = "0",
                    ["title"] = "Ogłoszenie",
                    ["description"] = msg,
                    ["footer"] = {
                        ["text"] = "Napisal: "..name.." - "..os.date("%x %X %p"),
                    },
                }
            }
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = logpodwysylanie, username = name}), { ['Content-Type'] = 'application/json' })
            TriggerClientEvent("chat:addMessage", -1, "Police: "..msg) 
    else
        xPlayer.showNotification('Why are you cheater??')
        -- ban trigger
    end
end)