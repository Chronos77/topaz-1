-----------------------------------
-- tpz.effect.WEAKENED_DAZE_5
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addMod(tpz.mod.MEVA, -30)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MEVA, -30)
end

return effect_object
