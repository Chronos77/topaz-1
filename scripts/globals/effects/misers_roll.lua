-----------------------------------
-- tpz.effect.MISERS_ROLL
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addMod(tpz.mod.SAVETP, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.SAVETP, effect:getPower())
end

return effect_object
