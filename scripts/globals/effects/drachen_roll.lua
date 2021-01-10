-----------------------------------
-- tpz.effect.DRACHEN_ROLL
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addPetMod(tpz.mod.ACC, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delPetMod(tpz.mod.ACC, effect:getPower())
end

return effect_object
