-- Copyright (©) 2023 BrickVerse.GG by RAMPAGE Interactive, All rights reserved.
-- BrickVerse.GG, BrickEngine, and the BrickLua language is proprietary software of RAMPAGE Interactive.
-- BV Core Script CharacterController.lua written by pasdalover and ArkInfinity.

local Loaded = false
local LocalPlayer;

warn(game.Universe.Players.OnLocalPlayerLoaded)

game.Universe.Players.OnLocalPlayerLoaded(function(Player)
	LocalPlayer = Player
	Loaded = true
end)

game.Universe.RunService.onFrameBind(function()
	if not Loaded then
		return
	end

	local isKeyDown = game.Universe.UserInputService.isKeyDown

	if isKeyDown(68) == true then
		LocalPlayer.Humanoid.play("right")
		LocalPlayer.Humanoid.Velocity = Vector3(-1, 0, 0)
	end

	if isKeyDown(65) == true then
		LocalPlayer.Humanoid.play("left")
		LocalPlayer.Humanoid.Velocity = Vector3(1, 0, 0)
	end

	if isKeyDown(83) == true then
		LocalPlayer.Humanoid.play("backward")
		LocalPlayer.Humanoid.Velocity = Vector3(0, 0, -1)
	end

	if isKeyDown(87) == true then
		LocalPlayer.Humanoid.play("mixamocom")
		LocalPlayer.Humanoid.Velocity = Vector3(0, 0, 1)
	end

	if isKeyDown(32) == true then
		LocalPlayer.Humanoid.jump()
	end

	if isKeyDown(87) == false and isKeyDown(83) == false and isKeyDown(65) == false and isKeyDown(68) == false then
		LocalPlayer.Humanoid.play("idle")
	end

	game.Scene.Camera.Position = LocalPlayer.Humanoid.Position + Vector3(0, 4, -5)
end)
