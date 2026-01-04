function easeOutBack(t, back, speed)
    back = back or 1.70158
    speed = speed or 1.0
    t = math.min(math.max(t * speed, 0), 1)
    t = t - 1
    return (t * t * ((back + 1) * t + back) + 1)
end

-- cancel punch for some items

swingProgress = easeCustomSec(swingProgress)

local swing_rot
if swingProgress < 0.70016 then
    swing_rot = M:sin(M:clamp(swingProgress, 0, 0.308) * 5.1)
else
    swing_rot = M:sin(M:clamp(swingProgress, 0.70016, 1) * 5.1 - 2)
end

swing_rot = swing_rot * swing_rot * swing_rot
local swing = M:clamp(M:sin(swingProgress * 4.78), 0, 1)
local swing_hit = M:sin(M:clamp(swingProgress, 0.16561, 0.49422) * 4.78 * 2 + 4.7)

local pr = 0.9
local pt1 = 0.9
local pt2 = 0.9

if (I:isOf(P:getMainItem(player), Items:get("minecraft:pink_petals"))
	or I:isOf(P:getMainItem(player), Items:get("minecraft:wildflowers"))
	or I:isOf(P:getMainItem(player), Items:get("minecraft:leaf_litter"))
	--or (I:isIn(P:getMainItem(player), Tags:getVanillaTag("chicken_food")) and ${IncludeSeeds})
	)
	and ${Planting}
then
	if I:isOf(P:getMainItem(player), Items:get("minecraft:pink_petals")) or I:isOf(P:getMainItem(player), Items:get("minecraft:wildflowers")) or I:isOf(P:getMainItem(player), Items:get("minecraft:leaf_litter")) then
		pr = 1; pt1 = -1; pt2 = 1
	end
		M:rotateX(matrices, 25 * swing_hit * pr)
		M:rotateX(matrices, 10 * swing_rot * pr)
    if not I:isOf(P:getMainItem(player), Items:get("minecraft:pink_petals")) and not I:isOf(P:getMainItem(player), Items:get("minecraft:wildflowers")) and not I:isOf(P:getMainItem(player), Items:get("minecraft:leaf_litter")) then
		M:moveY(matrices, -0.05 * swing_rot * pt1)
        M:moveZ(matrices, 0.05 * swing_rot * pt2)
    end

    M:rotateX(matrices, 10 * swing_hit * pr)
    M:rotateX(matrices, 30 * swing_rot * pr)
    M:rotateX(matrices, -10 * swing_rot * pr)
    M:moveY(matrices, -0.05 * swing_rot * pt1)
    M:moveZ(matrices, 0.05 * swing_rot * pt2)
end