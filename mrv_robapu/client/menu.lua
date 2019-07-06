_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("", "Bienvenue chez Apu !", nil, nil, "shopui_title_conveniencestore", "shopui_title_conveniencestore")
_menuPool:Add(mainMenu)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function AddMenuRobApu(menu)
        
        local submenu = _menuPool:AddSubMenu(menu, "Actions", "", 5, 100, "shopui_title_conveniencestore", "shopui_title_conveniencestore")

        local robapumoney = NativeUI.CreateItem("Braquer Apu", "")
        robapumoney:RightLabel("~g~1300$")

        submenu.SubMenu:AddItem(robapumoney)

        local robapufood = NativeUI.CreateItem("Voler de la nourriture", "")

        submenu.SubMenu:AddItem(robapufood)

        submenu.SubMenu.OnItemSelect = function(menu, item)

        if item == robapumoney then
                    
        if IsPedArmed(GetPlayerPed(-1), 4) then
            holdupon = true
            canotif = true
            _menuPool:CloseAllMenus()
            TaskAimGunAtCoord(GetPlayerPed(), 24.129, -1345.156, 30.000, 21000, true, true)
            startAnim(ped, "mp_am_hold_up", "holdup_victim_20s")

            missionText("L-L-Laissez moi la vie sauve svp...", 7000)

            Citizen.Wait(21000)
            TriggerServerEvent('mrv_robapu:rewards')
            spawnbag()

        else
            canotif = false
            startAnim(ped, "mp_player_int_upperfinger", "mp_player_int_finger_01_enter")
            missionText("Tu me fais pas peur gamin", 5000)
        end
            holdupon = false
        end

        if item == robapufood and canrobfood then
            ShowNotification("Vous ne pouvez voler que ~r~5~s~ fois !")
            holdupon = true
            ESX.ShowAdvancedNotification("Apu", "Message", "Patience...", "CHAR_MULTIPLAYER", 2)
            Citizen.Wait(2000)
            robfoodmax = robfoodmax + 1
            startAnim(GetPlayerPed(-1), "anim@am_hold_up@male", "shoplift_low")
            TriggerServerEvent('mrv_robapu:rewardsfood')
        end

        if callpolice then
            TriggerServerEvent('mrv_robapu:callPolice')
        end
        holdupon = false
    end
end

AddMenuRobApu(mainMenu)
_menuPool:MouseEdgeEnabled (false);
_menuPool:RefreshIndex()