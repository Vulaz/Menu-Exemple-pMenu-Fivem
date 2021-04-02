local PlayerData, CurrentActionData, HandcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
ESX = nil
locksound = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

local exemple = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Exemple" },
	Data = { currentMenu = "Menu Exemple", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			if btn == "Exemple " then

            elseif slide == 1 and btn == "Exemple Slide" then

			elseif slide == 2 and btn == "Exemple Slide" then
				
		end
	end,
	
},
	Menu = {
		["menu exemple"] = {
			b = {
                {name = "Exemple ", ask = ">", askX = true},
                {name = "Exemple Sous Menu", ask = ">", askX = true},
			}
        },
        
        ["exemple sous menu"] = {
			b = {
                {name = "exemple 1"},
				{name = "exemple 2"},
			}
		}
	}
}

Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(1, 57) then
				CreateMenu(exemple)
			end
		end
	end
end)
