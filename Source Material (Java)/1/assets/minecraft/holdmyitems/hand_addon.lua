global.offhand = 0;
global.fall = 0;
global.water_fall_d = 0;
global.jiggle_d = 0;
global.mainHandSwitch = 0.0;
global.offHandSwitch = 0.0;
global.foodCount = 0.0;
global.a = 0.0;

global.prevMSwingTP = false;
global.prevOSwingTP = false;
global.customMainSwing = 1.0;
global.customOffSwing = 1.0;

global.customMainSwitch = 1.0;
global.customOffSwitch = 1.0;
global.prevUsingItem = false;

global.customMainEnderSwing = 0.0;
global.customOffEnderSwing = 0.0;
global.mainEnderActive = false;
global.offEnderActive = false;
global.blacklistPoseLerp = 0.0;

local l = (bl and 1) or -1

function easeOutBack(t, back, speed)
    back = back or 1.70158
    speed = speed or 1.0
    t = math.min(math.max(t * speed, 0), 1)
    t = t - 1
    return (t * t * ((back + 1) * t + back) + 1)
end

function easeCustomSec(t)
	local t2 = t * t
	local t3 = t2 * t
	return 3 * t * (1 - t) * (1 - t) * 0.44 +
		3 * t2 * (1 - t) * 0.94 +
		t3
end

local blacklistPose = P:isClimbing(player) or P:isCrawling(player) or P:isSwimming(player)
blacklistPoseLerp = (blacklistPose and M:lerp(deltaTime*2, blacklistPoseLerp, 0)) or M:lerp(deltaTime*2, blacklistPoseLerp, 1)

local isItemActive = (not prevUsingItem and prevUsingItem ~= P:isUsingItem(player))
local mainEnderEye = I:isOf(P:getMainItem(player), Items:get("minecraft:ender_eye"))
local offEnderEye = I:isOf(P:getOffhandItem(player), Items:get("minecraft:ender_eye"))

-- note: somehow offhand ender eye when throwing will fire mainhand event

if isItemActive then
    if mainEnderEye then
        customMainEnderSwing = 0.0
        mainEnderActive = true
    elseif offEnderEye and I:getUseAction(P:getMainItem(player))=="none" then
        customOffEnderSwing = 0.0
        offEnderActive = true
    end
end

if mainEnderActive then
    customMainEnderSwing = customMainEnderSwing + deltaTime
    if customMainEnderSwing >= 1 then
        customMainEnderSwing = 0.0
        mainEnderActive = false
    end
end
if offEnderActive then
    customOffEnderSwing = customOffEnderSwing + deltaTime
    if customOffEnderSwing >= 1 then
        customOffEnderSwing = 0.0
        offEnderActive = false
    end
end

local customEnderSwing = ((isItemActive and mainEnderEye) and customMainEnderSwing) or customOffEnderSwing
if isItemActive and offEnderEye and not mainEnderEye and I:getUseAction(P:getMainItem(player))=="none" then customOffSwing = 0 end

if mainHand then
    if prevMSwingTP ~= swingMHand or (isItemActive and mainEnderEye) then
        customMainSwing = 0.0
    end
    if mainHandSwitchEvent then
        customMainSwitch = 0.0
    end
	prevMSwingTP = swingMHand
else
	if prevOSwingTP ~= swingOHand then
        customOffSwing = 0.0
    end
	if offHandSwitchEvent then
        customOffSwitch = 0.0
    end
	prevOSwingTP = swingOHand
end

local switchWaitTime = 5 -- for future me: this-1 is how long before revert back to normal pose

if customMainSwitch < switchWaitTime and ((swingProgress==0 and customMainEnderSwing==0) or blacklistPose) then
	customMainSwitch = ((blacklistPose and customMainSwitch < switchWaitTime-1) and switchWaitTime-1) or customMainSwitch
    customMainSwitch = customMainSwitch + deltaTime * 0.7
elseif mainHand and swingProgress > 0 or customMainEnderSwing > 0 then
	customMainSwitch = (customMainSwitch < switchWaitTime-1 and 0) or customMainSwitch
	customMainSwitch = customMainSwitch - deltaTime * 10
end
if customOffSwitch < switchWaitTime and ((swingProgress==0 and customOffEnderSwing==0) or blacklistPose) then
	customOffSwitch = ((blacklistPose and customOffSwitch < switchWaitTime-1) and switchWaitTime-1) or customOffSwitch
    customOffSwitch = customOffSwitch + deltaTime * 0.7
elseif not mainHand and swingProgress > 0 or customOffEnderSwing > 0 then
	customOffSwitch = (customOffSwitch < switchWaitTime-1 and 0) or customOffSwitch
	customOffSwitch = customOffSwitch - deltaTime * 10
end

customMainSwitch = M:clamp(customMainSwitch, 0, switchWaitTime)
customOffSwitch = M:clamp(customOffSwitch, 0, switchWaitTime)

local customSwitch_val = (mainHand and customMainSwitch) or customOffSwitch
local customMainSwitchClamped = Easings:easeInOutQuint(1-M:clamp(customMainSwitch-(switchWaitTime-1), 0, 1))
local customSwitchClamped = Easings:easeInOutBack(1-M:clamp(customSwitch_val-(switchWaitTime-1), 0, 1))
local customSwitchClampedDelay = Easings:easeInOutExpo(1-M:clamp(customSwitch_val-0.25-(switchWaitTime-1), 0, 1)*1.25)

if customMainSwing < 1.0 then
    customMainSwing = customMainSwing + deltaTime * 0.75
    customMainSwing = M:clamp(customMainSwing, 0, 1)
end
if customOffSwing < 1.0 then
    customOffSwing = customOffSwing + deltaTime * 0.75
    customOffSwing = M:clamp(customOffSwing, 0, 1)
end

local customSwing = (mainHand and customMainSwing) or customOffSwing

prevUsingItem = P:isUsingItem(player)

-------------------------------------------------------

local switch_val = (mainHand and mainHandSwitch) or offHandSwitch
local switchItems = M:sin(M:clamp(switch_val, 0, 0.5) * 3.14 * 0.425)
local switchRot = easeOutBack(switchItems,0.9,1.3)-0.015
local switchMove = Easings:easeOutBack(switchItems)

local throwableList = {
    "minecraft:splash_potion",
    "minecraft:lingering_potion",
    "minecraft:egg",
    "minecraft:blue_egg",
    "minecraft:brown_egg",
    "minecraft:snowball",
    "minecraft:wind_charge",
    "minecraft:ender_eye",
    "minecraft:ender_pearl",
    "minecraft:experience_bottle"
}

local function isThrowable(item)
    for _, id in ipairs(throwableList) do
        if I:isOf(item, Items:get(id)) then
            return true
        end
    end
    return false
end

-- switch item rotate arm

if isThrowable(item) then
	M:rotateZ(matrices, 180 * l * (1-switchRot),0.5*l,-0.5,0)
	M:moveY(matrices, 0.5*(1-switchMove))
end

-- offhand planting
    
function hang_and_drop(t, rise_time, start_val, peak_val, rise_power, fall_power, overshoot_amp, recover_pct)
    if t <= 0 then return start_val end
    if t >= 1 then return start_val end

    rise_power = rise_power or 2.0
    fall_power = fall_power or 3.0
    overshoot_amp = overshoot_amp or 0.17 
    recover_pct = recover_pct or 0.4

    local total_drop_duration = 1.0 - rise_time
    local fall_duration = total_drop_duration * (1 - recover_pct)
    local impact_time = rise_time + fall_duration

    local range_vector = start_val - peak_val 
    local overshoot_val = start_val + (range_vector * overshoot_amp)

    -- PHASE 1:
    if t < rise_time then
        local rt = t / rise_time
        local ease = 1 - math.pow(1 - rt, rise_power)
        return start_val + (peak_val - start_val) * ease

    -- PHASE 2: 
    elseif t < impact_time then
        local rt = (t - rise_time) / fall_duration
        
        local ease = math.pow(rt, fall_power)
        
        return peak_val + (overshoot_val - peak_val) * ease
		
    -- PHASE 3:
    else
        local recovery_duration = 1 - impact_time
        local rt = (t - impact_time) / recovery_duration

        local ease = math.sin(rt * math.pi * 0.5)

        return overshoot_val + (start_val - overshoot_val) * ease
    end
end

if (I:isOf(P:getMainItem(player), Items:get("minecraft:pink_petals"))
	or I:isOf(P:getMainItem(player), Items:get("minecraft:wildflowers"))
	or I:isOf(P:getMainItem(player), Items:get("minecraft:leaf_litter"))
	or (I:isIn(P:getMainItem(player), Tags:getVanillaTag("chicken_food")) and ${IncludeSeeds})
	)
	and (P:getYSpeed(player) * -1 < 0.65 or not P:isSneaking(player))
	and ${Planting}
then
	offhand = M:lerp(mainHandSwitch, offhand, -0.1)
	
	if not mainHand and I:isEmpty(item) and not P:isUsingItem(player) then
		local shiftX = 0.55
		local shiftY = 0.1
		local shiftZ = -0.2
		shiftX = hang_and_drop(customMainSwing, 0.3, 0.55, 0.4)
		shiftZ = hang_and_drop(customMainSwing, 0.35, -0.2, 0)
		shiftY = hang_and_drop(customMainSwing, 0.325, 0.1, 0.2)-(1-customMainSwitchClamped)
		M:rotateY(matrices, M:lerp(blacklistPoseLerp, 0, hang_and_drop(customMainSwing, 0.175, -70, 5, 3, 2.5, 0.15, 0.3)-(180*(1-Easings:easeOutBack(M:clamp(mainHandSwitch*2,0,1)))))*(-1*l),(-0.5+shiftX)*(-1*l),-0.75+shiftY,-0.5+shiftZ)
		M:rotateZ(matrices, M:lerp(blacklistPoseLerp, 0, -30+hang_and_drop(customMainSwing, 0.2, 0, -5, 2, 2.5, 0.15, 0.3))*(-1*l),(-0.5+shiftX)*(-1*l),-0.75+shiftY,-0.5+shiftZ)
		M:rotateX(matrices, M:lerp(blacklistPoseLerp, 0, hang_and_drop(customMainSwing, 0.25, -10, 25, 3, 2)-(180*(1-Easings:easeOutBack(M:clamp(mainHandSwitch*3,0,1))))-(90*(1-customMainSwitchClamped))),(-0.5+shiftX)*(-1*l),-0.75+shiftY,-0.5+shiftZ)
		M:moveX(matrices, M:lerp(blacklistPoseLerp, 0, shiftX*(-1*l)))
		M:moveY(matrices, M:lerp(blacklistPoseLerp, 0, shiftY))
		M:moveZ(matrices, M:lerp(blacklistPoseLerp, 0, shiftZ))
	end
end

-- throwing pots

function hang_and_drop_soft(t, rise_time, start_val, peak_val, rise_power, fall_power)
    if t <= 0 then return start_val end
    if t >= 1 then return start_val end

    rise_power = rise_power or 2.0
    fall_power = fall_power or 3.0

    -- PHASE 1:
    if t < rise_time then
        local rt = t / rise_time
        local ease = 1 - math.pow(1 - rt, rise_power)
        return start_val + (peak_val - start_val) * ease

    -- PHASE 2:
    else
        local drop_duration = 1.0 - rise_time
        local rt = (t - rise_time) / drop_duration
        local ease
        rt = rt * 2
        if rt < 1 then
            ease = 0.5 * math.pow(rt, fall_power)
        else
            ease = 1 - 0.5 * math.pow(2 - rt, fall_power)
        end
        
        return peak_val + (start_val - peak_val) * ease
    end
end

if isThrowable(item) and (P:getYSpeed(player) * -1 < 0.65 or not P:isSneaking(player)) and ${Throwing} then
	local shiftPotX = -0.1*customSwitchClamped--+((I:isOf(item, Items:get("minecraft:ender_eye")) and -M:sin(M:clamp(customSwing*1.1,0,1) * math.pi)*0.1) or 0)
	local shiftPotY = 0.15*customSwitchClampedDelay
	local shiftPotZ = -0.4*customSwitchClamped--+((I:isOf(item, Items:get("minecraft:ender_eye")) and -M:sin(M:clamp(customSwing*1.5,0,1) * math.pi)*0.35) or 0)
	M:rotateZ(matrices, 180*customSwitchClampedDelay*l+((I:isOf(item, Items:get("minecraft:ender_eye")) and -M:sin(M:clamp(customSwing*1.25,0,1) * math.pi)*10) or 0),0.5*l+shiftPotX,-0.5+shiftPotY,0+shiftPotZ)
	M:rotateX(matrices, (-110+hang_and_drop_soft(customSwing, 0.2, 0, 150, 6))*customSwitchClamped+((I:isOf(item, Items:get("minecraft:ender_eye")) and M:sin(M:clamp(customSwing*1.75,0,1) * math.pi)*10) or 0),0.5*l+shiftPotX,-0.5+shiftPotY,0+shiftPotZ)
	M:moveX(matrices, M:lerp(customSwitchClamped,0,shiftPotX+((not bl and -0.2) or 0)))
	M:moveZ(matrices, M:lerp(customSwitchClamped,0,shiftPotZ))
	M:moveY(matrices, M:lerp(customSwitchClamped,0,shiftPotY))
end

if isThrowable(P:getMainItem(player)) and (P:getYSpeed(player) * -1 < 0.65 or not P:isSneaking(player)) and ${Throwing} then
	offhand = M:lerp(mainHandSwitch, offhand, -0.1)
	if not mainHand and I:isEmpty(item) then
		local shiftX = 0.1*(-1*l)
		local shiftY = 0.4
		local shiftZ = 0.25
		shiftY = 0.4+M:sin(customMainSwing*2)*0.7*hang_and_drop_soft(customMainSwing, 0.35, 0, 1, 4, 1.5)-(1-customMainSwitchClamped)
		shiftZ = hang_and_drop_soft(customMainSwing, 0.4, 0.25, 0.75, 4)-((bl and 0.15) or 0)
		M:rotateX(matrices, M:lerp(blacklistPoseLerp, 0, -205+(hang_and_drop_soft(customMainSwing, 0.35, 0, -70, 4, 3))+(180*Easings:easeOutBack(M:clamp(mainHandSwitch*1.5,0,1)))-(230*(1-customMainSwitchClamped))),(-0.5+shiftX)*(-1*l),-0.75+shiftY,-0.5+shiftZ)
		M:rotateY(matrices, M:lerp(blacklistPoseLerp, 0, -20+(hang_and_drop_soft(customMainSwing, 0.3, 0, 90, 3, 4)))*(-1*l),(-0.5+shiftX)*(-1*l),-0.75+shiftY,-0.5+shiftZ)
		M:rotateZ(matrices, M:lerp(blacklistPoseLerp, 0, -25)*(-1*l),(-0.5+shiftX)*(-1*l),-0.75+shiftY,-0.5+shiftZ)
		M:moveX(matrices, M:lerp(blacklistPoseLerp, 0, shiftX))
		M:moveY(matrices, M:lerp(blacklistPoseLerp, 0, shiftY))
		M:moveZ(matrices, M:lerp(blacklistPoseLerp, 0, shiftZ))
	end
end

-- cancel swing

if (I:isOf(P:getMainItem(player), Items:get("minecraft:pink_petals"))
	or I:isOf(P:getMainItem(player), Items:get("minecraft:wildflowers"))
	or I:isOf(P:getMainItem(player), Items:get("minecraft:leaf_litter"))
	or (I:isIn(P:getMainItem(player), Tags:getVanillaTag("chicken_food")) and ${IncludeSeeds})
	)
	and ${Planting}
then

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

	local swingOverall = M:sin(swingProgress * 3.14)
	local swingRise = M:clamp(M:sin(swingProgress * 6.28), 0, 1)
	local swingRiseS = M:sin(swingProgress * 6.28)
	
	local p = 0.5 

	M:rotateY(matrices, -5 * l * swingRiseS * p, 0.3 * l, -0.4, 0)
	M:rotateZ(matrices, -5 * l * swingRiseS * p, 0.3 * l, -0.4, 0)
	M:rotateX(matrices, 2 * swingRiseS * p, 0.3 * l, -0.4, 0)
	M:rotateY(matrices, -15 * l * swingOverall * p)
	M:rotateZ(matrices, 5 * l * swingOverall * p)
	M:rotateX(matrices, -5 * swingRise * p, 0.3 * l, -0.4, 0)
	M:rotateX(matrices, 25 * swing_hit * p, 0.3 * l, -0.4, 0)
	M:rotateX(matrices, -5 * swing_rot * p, 0.3 * l, -0.4, 0)
	M:moveY(matrices, 0 * swing * p)
	M:moveY(matrices, -0.25 * swing_hit * p)
	M:moveZ(matrices, 0.05 * swing_hit * p)
	M:moveZ(matrices, 0.1 * swingRise * p)
	M:moveX(matrices, 0.1 * l * swing * p)
	M:moveZ(matrices, 0.1 * swing * p)
end