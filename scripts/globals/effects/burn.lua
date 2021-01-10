-----------------------------------
-- tpz.effect.BURN
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addMod(tpz.mod.REGEN_DOWN, effect:getPower())
    target:addMod(tpz.mod.INT, -getElementalDebuffStatDownFromDOT(effect:getPower()))
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.REGEN_DOWN, effect:getPower())
    target:delMod(tpz.mod.INT, -getElementalDebuffStatDownFromDOT(effect:getPower()))
end

return effect_object
