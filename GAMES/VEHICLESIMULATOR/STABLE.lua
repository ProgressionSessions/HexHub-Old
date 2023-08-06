-- loadstring(game:HttpGet("https://raw.githubusercontent.com/HexerMaster1929/HexHub/main/HexHubLoader.lua", true))()




-- HexHub UI Notifs: Version Notification

--loadstring(game:HttpGet("https://raw.githubusercontent.com/HexerMaster1929/HexHub/main/HexHubVersion"))() -- Version

--local ScriptVer = "5.1.0A"

--[[if HexHubVer ~= ScriptVer then
	Library:MakeNotification({
		Title = "HexHub Version Error",
		Desc = "Version "..tostring(ScriptVer)..", OUTDATED!",
		Icon = 11346938201,
		Time = 5.6
	})
elseif HexHubVer == ScriptVer then
	Library:MakeNotification({
		Title = "HexHub Version",
		Desc = "Version "..tostring(ScriptVer)..", Up To Date!",
		Icon = 11346938201,
		Time = 5.6
	})
end]]


-- HexHub UI Notifs: Loaded Notification

wait(.2)

local VSM = require(game:GetService("ReplicatedStorage").ModuleScripts.PlayerMessage)

function VS_MESSAGE(TEXT,TIME)
	VSM(game.Players.LocalPlayer,tostring(TEXT),tonumber(TIME))
end

if _G.HexHubLOADED then 
	VS_MESSAGE("HEXHUB V8 IS ALREADY LOADED!",6.5)
else
	_G.HexHubLOADED = true
	VS_MESSAGE("Starting CarmlWare",6.5)

	local Library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/MrolivesGaming/HexHub/main/UI/LIBRARY-LATEST.lua"),true))()--require(script.Parent)

	-- Finds car before loading, Ensuring the GUI will work.
	function findCar()
		local vehicle = workspace.Vehicles:getChildren()
		for i=1,#vehicle do
			if vehicle[i]:findFirstChild("owner") then
				if vehicle[i].owner.Value == game.Players.LocalPlayer.Name then
					myCar = vehicle[i]
				end
			end
		end
	end

	local settings = {
		af = false,
		CfSpeed = 10,

	}



	local Window = Library:CreateWindow({
		Name = "HEXHUB V8 | VEHICLE SIMULATOR",
		ConfigurationSaving = {
			Enabled = true,
			FolderName = "HEXHUB_SAVED_DATA", -- Create a custom folder for your hub/game
			FileName = "VEHICLESIMULATOR"
		},
	})

	local LocalPlayerTab = Window:CreateTab("Character",13285102351,true)
	local CarModsTab = Window:CreateTab("Vehicle",7013364587,true)
	local AutofarmTab = Window:CreateTab("Automation",12663457560,true)
	local CratesTab = Window:CreateTab("Crates",12132614903,true)


	-- Player Tab Stuff



	LocalPlayerTab:CreateSlider({
		Name = "Walkspeed",
		Increment = 10,
		Suffix = "Speed",
		CurrentValue = 16,
		Flag = "WSSlider",
		Range = {16,1000},

		Callback = function(WS)
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WS
		end,
	})

	LocalPlayerTab:CreateSlider({
		Name = "Jump Power",
		Increment = 10,
		Suffix = "Power",
		CurrentValue = 50,
		Flag = "JPSlider",
		Range = {50,1000},

		Callback = function(JP)
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = JP
		end,
	})

	LocalPlayerTab:CreateButton({
		Name = "Get Owner Perks",
		Callback = function()
			game:GetService("Players").LocalPlayer.UserId = 1099580
		end,
	})

	LocalPlayerTab:CreateButton({
		Name = "Fix Disappearing PlayerList",
		Callback = function()
			game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
		end,
	})


	-- Car Mods Tab Stuff

	CarModsTab:CreateSection("Vehicle Modifications")

	CarModsTab:CreateInput({
		Name = "Nitrous Speed",
		PlaceholderText = "Value",
		RemoveTextAfterFocusLost = false,
		Callback = function(NSV)
			findCar()
			myCar.Handling.Nitro.NitroSpeed.Value = NSV
		end,
	})

	CarModsTab:CreateInput({
		Name = "Nitrous Force",
		PlaceholderText = "Value",
		RemoveTextAfterFocusLost = false,
		Callback = function(NFV)
			findCar()
			myCar.Handling.Nitro.NitroForce.Value = NFV
		end,
	})

	CarModsTab:CreateInput({
		Name = "Turbo Jump Height",
		PlaceholderText = "Value",
		RemoveTextAfterFocusLost = false,
		Callback = function(JHV)

			findCar()
			myCar.Handling.TurboJump.TurboJumpHeight.Value = JHV
		end,
	})

	CarModsTab:CreateInput({
		Name = "Torque",
		PlaceholderText = "Value",
		RemoveTextAfterFocusLost = false,
		Callback = function(TQV)

			findCar()
			myCar.Handling.Torque.Value = TQV
		end,
	})

	CarModsTab:CreateInput({
		Name = "Maximum Speed",
		PlaceholderText = "Value",
		RemoveTextAfterFocusLost = false,
		Callback = function(SPV)
			findCar()
			myCar.Handling.MaxSpeed.Value = SPV
			myCar.Handling.SteeringRadiusConstant.Value = 15000
		end,
	})

	CarModsTab:CreateInput({
		Name = "Steering Radius",
		PlaceholderText = "Value",
		RemoveTextAfterFocusLost = false,
		Callback = function(SRV)
			findCar()
			myCar.Handling.SteeringRadiusConstant.Value = SRV
		end,
	})

	CarModsTab:CreateInput({
		Name = "Braking",
		PlaceholderText = "Value",
		RemoveTextAfterFocusLost = false,
		Callback = function(BKV)
			findCar()
			myCar.Handling.Braking.Value = BKV
		end,
	})

	CarModsTab:CreateSection("Presets")

	CarModsTab:CreateButton({
		Name = "Super Car",

		Callback = function()
			findCar()
			myCar.Handling.MaxSpeed.Value = 10000
			myCar.Handling.Torque.Value = 55555
			myCar.Handling.SteeringRadiusConstant.Value = 15000
			myCar.Handling.FrictionRoad.Value = 250
			myCar.Handling.Nitro.NitroSpeed.Value = 100000
			myCar.Handling.Nitro.NitroForce.Value = 100000
			myCar.Handling.Braking.Value = 100000
			myCar.Handling.TurboJump.TurboJumpHeight.Value = 25
		end,
	})
	CarModsTab:CreateButton({
		Name = "Extreme Car",

		Callback = function()

			findCar()
			myCar.Handling.MaxSpeed.Value = 50000
			myCar.Handling.Torque.Value = 65555
			myCar.Handling.SteeringRadiusConstant.Value = 120000
			myCar.Handling.FrictionRoad.Value = 250
			myCar.Handling.Nitro.NitroSpeed.Value = 400000
			myCar.Handling.Nitro.NitroForce.Value = 400000
			myCar.Handling.Braking.Value = 100000
			myCar.Handling.TurboJump.TurboJumpHeight.Value = 250
		end,
	})
	CarModsTab:CreateButton({
		Name = "Smooth Drifing",

		Callback = function()
			findCar()
			myCar.Handling.MaxSpeed.Value = 5000
			myCar.Handling.Torque.Value = 20000
			myCar.Handling.SteeringRadiusConstant.Value = 15000
			myCar.Handling.FrictionRoad.Value = 100
			myCar.Handling.Nitro.NitroSpeed.Value = 10000
			myCar.Handling.Nitro.NitroForce.Value = 10000
			myCar.Handling.Braking.Value = 100000
			myCar.Handling.TurboJump.TurboJumpHeight.Value = 25
		end,
	})
	CarModsTab:CreateButton({
		Name = "Racing",

		Callback = function()
			findCar()
			myCar.Handling.MaxSpeed.Value = 1000
			myCar.Handling.Torque.Value = 30000
			myCar.Handling.SteeringRadiusConstant.Value = 150000
			myCar.Handling.FrictionRoad.Value = 300
			myCar.Handling.Nitro.NitroSpeed.Value = 100000
			myCar.Handling.Nitro.NitroForce.Value = 100000
			myCar.Handling.Braking.Value = 1000000
			myCar.Handling.TurboJump.TurboJumpHeight.Value = 45
		end,
	})

	CarModsTab:CreateKeybind({
		Name = "Extreme Car keybind",
		CurrentKeybind = "Q",
		HoldToInteract = false,
		Flag = "ExtremeCarKB",
		Callback = function()
			findCar()
			myCar.Handling.MaxSpeed.Value = 50000
			myCar.Handling.Torque.Value = 65555
			myCar.Handling.SteeringRadiusConstant.Value = 120000
			myCar.Handling.FrictionRoad.Value = 250
			myCar.Handling.Nitro.NitroSpeed.Value = 400000
			myCar.Handling.Nitro.NitroForce.Value = 400000
			myCar.Handling.Braking.Value = 100000
			myCar.Handling.TurboJump.TurboJumpHeight.Value = 250
		end,
	})

	-- Autofarm Tab stuff

	local CurrentMoneyAtFarmingStart = 0
	local TimeOfAutofarmStart = nil
	local CurrentAutofarmElapsed = 0
	local waitTime = 2

	local LocalPlayerMoneyValue = game:GetService("Players").LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Money")

	function CalculateEarnings(Value)
		return Value - CurrentMoneyAtFarmingStart
	end

	function FormatNumber(n)
		n = tostring(n)
		return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
	end

	function GetEarnings(Num)
		return string.format("$%s",FormatNumber(CalculateEarnings(Num)))
	end

	AutofarmTab:CreateSection("Automation Status")

	local AF_EARNINGS = AutofarmTab:CreateStatus({
		["Title"] = "Earnings",
		["Status"] = "$0",
		["StatusColor"] = Color3.fromRGB(0, 85, 0),
	})

	local AF_TIME = AutofarmTab:CreateStatus({
		["Title"] = "Elapsed Time",
		["Status"] = "00:00:00",
		["StatusColor"] = Color3.fromRGB(255, 255, 255),
	})

	AutofarmTab:CreateSection("Automation")

	AutofarmTab:CreateToggle({
		Name = "Autofarm",
		CurrentValue = settings.af,
		Flag = "AFToggle", 
		Callback = function(state)

			settings.af = state

			TimeOfAutofarmStart = tick()


			if state then
				VS_MESSAGE("Starting CarmlWare Autofarm, Please Wait!",6.5)
				wait(3)
				VS_MESSAGE("Autofarm Started, Enjoy!",6.5)
				TimeOfAutofarmStart = tick()
				CurrentMoneyAtFarmingStart = LocalPlayerMoneyValue.Value
			elseif not state then
				CurrentMoneyAtFarmingStart = 0

				AF_EARNINGS:Set({
					["Title"] = "Earnings",
					["Status"] = "$0",
					["StatusColor"] = Color3.fromRGB(0, 85, 0),
				})

				AF_TIME:Set({
					["Title"] = "Time Elapsed",
					["Status"] = "00:00:00",
					["StatusColor"] = Color3.fromRGB(255, 255, 255),
				})


				game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.W, false,anal)
				VS_MESSAGE("Autofarm Has been Disabled!",6.5)
			end
		end,
	})

	AutofarmTab:CreateSlider({
		Name = "Reset Interval",
		Increment = 0.1,
		Suffix = "Time",
		CurrentValue = waitTime,
		Flag = "RITM",
		Range = {0,10},

		Callback = function(WS)
			waitTime = WS
		end,
	})


	--	AutofarmTab:CreateSection("Crate Farm")
	--AutofarmTab:CreateLabel("MOVED TO CRATES TAB")




	-- Crates Tab Stuff

	CratesTab:CreateSection("Visuals")

	CratesTab:CreateButton({
		Name = "Crate ESP",

		Callback = function()
			local crates = workspace:getChildren()
			for i=1,#crates do
				if crates[i].ClassName == "Model" then
					local crates2 = crates[i]:getChildren()
					for i=1,#crates2 do
						if crates2[i].ClassName == "Model" then
							local crates3 = crates2[i]:getChildren()
							for i=1,#crates3 do
								if crates3[i].ClassName == "MeshPart" then
									if crates3[i]:findFirstChild("Smoke") then
										if crates3[i]:findFirstChild("BoxHandleAdornment") then
											crates3[i]:findFirstChild("BoxHandleAdornment"):Remove()
										else
											local a = Instance.new("BoxHandleAdornment",crates3[i])
											a.Size = Vector3.new(10,500,6)
											a.SizeRelativeOffset = Vector3.new(0,135,0)
											a.Color3 = Color3.fromRGB(0,255,0)
											a.Transparency = 0.5
											a.AlwaysOnTop = true
											a.Adornee = crates3[i]
											a.ZIndex = 1
											local b = Instance.new("BoxHandleAdornment",crates3[i])
											b.Size = Vector3.new(10,4,6)
											b.Color3 = Color3.fromRGB(0,0,255)
											b.Transparency = 0.3
											b.AlwaysOnTop = true
											b.Adornee = crates3[i]
											b.ZIndex = 1
										end
									end
								end
							end
						end
					end
				end
			end
		end,
	})

	CratesTab:CreateSection("Automation")

	CratesTab:CreateButton({
		Name = "Claim Crates",
		Callback = function()
			local crates = workspace:getChildren()
			for i=1,#crates do
				if crates[i].ClassName == "Model" then
					local crates2 = crates[i]:getChildren()
					for i=1,#crates2 do
						if crates2[i].ClassName == "Model" then
							local crates3 = crates2[i]:getChildren()
							for i=1,#crates3 do
								if crates3[i].ClassName == "MeshPart" then
									if crates3[i]:findFirstChild("Smoke") then
										game.Players.LocalPlayer.Character:MoveTo(Vector3.new(crates3[i].Position.X+30,crates3[i].Position.Y+5,crates3[i].Position.Z))
										wait()
										game.Players.LocalPlayer.Character:MoveTo(Vector3.new(crates3[i].Position.X,crates3[i].Position.Y,crates3[i].Position.Z))
										wait(4)
									end
								end
							end
						end
					end
				end
			end
		end,
	})

	function Format(Int)
		return string.format("%02i", Int)
	end



	function FormatTimeString(N)

		local Minutes = (N - N%60)/60
		N = N - Minutes*60
		local Hours = (Minutes - Minutes%60)/60
		Minutes = Minutes - Hours*60
		if Hours then
			return Format(Hours)..":"..Format(Minutes)..":"..Format(N)
		else
			return Format(Minutes)..":"..Format(N)
		end


	end

	LocalPlayerMoneyValue.Changed:Connect(function()
		if settings.af == true then
			AF_EARNINGS:Set({
				["Title"] = "Earnings",
				["Status"] = GetEarnings(tonumber(LocalPlayerMoneyValue.Value)),
				["StatusColor"] = Color3.fromRGB(0, 85, 0),
			})
		end
	end)

	task.spawn(function()

		game:GetService("RunService").RenderStepped:Connect(function()
			if settings.af == true then
				CurrentAutofarmElapsed = tick() - TimeOfAutofarmStart

				AF_TIME:Set({
					["Title"] = "Time Elapsed",
					["Status"] = FormatTimeString(CurrentAutofarmElapsed),
					["StatusColor"] = Color3.fromRGB(255, 255, 255),
				})

			end
			task.wait()
		end)

		while task.wait() do
			if settings.af then
				--This will be the time it takes (seconds) until your car resets. See line 37
				--Do not change anything below :
				local found = false

				function findVehicle() --Finds your vehicle
					while not found and settings.af do --Loops until your vehicle has been found
						local vehicles = Workspace.Vehicles:getChildren()
						for i=1,#vehicles do
							if vehicles[i]:findFirstChild'owner' then
								if vehicles[i].owner.Value == game:GetService'Players'.LocalPlayer.Name then -- Found your vehicle
									found = true --Setting found to true so loop breaks
									vehicle = vehicles[i] -- Declares vehicle variable to your vehicle
									vehStats = vehicle.Handling -- Declares vehStats variable to vehicle stats folder
									vehStats.MaxSpeed.Value = 950
									vehStats.Torque.Value = 80000
									vehStats.SteeringRadiusConstant.Value = 120000000
								elseif vehicles[i + 1] == nil and not found then
									--Autorespawn would go here
									print("ERROR: Vehicle Not Found!")

								end
							end
						end
						task.wait(1) --Waiting before checking again so we don't crash
					end
					task.wait(2) --We've found the car. Waiting so the car can be properly placed on the highway
					vehicle.PrimaryPart = vehicle.Chassis.VehicleSeat
				end

				function farm() --This is where the magic happens :)
			--[[	Library:MakeNotification({
					Title = "HexHub",
					Desc = "Autofarm Loaded, Enjoy!",
					Icon = 11346938201,
					Time = 5.6
				})]]--

					while task.wait(waitTime) and settings.af do --Waits x seconds before resetting car
						print("Resetting pos")
						vehicle:SetPrimaryPartCFrame(CFrame.new(3109, 236, -125)) --Teleports vehicle to highway
						game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.W, false,anal) --Resets W key
						game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.W, false,anal) --Presses W key to go forward
					end
				end
				findVehicle() --Calls the findVehicle function
				if not pcall(function()
						farm()
					end) and settings.af then --Calls farm function & checks for errors
					print("Failed to find car")
					--VS_MESSAGE("Failed to find car, Please spawn your car!",6.5)

					found = false  --If it errors, it sets found to false and continues looking for your vehicle.
					findVehicle() 
				end
			end
		end

	end)
	VS_MESSAGE("Hexhub V8 Loaded, Enjoy!",6.5)

	Window:BindClose(function()
		Library:Destroy()
		_G.HexHubLOADED = false
	end)

end
