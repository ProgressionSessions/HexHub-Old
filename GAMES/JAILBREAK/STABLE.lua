

-- main boot ui


local Players = game:GetService('Players');
local localplayer = Players.LocalPlayer;
-- semicolon but cool :sunglasses:

local Library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/HexerMaster1929/CARMLWARE/main/UI/LIBRARY-LATEST.lua"),true))()--require(script.Parent)
local JBENGINE = loadstring(game:HttpGet('https://raw.githubusercontent.com/HexerMaster1929/CARMLWARE/main/GAMES/JAILBREAK/JB-ENGINE.lua'))()
local JB_NOTIFICATIONS = require(game:GetService("ReplicatedStorage").Game.Notification)
Library:Notify({
	Title = "CARMLWARE | By GINNIS SOFTWORKS",
	Content = "Client Script Is Up To Date!",
	Duration = 6.5,
	Image = 11346938201,
})

JB_NOTIFICATIONS.new({
	Text = "Starting CarmlWare, This may take a While!",
	Duration = 2
})

local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Sirius/request/library/sense/source.lua'))()
local Window = Library:CreateWindow({
	Name = "CARMLWARE | JAILBREAK",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "CARMLWARE_SAVED_DATA", -- Create a custom folder for your hub/game
		FileName = "JAILBREAK"
	},

})
--Window:AddSettingsTab() -- \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/
--Window:SetTabOrder(1)
local Char = Window:CreateTab("Character",13285102351,true)
local Combat = Window:CreateTab("Combat",14084907641,true)
local VisualTab = Window:CreateTab("Visuals",6523858394,true)
--local Configs = Window:CreateTab("Settings")

--[[local EvadeSector = Evade:("Character", "left")
local Visuals = Evade:CreateSector("Visuals", "right")
local Credits = Evade:CreateSector("Credits", "left")
local Farms = AutoFarms:CreateSector("Farms", "left")
local FarmStats = AutoFarms:CreateSector("Stats", "right")

local Gamesec = Gamee:CreateSector("Utils", "right")
local World = Gamee:CreateSector("World", "left")]]

Settings = {
	["WS"] = 16,
	["JP"] = 50,
	["FLYSPD"] = 20,
	["NoRagdoll"] = false,
	["NoPara"] = false,
	["WEAPON"] = {
		["NFD"] = false,
		["FAM"] = false,
		["NRC"] = false,
		["NSP"] = false,
		["IRL"] = false,
	},
	ESP = {
		Enabled = false,
		ShowTeam = false,
		ShowEnemy = false,
		TeamColor = Color3.fromRGB(85, 255, 0),
		EnemyColor = Color3.fromRGB(255, 0, 0),
		ShowTracers = false,
		ShowBoxes = false,
		ShowNames = false,
		ShowDistance = false,
		ShowChams = false,
		SHowHealth = false,
		TracerOrigin = "Bottom"

	}
}


Char:CreateSection("HUMANOID MODIFICATIONS")

Char:CreateSlider({
	Name = "Walkspeed",
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Flag = "SPSlider",
	Range = {16,100},

	Callback = function(JP)
		Settings["WS"] = JP
	end,
})

Char:CreateSlider({
	Name = "Jump Height",
	Increment = 1,
	Suffix = "Height",
	CurrentValue = 50,
	Flag = "JPSlider",
	Range = {50,200},

	Callback = function(JP)
		Settings["JP"] = JP
	end,
})

Char:CreateSection("CHARACTER MODIFICATIONS")

Char:CreateToggle({
	Name = "No Ragdoll",
	CurrentValue = Settings["NoRagdoll"],
	Flag = "NRTOGGLE", 
	Callback = function(state)

		Settings["NoRagdoll"] = state
		if state == true then
			for _,v in pairs(getgc(true)) do
				if typeof(v) == "table" then
					if rawget(v, 'Ragdoll') then 
						v.Ragdoll = function(...) 
							return wait(9e9) 
						end 
					end
				end
			end
		else
			for _,v in pairs(getgc(true)) do
				if typeof(v) == "table" then
					if rawget(v, 'Ragdoll') then 
						v.Ragdoll = JBENGINE.Backups.Ragdoll
					end
				end
			end
		end
	end,
})

Char:CreateToggle({
	Name = "No Parachute When Falling",
	CurrentValue = Settings["NoPara"],
	Flag = "NRTOGGLE", 
	Callback = function(state)

		Settings["NoPara"] = state
		function deadFunction() --Lazy solution
			return false 
		end
		if state then
			require(game:GetService("ReplicatedStorage").Game.Paraglide).IsFlying = deadFunction()
		else
			require(game:GetService("ReplicatedStorage").Game.Paraglide).IsFlying = engine.Backups.IsFlying()
		end
	end,
})

Char:CreateSection("INTERACTION MODIFICATIONS")

Char:CreateToggle({
	Name = "No Interaction WaitTime",
	CurrentValue = Settings["NoWaitTime"],
	Flag = "NRTOGGLE", 
	Callback = function(state)

		Settings["NoRagdoll"] = state
		if state then
			for i,v in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
				v.Timed = false;
			end
		else
			for i,v in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
				v.Timed = true;
			end
		end
	end,
})

Char:CreateSection("FLIGHT MODIFICATIONS")

Char:CreateLabel("TEMPORARLY PATCHED!")

-- MAIN LOOP

Combat:CreateSection("GUN MODIFICATIONS")

Combat:CreateToggle({
	Name = "No Fire Delay",
	CurrentValue = Settings["WEAPON"]["NFD"],
	Flag = "NFDTOGGLE", 
	Callback = function(state)
		Settings["WEAPON"]["NFD"] = state
		if state == true then
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.FireFreq = math.huge
			end
		else
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.FireFreq = 1
			end
		end
	end,
})
Combat:CreateToggle({
	Name = "Fully Automatic Fire",
	CurrentValue = Settings["WEAPON"]["FAM"],
	Flag = "FAF", 
	Callback = function(state)
		Settings["WEAPON"]["FAM"] = state
		if state == true then
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.FireAuto = true
			end
		else
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.FireAuto = false
			end
		end
	end,
})
Combat:CreateToggle({
	Name = "No Recoil Effect(s)",
	CurrentValue = Settings["WEAPON"]["NRC"],
	Flag = "NFDTOGGLE", 
	Callback = function(state)
		Settings["WEAPON"]["NRC"] = state
		if state == true then
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.CamShakeMagnitude = 0
			end
		else
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.CamShakeMagnitude = 1
			end
		end
	end,
})
Combat:CreateToggle({
	Name = "No Bullet Spread",
	CurrentValue = Settings["WEAPON"]["NSP"],
	Flag = "NFDTOGGLE", 
	Callback = function(state)
		Settings["WEAPON"]["NSP"] = state
		if state == true then
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.BulletSpread = 0.06
			end
		else
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.BulletSpread = 0
			end
		end
	end,
})
Combat:CreateToggle({
	Name = "Instant Weapon Reload",
	CurrentValue = Settings["WEAPON"]["IRL"],
	Flag = "NFDTOGGLE", 
	Callback = function(state)
		Settings["WEAPON"]["IRL"] = state
		if state == true then
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.ReloadTime = 0
			end
		else
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.ReloadTime = 1
			end
		end
	end,
})

Combat:CreateSection("WEAPON INVENTORY")

Combat:CreateButton({
	Name = "Get All Default Weapons [GIVER METHOD]",
	Callback = function()
		local GVR = game:GetService("Workspace").Givers
		for i,v:Instance in pairs(GVR:GetChildren()) do
			if v.Name == "Criminal" then
				if v:FindFirstChildWhichIsA("ClickDetector") then
					fireclickdetector(v:FindFirstChildWhichIsA("ClickDetector"))
				end
			end
		end
	end,
})

Combat:CreateButton({
	Name = "Get All Advanced Weapons [CLICKALL METHOD]",
	Callback = function()
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("ClickDetector") then
				fireclickdetector(v)
			end
		end
	end,
})

-- visuals

VisualTab:CreateSection("ESP")

VisualTab:CreateToggle({
	Name = "ESP",
	CurrentValue = Settings.ESP.Enabled,
	Flag = "EspToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		--[[if EspSettings.FriendlyEnabled then
			Sense.teamSettings.friendly.enabled = Value
		end
		if EspSettings.EnemyEnabled then
			Sense.teamSettings.enemy.enabled = Value
		end]]

		Settings.ESP.Enabled = Value

		if Value then
			Sense.Load()
		elseif not Value then
			Sense.Unload()
		end
	end
})
VisualTab:CreateToggle({
	Name = "Show Enemys",
	CurrentValue = Settings.ESP.ShowEnemy,
	Flag = "ShowEnemysToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)

		Settings.ESP.ShowEnemy = Value

		Sense.teamSettings.enemy.enabled = Value

	end
})

VisualTab:CreateToggle({
	Name = "Show Team Members",
	CurrentValue = Settings.ESP.ShowTeam,
	Flag = "ShowTmMbrToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)


		Settings.ESP.ShowTeam = Value
		Sense.teamSettings.friendly.enabled = Value

	end
})

VisualTab:CreateSection("ESP Settings")

VisualTab:CreateToggle({
	Name = "Show Boxes",
	CurrentValue = Settings.ESP.ShowBoxes,
	Flag = "ShowBoxesToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)


		Settings.ESP.ShowBoxes = Value
		Sense.teamSettings.friendly.box = Value
		Sense.teamSettings.enemy.box = Value

	end
})

VisualTab:CreateToggle({
	Name = "Show Health Bar",
	CurrentValue = Settings.ESP.SHowHealth,
	Flag = "ShowHealthBarToggleESP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)


		Settings.ESP.SHowHealth = Value
		Sense.teamSettings.friendly.healthBar = Value
		Sense.teamSettings.enemy.healthBar = Value

	end
})

VisualTab:CreateToggle({
	Name = "Show Name",
	CurrentValue = Settings.ESP.ShowNames,
	Flag = "ShowNamesESP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)

		Settings.ESP.ShowNames = Value

		Sense.teamSettings.friendly.name = Value
		Sense.teamSettings.enemy.name = Value

	end
})

VisualTab:CreateToggle({
	Name = "Show Distance",
	CurrentValue = Settings.ESP.ShowDistance,
	Flag = "ShowDistance", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)

		Settings.ESP.ShowDistance = Value

		Sense.teamSettings.friendly.distance = Value
		Sense.teamSettings.enemy.distance = Value

	end
})

VisualTab:CreateToggle({
	Name = "Show Tracers",
	CurrentValue = Settings.ESP.ShowTracers,
	Flag = "ShowTracers", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)

		Settings.ESP.ShowTracers = Value

		Sense.teamSettings.friendly.tracer = Value
		Sense.teamSettings.enemy.tracer = Value

	end
})

VisualTab:CreateSlider({
	Name = "ESP Range",
	Range = {10, 700},
	Increment = 10,
	Suffix = "Range",
	CurrentValue = 10,
	Flag = "EspRangeSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		Sense.sharedSettings.maxDistance = Value
	end,
})

VisualTab:CreateDropdown({
	Name = "Tracer Origin",
	Options = {"Bottom","Top"},
	CurrentOption = Sense.teamSettings.enemy.tracerOrigin or "Bottom",
	Flag = "TracerOrigin", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
		Sense.teamSettings.enemy.tracerOrigin = Option
		Sense.teamSettings.enemy.tracerOrigin = Option
	end,
})

VisualTab:CreateColorPicker({
	Name = "Team Color",
	Color = Color3.fromRGB(127, 255, 105),
	Flag = "TeamColorPicker", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		Sense.teamSettings.friendly.boxColor = Value
		Sense.teamSettings.friendly.tracerColor = Value
		Sense.teamSettings.friendly.nameColor = Value
		Sense.teamSettings.friendly.healthTextColor = Value
		Sense.teamSettings.friendly.healthyColor = Value
		Sense.teamSettings.friendly.distanceColor = Value
		Sense.teamSettings.friendly.distanceOutlineColor = Value
	end
})

VisualTab:CreateColorPicker({
	Name = "Enemy Color",
	Color = Color3.fromRGB(255, 66, 58),
	Flag = "EnemyColorPicker", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		Sense.teamSettings.enemy.boxColor = Value
		Sense.teamSettings.enemy.tracerColor = Value
		Sense.teamSettings.enemy.nameColor = Value
		Sense.teamSettings.enemy.healthTextColor = Value
		Sense.teamSettings.enemy.healthyColor = Value
		Sense.teamSettings.enemy.distanceColor = Value
		Sense.teamSettings.enemy.distanceOutlineColor = Value
	end
})


game:GetService("RunService").RenderStepped:Connect(function()
	if localplayer.Character then
		if localplayer.Character:FindFirstChildWhichIsA("Humanoid") then
			localplayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = Settings["WS"]
			localplayer.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = Settings["JP"]
		end
	end
		task.wait()
end)


JB_NOTIFICATIONS.new({
	Text = "Carmlware has Successfully Started, Enjoy!",
	Duration = 2
})
