-----------------------------------------
-- ID: 5101
-- Scroll of Arise
-- Teaches the white magic Arise
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(494)
end

function onItemUse(target)
    target:addSpell(494)
end
