local display = false
ESX = exports["es_extended"]:getSharedObject()
RegisterCommand("policemenu", function(source, args)
    SetDisplay(not display)
end)

--very important cb 
RegisterNUICallback("exit", function(data)
    ESX.ShowNotification('Wyszedles z menu')
    SetDisplay(false)
    SetNuiFocus(false, false)
end)

-- this cb is used as the main route to transfer data back 
-- and also where we hanld the data sent from js
RegisterNUICallback("main", function(data)
    TriggerServerEvent("jhn_policemenu:custom", data.text)
    SetDisplay(false)
end)

RegisterNUICallback("kody", function(data)
    SetDisplay(false)
    TriggerServerEvent('jhn_policemenu:kody', data.kod)
end)
RegisterNUICallback("error", function(data)
    ESX.ShowNotification(data.error)
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        -- https://runtime.fivem.net/doc/natives/#_0xFE99B66D079CF6BC
        --[[ 
            inputGroup -- integer , 
	        control --integer , 
            disable -- boolean 
        ]]
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end
