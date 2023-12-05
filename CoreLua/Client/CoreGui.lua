-- Copyright (©) 2023 BrickVerse.GG by RAMPAGE Interactive, All rights reserved.
-- BrickVerse.GG, BrickEngine, and the BrickLua language is proprietary software of RAMPAGE Interactive.
-- BV Core Script CoreGui.lua written by pasdalover and ArkInfinity.

local Leaderboard = game.Instance.new("Frame")
Leaderboard.Name = "Leaderboard"
Leaderboard.Parent = game.Universe.ClientGui.CoreGui
Leaderboard.Position = Vector2(0.8, 0)
Leaderboard.Size = Vector2(0.2, 0.6)
Leaderboard.BackgroundColor = Color3.new(0, 0, 0)
Leaderboard.Transparency = 0.9

local function AddPlayer(Username)
    local Container = game.Instance.new("Frame")
    Container.Name = Username
    Container.Parent = Leaderboard
    Container.Position = Vector2(0, 0)
    Container.Size = Vector2(1, 0.08)
    Container.Transparency = 0.3
    
    local UsernameLabel = game.Instance.new("TextLabel")
    UsernameLabel.Name = "PlayerLabel"
    UsernameLabel.Parent = Container
    UsernameLabel.Position = Vector2(0.175, 0.227)
    UsernameLabel.Size = Vector2(0.05, 0.442)
    UsernameLabel.Text = Username
    UsernameLabel.TextSize = 29
end

AddPlayer("Player69")