-- Copyright 2022 BrickVerse.co, subsidiary company of RAMPAGE Interactive.

local module = {}

module.CreateUIInstance = function(BuildData)
    local data = {}
    
    -- BUILD BASICS
    local buildData = data.BuildData
    buildData.Name = BuildData.Name or "Unknown"
    buildData.Position = BuildData.Position or UDim2.new(0.5, -50, 0.5, -20)
    buildData.Size = BuildData.Size or UDim2.new(0, 100, 0, 40)
    buildData.Font = BuildData.Font or Enum.Font.Arial
    buildData.FontSize = BuildData.FontSize or Enum.FontSize.Size18
    buildData.TextColor = BuildData.TextColor or Color.fromRGB(1, 1, 1)
    buildData.Visible = BuildData.Visible or false
    buildData.Class = BuildData.Class or "Frame"
    data.BuildedInstance = nil;

    -- BUILD CLASS
    if BuildData.Class == "Button" then
        data.Activated = false
        data.OnActivation = function() end
    end

    -- BUILD
    if BuildData.SelfBuild ~= nil and BuildData.SelfBuild then
        data.Build()
    end

    data.Edit = function(Setting, NewValue, Rebuild)
        data[Setting] = NewValue

        if Rebuild ~= nil and Rebuild then
            data.Build()
        end
    end

    data.SetParent = function(InstanceParent)
        BuildedInstance.SetParent(InstanceParent)
    end

    data.Build = function()
        local element = data.BuildedInstance or Instance.new(buildData.Class)
        data.BuildedInstance = element
        
        for i,v in pairs(buildData) do
            element[i] = v;
        end
    end

    return data
end

-- example
--[[
    local element = Gui.CreateUIInstance({SelfBuild=false, Name="Hello", Size=UDim2.new(0, 100, 0, 40)})
    element.Build()
    element.Edit("Name", "World")
    element.SetParent(Instance)
]]

return module