-----------------------------------
-- tpz.effect.INHIBIT_TP
-- Reduces TP Gain By a % Factor
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addMod(tpz.mod.INHIBIT_TP, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.INHIBIT_TP, effect:getPower())
end

return effect_object
