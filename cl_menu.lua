local PlayerData, CurrentActionData, HandcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
ESX = nil
locksound = false
onDuty = false
local ex = true

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

---------------function pour le checkbox
function functionCheckBox()
	ex= not ex
	local ped = GetPlayerPed(-1)
	if ex then -- désactivé
		ESX.ShowNotification('~r~Désactivé')
	else -- activé
		ESX.ShowNotification('~g~Activé')
	end
end  

local exemple = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Exemple Menu" },
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
			if btn == "Exemple1 sousmenu" then
				OpenMenu('sousmenu')

			elseif slide == 1 and btn == "Exemple3 slide" then
				ESX.ShowNotification('~g~slide 1')
			elseif slide == 2 and btn == "Exemple3 slide" then
				ESX.ShowNotification('~b~slide 2')
			elseif slide == 3 and btn == "Exemple3 slide" then
				ESX.ShowNotification('~y~slide 3')
			elseif slide == 4 and btn == "Exemple3 slide" then
				ESX.ShowNotification('~p~slide 4')

				elseif btn == "Exemple3 checkbox" then
					functionCheckBox()				
		end
	end,
	
},
	Menu = {
		["Menu Exemple"] = {
			b = {
                {name = "Exemple1 sousmenu", ask = ">", askX = true},
				{name = "Exemple2 description", Description = 'Exemple Description.'},
				{name = "Exemple3 checkbox", checkbox = false},
				{name = "Exemple3 slide", slidemax = {"1", "2", "3", "4"}},			
			}
        },
		["sousmenu"] = {
			b = {
                {name = "sousmenu", ask = ">", askX = true},
				
			}
        },

	}
}


-- ouvrir  le menu avec une touche.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlJustPressed(1,57) then
			CreateMenu(exemple)
		end
	end
end)

-- ouvrir menu par commande (/menuex)
--[[ RegisterCommand("menuex", function()
	CreateMenu(exemple)
end) ]]

-- ouvrir menu par marker
--[[ Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, 241.88694763184,224.44245361328,105.2868347168)
            DrawMarker(25,243.1475,224.4663,105.309,0,0,0,0,0,0,1.000,1.0001,0.5001,229, 114, 10,100,0,0,0,0)
            if dist <= 2.0 then
                ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour discuter.')
				if IsControlJustPressed(1,51) then 
                    CreateMenu(exemple)
				end
            end
        end
end) ]]

