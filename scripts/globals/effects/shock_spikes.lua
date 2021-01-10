-----------------------------------
-- tpz.effect.SHOCK_SPIKES
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addMod(tpz.mod.SPIKES, 5)
    target:addMod(tpz.mod.SPIKES_DMG, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.SPIKES, 5)
    target:delMod(tpz.mod.SPIKES_DMG, effect:getPower())
end

return effect_object
