-- Cyber and Sapling were here :3
local l = bl and 1 or -1

-- Keep custom global variable assignments using dot notation
global.foodCount = 0.0;
global.foodCountO = 0.0;
global.inspectionSpin = 0.0;

global.timeSpent = 0.0;


global.floating = 0.0;

-- Local variable assignment using the ternary-like structure for 'mainHand'
local easedFoodCounter = Easings:easeInQuart(mainHand and foodCount or foodCountO)

timeSpent = timeSpent + deltaTime * 30

if timeSpent > 100000 then
    timeSpent = 0
end

renderAsBlock:put("minecraft:cake", false)

-- Apple, Golden Apple
if not (string.find(I:getActualName(item), "Plated") or string.find(I:getActualName(item), "plated") or string.find(I:getActualName(item), "Plate") or string.find(I:getActualName(item), "plate")) then
if (
    I:isOf(item, Items:get("minecraft:apple")) or
    I:isOf(item, Items:get("minecraft:golden_apple"))
) then
    M:moveY(matrices, -0.025)
    M:moveX(matrices, -0.05 * l)
    M:rotateX(matrices, -7.5)
    M:rotateY(matrices, -5 * l)
    M:rotateY(matrices, 13 * l * easedFoodCounter)
    M:moveX(matrices, 0.08 * l * easedFoodCounter)
end

-- Enchanted Golden Apple
if I:isOf(item, Items:get("minecraft:enchanted_golden_apple")) then
    M:moveY(matrices, -0.025)
    M:moveX(matrices, -0.05 * l)
    M:rotateX(matrices, -7.5)
    M:rotateY(matrices, -5 * l)
    M:rotateY(matrices, 13 * l * easedFoodCounter)
    M:moveX(matrices, 0.08 * l * easedFoodCounter)
    I:setTranslate(item, true)
    
    particleManager:addParticle(
        particles, 
        false, 
        0.05 * l, 
        0.05, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        1.6, 
        Texture:of("minecraft", "textures/particle/glow.png"), 
        "ITEM", 
        hand, 
        "SPAWN", 
        "ADDITIVE", 
        0, 
        200 + (20 * M:sin(P:getAge(player) * 0.2))
    )
end

-- Dried Kelp
if I:isOf(item, Items:get("minecraft:dried_kelp")) then
    M:moveY(matrices, 0.025)
    M:moveX(matrices, -0.05 * l)
    M:rotateX(matrices, -7.5)
    M:rotateY(matrices, -15 * l)
    M:rotateY(matrices, 15 * l * easedFoodCounter)
    M:moveX(matrices, 0.08 * l * easedFoodCounter)
end

-- Cookie
if I:isOf(item, Items:get("minecraft:cookie")) then
    M:moveY(matrices, -0.025)
    M:moveX(matrices, -0.05 * l)
    M:rotateX(matrices, -7.5)
    M:rotateY(matrices, -5 * l)
    M:rotateY(matrices, 13 * l * easedFoodCounter)
    M:moveX(matrices, 0.08 * l * easedFoodCounter)
end

-- Cake
if I:isOf(item, Items:get("minecraft:cake")) then
    M:moveY(matrices, 0.05)
    M:moveX(matrices, -0.1 * l)
    M:rotateX(matrices, 0)
    M:rotateY(matrices, 0 * l)
end

-- Beetroot
if I:isOf(item, Items:get("minecraft:beetroot")) then
    M:moveY(matrices, 0.15)
    M:moveX(matrices, -0.15 * l)
    M:moveZ(matrices, 0.1)
    M:rotateX(matrices, -7.5)
    M:rotateZ(matrices, -90 * l)
    M:rotateY(matrices, 90 * l)
    M:rotateY(matrices, -90 * l * easedFoodCounter)
    M:rotateX(matrices, -5 * easedFoodCounter)
    M:moveY(matrices, 0.1125 * easedFoodCounter)
    M:moveX(matrices, 0.015 * l * easedFoodCounter)
end

-- Baked Potato, Poisonous Potato, Potato
if (
    I:isOf(item, Items:get("minecraft:baked_potato")) or
    I:isOf(item, Items:get("minecraft:poisonous_potato")) or
    I:isOf(item, Items:get("minecraft:potato"))
) then
    M:moveY(matrices, 0)
    M:moveX(matrices, 0 * l)
    M:moveZ(matrices, -0.075)
    M:rotateY(matrices, 5 * l * easedFoodCounter)
    M:moveX(matrices, 0.05 * l * easedFoodCounter)
    M:moveZ(matrices, 0.075)
end

-- Bowl, Beetroot Soup, Mushroom Stew, Rabbit Stew, Suspicious Stew
if (
    I:isOf(item, Items:get("minecraft:beetroot_soup")) or
    I:isOf(item, Items:get("minecraft:bowl")) or
    I:isOf(item, Items:get("minecraft:mushroom_stew")) or
    I:isOf(item, Items:get("minecraft:rabbit_stew")) or
    I:isOf(item, Items:get("minecraft:suspicious_stew"))
) then
    M:scale(matrices, 1.125, 1.125, 1.125)
    M:moveY(matrices, 0.04)
    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, 0.2)
    M:rotateX(matrices, -97.5)
    M:rotateZ(matrices, 5 * l * easedFoodCounter)
    M:rotateY(matrices, 0 * l * easedFoodCounter)
    M:moveX(matrices, 0.125 * l * easedFoodCounter)
    M:moveY(matrices, -0.05 * easedFoodCounter)
    M:moveZ(matrices, -0.05 * easedFoodCounter)
end

-- Bread
if I:isOf(item, Items:get("minecraft:bread")) then
    M:moveY(matrices, 0.015)
    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, -0.075)
    M:rotateX(matrices, -7.5)
    M:rotateY(matrices, -5 * l)
    M:rotateY(matrices, 13 * l * easedFoodCounter)
    M:moveX(matrices, 0.075 * l * easedFoodCounter)
end
-- Carrot, Golden Carrot
if (
    I:isOf(item, Items:get("minecraft:golden_carrot")) or 
    I:isOf(item, Items:get("minecraft:carrot"))
) then
    M:moveY(matrices, 0.175)
    M:moveX(matrices, -0.0555 * l)
    M:moveZ(matrices, 0.025)
    M:rotateX(matrices, -5)
    M:rotateZ(matrices, -95 * l)
    M:rotateY(matrices, 90 * l)
    M:rotateY(matrices, -90 * l * easedFoodCounter)
    M:rotateX(matrices, -5 * easedFoodCounter)
    M:moveY(matrices, 0.05 * easedFoodCounter)
    M:moveX(matrices, 0.125 * l * easedFoodCounter)
end

-- Chicken, Cooked Chicken
if (
    I:isOf(item, Items:get("minecraft:chicken")) or
    I:isOf(item, Items:get("minecraft:cooked_chicken"))
) then
    M:moveY(matrices, 0.025)
    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, 0.1)
    M:rotateX(matrices, -7.5)
    M:rotateY(matrices, -5 * l)
    M:rotateY(matrices, 10 * l * easedFoodCounter)
    M:moveX(matrices, 0.1 * l * easedFoodCounter)
end

-- Chorus Fruit
if I:isOf(item, Items:get("minecraft:chorus_fruit")) then
    M:moveY(matrices, 0.25)
    M:moveX(matrices, -0.175 * l)
    M:moveZ(matrices, 0.1)
    M:rotateX(matrices, -7.5)
    M:rotateZ(matrices, -90 * l)
    M:rotateY(matrices, 90 * l)
    M:rotateY(matrices, -90 * l * easedFoodCounter)
    M:rotateX(matrices, -6.5 * easedFoodCounter)
    M:moveY(matrices, 0.115 * easedFoodCounter)
    M:moveX(matrices, 0.15 * l * easedFoodCounter)
end

-- Cod, Cooked Cod, Salmon, Cooked Salmon, Tropical Fish
if (
    I:isOf(item, Items:get("minecraft:cod")) or
    I:isOf(item, Items:get("minecraft:cooked_cod")) or
    I:isOf(item, Items:get("minecraft:salmon")) or
    I:isOf(item, Items:get("minecraft:cooked_salmon")) or
    I:isOf(item, Items:get("minecraft:tropical_fish"))
) then
    M:moveY(matrices, 0.15)
    M:moveX(matrices, -0.1 * l)
    M:moveZ(matrices, 0.1)
    M:rotateX(matrices, -7.5)
    M:rotateZ(matrices, 90 * l)
    M:rotateY(matrices, -90 * l)
    M:rotateZ(matrices, -7.5 * l * easedFoodCounter)
    M:moveY(matrices, -0.1 * easedFoodCounter)
    M:moveX(matrices, 0.05 * l * easedFoodCounter)
end

-- Beef, Cooked Beef, Mutton, Cooked Mutton
if (
    I:isOf(item, Items:get("minecraft:cooked_beef")) or
    I:isOf(item, Items:get("minecraft:beef")) or
    I:isOf(item, Items:get("minecraft:cooked_mutton")) or
    I:isOf(item, Items:get("minecraft:mutton"))
) then
    M:moveY(matrices, -0.025)
    M:moveX(matrices, -0.025 * l)
    M:moveZ(matrices, 0)
    M:rotateX(matrices, -5)
    M:rotateY(matrices, 5 * l * easedFoodCounter)
    M:moveX(matrices, 0.075 * l * easedFoodCounter)
end

-- Porkchop, Cooked Porkchop
if (
    I:isOf(item, Items:get("minecraft:cooked_porkchop")) or
    I:isOf(item, Items:get("minecraft:porkchop"))
) then
    M:moveY(matrices, -0.025)
    M:moveX(matrices, -0.025 * l)
    M:rotateX(matrices, -5)
    M:moveZ(matrices, -0.075 * easedFoodCounter)
    M:rotateY(matrices, 5 * l * easedFoodCounter)
    M:moveX(matrices, 0.075 * l * easedFoodCounter)
end
-- Rabbit
if I:isOf(item, Items:get("minecraft:rabbit")) then
    M:moveY(matrices, 0.03)
    M:moveX(matrices, -0.075 * l)
    M:rotateX(matrices, -5)
    M:rotateY(matrices, 5 * l * easedFoodCounter)
    M:moveX(matrices, 0.125 * l * easedFoodCounter)
    M:moveZ(matrices, 0.05 * easedFoodCounter)
end

-- Cooked Rabbit
if I:isOf(item, Items:get("minecraft:cooked_rabbit")) then
    M:moveX(matrices, 0.05 * l)
    M:rotateX(matrices, -5)
    M:rotateX(matrices, 10.5 * easedFoodCounter)
    M:rotateY(matrices, 7.5 * l * easedFoodCounter)
    M:moveX(matrices, 0.05 * l * easedFoodCounter)
    M:moveZ(matrices, 0.1 * easedFoodCounter)
    M:moveY(matrices, -0.1 * easedFoodCounter)
end

-- Melon Slice, Glistering Melon Slice
if (
    I:isOf(item, Items:get("minecraft:melon_slice")) or
    I:isOf(item, Items:get("minecraft:glistering_melon_slice"))
) then
    M:moveY(matrices, 0.025)
    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, 0.025)
    M:rotateX(matrices, -7.5)
    M:rotateY(matrices, -5 * l)
    M:rotateY(matrices, 10 * l * easedFoodCounter)
    M:rotateX(matrices, 7.5 * easedFoodCounter)
    M:moveX(matrices, 0.1 * l * easedFoodCounter)
    M:moveZ(matrices, 0.05 * easedFoodCounter)
end
-- Pufferfish
if I:isOf(item, Items:get("minecraft:pufferfish")) then
    M:moveY(matrices, 0.035)
    M:moveX(matrices, -0.075 * l)
    M:moveZ(matrices, 0.1)
    M:rotateX(matrices, -12.5)
    M:rotateY(matrices, -10 * l)
    M:rotateY(matrices, 200 * l * easedFoodCounter)
    M:moveX(matrices, -0.125 * l * easedFoodCounter)
    M:moveZ(matrices, -0.1 * easedFoodCounter)
    M:moveY(matrices, -0.075 * easedFoodCounter)
end

-- Pumpkin Pie
if I:isOf(item, Items:get("minecraft:pumpkin_pie")) then
    M:moveY(matrices, 0.035)
    M:moveX(matrices, -0.075 * l)
    M:moveZ(matrices, 0.1)
    M:rotateX(matrices, -12.5)
    M:rotateY(matrices, -7.5 * l)
    M:rotateY(matrices, 10 * l * easedFoodCounter)
    M:moveX(matrices, 0.125 * l * easedFoodCounter)
    M:moveY(matrices, 0.1 * easedFoodCounter)
end

-- Rotten Flesh
if I:isOf(item, Items:get("minecraft:rotten_flesh")) then
    M:moveY(matrices, 0.125)
    M:moveX(matrices, -0.075 * l)
    M:moveZ(matrices, 0.1)
    M:rotateX(matrices, 35)
    M:rotateY(matrices, -7.5 * l)
    M:rotateY(matrices, 10 * l * easedFoodCounter)
    M:rotateX(matrices, -35 * easedFoodCounter)
    M:moveX(matrices, 0.125 * l * easedFoodCounter)
    M:moveY(matrices, -0.05 * easedFoodCounter)
end

-- Spider Eye
if I:isOf(item, Items:get("minecraft:spider_eye")) then
    M:moveY(matrices, 0.015)
    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, 0.1)
    M:rotateX(matrices, 0)
    M:rotateZ(matrices, -35 * l)
    M:rotateY(matrices, -7.5 * l)
    M:rotateY(matrices, 10 * l * easedFoodCounter)
    M:rotateZ(matrices, 35 * l * easedFoodCounter)
    M:moveX(matrices, 0.125 * l * easedFoodCounter)
    M:moveY(matrices, 0.025 * easedFoodCounter)
end

-- Sweet Berries
if I:isOf(item, Items:get("minecraft:sweet_berries")) then
    M:moveY(matrices, 0.015)
    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, 0.075)
    M:rotateY(matrices, -90 * l * easedFoodCounter)
    M:rotateZ(matrices, 22.5 * l * easedFoodCounter)
    M:moveZ(matrices, -0.1 * easedFoodCounter)
    M:moveY(matrices, -0.1 * easedFoodCounter)
end

-- Glow Berries
if I:isOf(item, Items:get("minecraft:glow_berries")) then
    M:moveY(matrices, -0.02)
    M:moveX(matrices, -0.05 * l)
    M:rotateX(matrices, -7.5)
    M:rotateY(matrices, -5 * l)
    M:moveX(matrices, 0.08 * l * easedFoodCounter)
    M:moveY(matrices, -0.075 * easedFoodCounter)
    I:setTranslate(item, true)
    
    particleManager:addParticle(
        particles, 
        false, 
        0.1 * l, 
        0.05, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        1.6, 
        Texture:of("minecraft", "textures/particle/glow.png"), 
        "ITEM", 
        hand, 
        "SPAWN", 
        "ADDITIVE", 
        0, 
        200 + (20 * M:sin(P:getAge(player) * 0.2))
    )
end

else
    M:rotateY(matrices, -360 * Easings:easeInOutBack(inspectionSpin))
    M:moveY(matrices, 0.05)
    M:moveZ(matrices, 0.2)
    M:rotateX(matrices, -67)
    M:rotateZ(matrices, 8)
end



if I:isOf(item, Items:get("minecraft:chorus_fruit")) and deltaTime ~= 0 and math.floor(timeSpent + 0.5) % 12 == 0 then

local particle_ticker = function(particle)
    particle.dy = particle.dy;
end

local value = math.random() * 0.3
		--particleManager:addParticle(particles, false, 0.75 * l, -0.2, -0.9, (math.random() * 0.12 - 0.06) * l, math.random() * 0.12, 0, 0, 0, 0, 0, 0, 0, 0.4, Texture:of("minecraft", "textures/particle/firefly.png"), "SCREEN", hand, "OPACITY", "TRANSLUCENT_L", 1, 255, particle_ticker)
		
        --math.random() -- return random number between 0 and 1;
        -- 1
        --math.random() * 0.12 -- return random number between  0 and 0.12
        -- 1 * 0.12 = 0.12

        --math.random() * 0.12 - 0.06 -- return random number between  -0.06 and 0.12
        -- 0 * 0.12 = 0 - 0.06 = -0.06
        local ypos = bl and 0.35 or 0.25
        if not (string.find(I:getActualName(item), "Plated") or string.find(I:getActualName(item), "plated") or string.find(I:getActualName(item), "Plate") or string.find(I:getActualName(item), "plate")) then
        particleManager:addParticle(
            particles, -- particle registry
            false, -- gravity if true then gravity if false then no
            0.3 * l, -- inital position by X axis
            ypos, -- inital position by Y axis
            0.15,  -- inital position by Z axis
             0, -- X speed of the particle
             (math.random() * 0.06 - 0.03), -- Y speed of the particle
             math.random() * 0.08 - 0.04, -- Z speed of the particle
             0, -- X rotation of the particle
             0, -- Y rotation of the particle
             0, -- Z rotation of the particle
             0, -- X rotation speed of the particle
             0, -- Y rotation speed of the particle
             0, -- Z rotation speed of the particle
             0.1, -- Scale of the particle
             Texture:of("minecraft", "textures/particle/end_particle.png"), -- Texture of the particle
             "ITEM", -- Render space of the particle
             hand, -- Hand that triggered the addition of the particle (doens't mean anything for you, but you should pass it here)
             "OPACITY", -- Lifecycle type (Opacity means that particle slowly fades it's opacity when dies). We also Have SCALE lifecycle type (you might already what it  does)
             "ADDITIVE", -- Render type of the particle (TRANSLUCENT, TRANSLUCENT_L, ADDITIVE, CUTOUT_L)
             1, -- Lifetime of the particle
             200, -- Initial opacity of the particle
             particle_ticker -- ticker function
            )
        else
            particleManager:addParticle(
            particles, -- particle registry
            false, -- gravity if true then gravity if false then no
            0 * l, -- inital position by X axis
            0.25, -- inital position by Y axis
            0.15,  -- inital position by Z axis
             math.random() * 0.08 - 0.04, -- X speed of the particle
             (math.random() * 0.06 - 0.03), -- Y speed of the particle
             0, -- Z speed of the particle
             0, -- X rotation of the particle
             0, -- Y rotation of the particle
             0, -- Z rotation of the particle
             0, -- X rotation speed of the particle
             0, -- Y rotation speed of the particle
             0, -- Z rotation speed of the particle
             0.1, -- Scale of the particle
             Texture:of("minecraft", "textures/particle/end_particle.png"), -- Texture of the particle
             "ITEM", -- Render space of the particle
             hand, -- Hand that triggered the addition of the particle (doens't mean anything for you, but you should pass it here)
             "OPACITY", -- Lifecycle type (Opacity means that particle slowly fades it's opacity when dies). We also Have SCALE lifecycle type (you might already what it  does)
             "ADDITIVE", -- Render type of the particle (TRANSLUCENT, TRANSLUCENT_L, ADDITIVE, CUTOUT_L)
             1, -- Lifetime of the particle
             200, -- Initial opacity of the particle
             particle_ticker -- ticker function
            )
        end

end