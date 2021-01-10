----------------------------------------
-- tpz.effect.INNER_STRENGTH
----------------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addMod(tpz.mod.HPP, 100)
    target:addMod(tpz.mod.PERFECT_COUNTER_ATT, 100)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HPP, 100)
    target:delMod(tpz.mod.PERFECT_COUNTER_ATT, 100)
end

return effect_object
