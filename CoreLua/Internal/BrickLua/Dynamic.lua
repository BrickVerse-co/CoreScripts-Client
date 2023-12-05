-- Copyright (©) 2023 BrickVerse.GG by RAMPAGE Interactive, All rights reserved.
-- BrickVerse.GG, BrickEngine, and the BrickLua language is proprietary software of RAMPAGE Interactive.
-- BV Internal API written by pasdalover and ArkInfinity.

BV_INTERNAL_API = {
	new = function(Dynamic)
		local obj = {}
	
		local mt = {
			__index = function(t, k)
				value = BV_INTERNAL_GetDynamicValue(Dynamic, tostring(k))
	
				if type(value) == "string" and value:find("BVD:", 1, true) == 1 then
					return BV_INTERNAL_API.new((value:gsub("%BVD:", "")))
				end
	
				return value
			end,
	
			__newindex = function(t, k, v)
				if k == "Parent" and v.BVDID then
					v = "BVD:" .. v.BVDID
				end
	
				BV_INTERNAL_SetDynamicValue(Dynamic, tostring(k), v)
			end,
		}
	
		setmetatable(obj, mt)
		return obj
	end,
	newDynamic = function(Dynamic)
		return BV_INTERNAL_API.new("BVD:" .. Dynamic.BVDID)
	end
}

GAME_CORE = {
    Script = BV_INTERNAL_API.new(ScriptDynamic),
    Universe = BV_INTERNAL_API.new(UniverseDynamic),
    Scene = BV_INTERNAL_API.new(SceneDynamic),
    Enum = BV_INTERNAL_API.new(EnumDynamic),
    Instance = BV_INTERNAL_API.new(InstanceDynamic)
}

game = {
    Script = BV_INTERNAL_API.new(ScriptDynamic),
    Universe = BV_INTERNAL_API.new(UniverseDynamic),
    Scene = BV_INTERNAL_API.new(SceneDynamic),
    Enum = BV_INTERNAL_API.new(EnumDynamic),
    Instance = BV_INTERNAL_API.new(InstanceDynamic)
}

-- Override internal game dynamic functions to work properly with lua API
setmetatable(game.Instance, {
    __index = {
        new = function(Class)
            return BV_INTERNAL_API.newDynamic(GAME_CORE.Instance.new(Class))
        end,
    },
})

-- Lock metatables.
setmetatable(game, {
    __newindex = function(table, key, value)
        error("Lua API is a read-only metatable")
    end
})

setmetatable(GAME_CORE, {
    __newindex = function(table, key, value)
        error("CoreScript Lua API is a read-only metatable")
    end
})

local Color3 = {}
setmetatable(Color3, {
    __newindex = function(table, key, value)
        error("Lua API is a read-only metatable")
    end,
    __index = {
        new = function(R, G, B)
            return {R,G,B}
        end,
    },
})

if not IsCoreScript then
	GAME_CORE = nil;
end