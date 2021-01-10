-----------------------------------
-- tpz.effect.PROWESS
-- From GoV
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addMod(tpz.mod.GOV_CLEARS, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.GOV_CLEARS, effect:getPower())
end

return effect_object
