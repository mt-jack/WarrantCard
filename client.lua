print("Made by Marshy")
Citizen.CreateThread(function()
    local cmd = ''
    if config.UK then
        cmd = '/warrant'
        TriggerEvent('chat:addSuggestion', cmd, 'Show your warrant Card.')
		RegisterCommand('warrant', function()
			TriggerEvent('MarshyBadge:client:animation')
		end)
    end
    if config.USA then 
        cmd = '/badge'
        TriggerEvent('chat:addSuggestion', cmd, 'Show your badge Card.')
		RegisterCommand('badge', function()
			TriggerEvent('MarshyBadge:client:animation')
		end)
    end
end)
RegisterNetEvent('MarshyBadge:client:animation')
AddEventHandler('MarshyBadge:client:animation', function()
    Citizen.CreateThread(function()
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local badgeProp = CreateObject(GetHashKey('prop_fib_badge'), coords.x, coords.y, coords.z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(ped, 28422)
        AttachEntityToEntity(badgeProp, ped, boneIndex, 0.065, 0.029, -0.035, 80.0, -1.90, 75.0, true, true, false, true, 1, true)
        RequestAnimDict('paper_1_rcm_alt1-9')
        TaskPlayAnim(ped, 'paper_1_rcm_alt1-9', 'player_one_dual-9', 8.0, -8, 10.0, 49, 0, 0, 0, 0)
        Citizen.Wait(3500)
		DeleteObject(badgeProp)
        ClearPedSecondaryTask(ped)
    end)
end)
print("Made by Marshy")
