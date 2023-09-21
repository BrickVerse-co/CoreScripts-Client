local IsCharacterLoaded, LocalPlayer = false, nil;

Universe.Players:OnLocalPlayerLoaded(function(character)
    LocalPlayer = createMetaTable(character)
    IsCharacterLoaded = true;
end)

Universe.RunService:OnFrame(function(deltaTime)
    if not IsCharacterLoaded then return end
    
    if Universe.UserInputService:isKeyDown(68) == true then
        LocalPlayer.Humanoid.play('right')
        LocalPlayer.Humanoid.Velocity = Vector3(-1, 0, 0)
    end

    if Universe.UserInputService:isKeyDown(65) == true then
        LocalPlayer.Humanoid.play('left')
        LocalPlayer.Humanoid.Velocity = Vector3(1, 0, 0)
    end

    if Universe.UserInputService:isKeyDown(83) == true then
        LocalPlayer.Humanoid.play('backward')
        LocalPlayer.Humanoid.Velocity = Vector3(0, 0, -1)
    end

    if Universe.UserInputService:isKeyDown(87) == true then
        LocalPlayer.Humanoid.play('mixamocom')
        LocalPlayer.Humanoid.Velocity = Vector3(0, 0, 1)
    end

    if Universe.UserInputService:isKeyDown(32) == true then
        LocalPlayer.Humanoid.jump()
    end

    if Universe.UserInputService:isKeyDown(87) == false and Universe.UserInputService:isKeyDown(83) == false and
        Universe.UserInputService:isKeyDown(65) == false and Universe.UserInputService:isKeyDown(68) == false then
        LocalPlayer.Humanoid.play('idle')
    end
    
    Scene.Camera.Position = LocalPlayer.Humanoid.Position + Vector3(0, 4, -5)
end)
