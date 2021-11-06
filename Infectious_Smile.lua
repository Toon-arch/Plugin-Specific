local Commands = {}
local AddCommand = function(Command, Aliases, ListName, Description, Function) Commands[tostring(Command)] = {["ListName"] = tostring(ListName), ["Description"] = tostring(Description), ["Aliases"] = Aliases or {}, ["Function"] = Function} end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local BackpackLoop = false
local ArmsLoop = nil

AddCommand("smile", {}, "smile", "Start chaos ez", function(args, speaker)
	if BackpackLoop == false then
		execCmd("inf^enable backpack")
		execCmd("antiafk")
		BackpackLoop = true
	end
	execCmd("tptool")
	wait(0.05)
	execCmd("float nonotify")
end)

AddCommand("smilefirstperson", {}, "smilefirstperson", "enhance team specific arm visibility", function(args, speaker)
	if ArmsLoop ~= nil then
		ArmsLoop:Disconect()
		ArmsLoop = nil
		wait(0.1)
	end
	ArmsLoop = RunService.RenderStepped:Connect(function()
		for i,v in pairs(Players.LocalPlayer.Character:GetChildren()) do
			if tostring(Players.LocalPlayer.Team) == "Human" then
				if tostring(v.Name) == ("Right Arm" or "Right Hand") then
					v.LocalTransparencyModifier = 0
				end
			end
			if tostring(Players.LocalPlayer.Team) == "Smiling" then
				if string.match(tostring(v.Name), ("Arm" or "Hand")) then
					v.LocalTransparencyModifier = 0
				end
			end
		end
	end)
end)

AddCommand("unsmilefirstperson", {}, "unsmilefirstperson", "stop enhancing team specific arm visibility", function(args, speaker)
	if ArmsLoop ~= nil then
		ArmsLoop:Disconect()
		ArmsLoop = nil
	end
end)

return Commands
