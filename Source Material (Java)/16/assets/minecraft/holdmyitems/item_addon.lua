local l = (bl and 1) or -1
local d = (bl and 1) or -0.43
local a = (bl and 1) or 0.8
global.fall_l = 0.0; 
global.pitchAngle = 0.0;
global.pitchAngleO = 0.0;
global.yawAngle = 0.0;
global.yawAngleO = 0.0;

local ptAngle = (mainHand and pitchAngle) or pitchAngleO
local ywAngle = (mainHand and yawAngle) or yawAngleO

local translateIds = {
    "minecraft:torch",
    "minecraft:soul_torch",
    "minecraft:redstone_torch"
}

local flameParticles = {
    "textures/particle/flame1.png",
    "textures/particle/flame2.png",
    "textures/particle/flame3.png",
    "textures/particle/flame4.png",
    "textures/particle/flame5.png",
    "textures/particle/flame6.png",
    "textures/particle/flame7.png",
    "textures/particle/flame8.png",
    "textures/particle/flame9.png",
    "textures/particle/flame10.png",
    "textures/particle/flame11.png",
    "textures/particle/flame12.png",
    "textures/particle/flame13.png",
    "textures/particle/flame14.png",
    "textures/particle/flame15.png",
    "textures/particle/flame16.png",
    "textures/particle/flame17.png",
    "textures/particle/flame18.png",
    "textures/particle/flame19.png",
    "textures/particle/flame20.png",
    "textures/particle/flame21.png",
    "textures/particle/flame22.png"
}

local soulParticles = {
    "textures/particle/soul1.png",
    "textures/particle/soul2.png",
    "textures/particle/soul3.png",
    "textures/particle/soul4.png",
    "textures/particle/soul5.png",
    "textures/particle/soul6.png",
    "textures/particle/soul7.png",
    "textures/particle/soul8.png",
    "textures/particle/soul9.png",
    "textures/particle/soul10.png",
    "textures/particle/soul11.png",
    "textures/particle/soul12.png",
    "textures/particle/soul13.png",
    "textures/particle/soul14.png",
    "textures/particle/soul15.png",
    "textures/particle/soul16.png",
    "textures/particle/soul17.png",
    "textures/particle/soul18.png",
    "textures/particle/soul19.png",
    "textures/particle/soul20.png",
    "textures/particle/soul21.png",
    "textures/particle/soul22.png",
}

-- move torches down
do
    local should_translate = false
    for _, id in ipairs(translateIds) do
        if I:isOf(item, Items:get(id)) then
            should_translate = true
            break
        end
    end
    if should_translate then
        M:moveY(matrices, -0.085)
        M:moveX(matrices, 0.07 * l)


        M:rotateY(matrices, -5 * l)
        M:rotateZ(matrices, 0 * l)

        M:scale(matrices, 1.35, 1.35, 1.35)
        I:setTranslate(item, true)
    end
end

-- torch particles
if I:isOf(item, Items:get("minecraft:torch")) then
    local age = P:getAge(player)
    local frameIndex = math.floor(age * 0.45) % #flameParticles
    local flameTexture = Texture:of("minecraft", flameParticles[frameIndex + 1]) -- +1 for 1-based indexing

    particleManager:addParticle(
        particles,
        false,
        0.88 * d,
        0.62,
        0.3,
        0, 0, 0, 0, 0, 0, 0, 0, 0,
        2,
        flameTexture,
        "ITEM",
        hand,
        "SPAWN",
        "CUTOUT_L",
        0,
        255
    )
end

if I:isOf(item, Items:get("minecraft:torch")) then
    particleManager:addParticle(particles,
        false,
        0.75 * l,       
        0.50,      
        0.15,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        2.5, Texture:of("minecraft", "textures/particle/w_glow.png"), "ITEM", hand, "SPAWN", "ADDITIVE", 0, 200 + (20 * M:sin(P:getAge(player) * 0.2)))
end

-- soul torch particles
if I:isOf(item, Items:get("minecraft:soul_torch")) then
    local age = P:getAge(player)
    local frameIndex = math.floor(age * 0.45) % #soulParticles
    local flameTexture = Texture:of("minecraft", soulParticles[frameIndex + 1]) -- +1 for 1-based indexing

    particleManager:addParticle(
        particles,
        false,
        0.88 * d,
        0.62,
        0.3,
        0, 0, 0, 0, 0, 0, 0, 0, 0,
        2,
        flameTexture,
        "ITEM",
        hand,
        "SPAWN",
        "CUTOUT_L",
        0,
        255
    )
end

if I:isOf(item, Items:get("minecraft:soul_torch")) then
    particleManager:addParticle(particles,
        false,
       0.75 * l,       
        0.50,      
        0.15,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        2.5, Texture:of("minecraft", "textures/particle/b_glow.png"), "ITEM", hand, "SPAWN", "ADDITIVE", 0, 200 + (20 * M:sin(P:getAge(player) * 0.2)))
end

-- redstone particles
if I:isOf(item, Items:get("minecraft:redstone_torch")) then
    particleManager:addParticle(particles,
        false,
        0.75 * l,       
        0.35,      
        0.20,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        2.5, Texture:of("minecraft", "textures/particle/r_glow.png"), "ITEM", hand, "SPAWN", "ADDITIVE", 0, 200 + (20 * M:sin(P:getAge(player) * 0.2)))
end

--literally all the blocks
local blocks  = {

}
for _, block in ipairs(blocks) do
    if I:isOf(item, Items:get(block)) then
            M:rotateY(matrices, 30*l)
            M:rotateX(matrices, -20)
            M:scale(matrices, 1.3, 1.3, 1.3)
            M:moveY(matrices, -0.25)
    end
end

--buckets
if (
    I:isOf(item, Items:get("minecraft:bucket")) or
    I:isOf(item, Items:get("minecraft:water_bucket")) or
    I:isOf(item, Items:get("minecraft:lava_bucket")) or
    I:isOf(item, Items:get("minecraft:powder_snow_bucket")) or
    I:isOf(item, Items:get("minecraft:pufferfish_bucket")) or
    I:isOf(item, Items:get("minecraft:cod_bucket")) or
    I:isOf(item, Items:get("minecraft:tropical_fish_bucket")) or
    I:isOf(item, Items:get("minecraft:salmon_bucket")) or
    I:isOf(item, Items:get("minecraft:tadpole_bucket")) or
    I:isOf(item, Items:get("minecraft:axolotl_bucket")) 
) then
    M:moveX(matrices, -0.10 * l)
    M:moveY(matrices, 0.08)
    M:moveZ(matrices, -0.12)

    M:rotateX(matrices, 55)
    M:rotateZ(matrices, 25 * l)
    M:rotateY(matrices, 165 * l)

    M:scale(matrices, 1.05, 1.05, 1.05)
    
end

--milk bucket
if (
    I:isOf(item, Items:get("minecraft:milk_bucket"))
) then
    M:moveX(matrices, -0.15 * l)
    M:moveY(matrices, 0.10)  
    M:moveZ(matrices, -0.01) 

    M:rotateX(matrices, 100)   
    M:rotateY(matrices, 187 * l)  
    M:rotateZ(matrices, -209 * l)
    
 M:scale(matrices, 1.05, 1.05, 1.05)
end

if P:isUsingItem(player) and I:isOf(item, Items:get("minecraft:milk_bucket")
) then
    M:scale(matrices, 1.05, 1.05, 1.05)
    M:rotateX(matrices, 10)
    M:rotateY(matrices, 10 * d)
    M:rotateZ(matrices, 35 * l)
    M:moveY(matrices, -0)
    M:moveX(matrices, 0.03 * l)
    M:moveZ(matrices, 0.1)
end

--music discs
if (
    I:isOf(item, Items:get("minecraft:music_disc_5")) or
    I:isOf(item, Items:get("minecraft:music_disc_11")) or
    I:isOf(item, Items:get("minecraft:music_disc_13")) or
    I:isOf(item, Items:get("minecraft:music_disc_blocks")) or
    I:isOf(item, Items:get("minecraft:music_disc_cat")) or
    I:isOf(item, Items:get("minecraft:music_disc_chirp")) or
    I:isOf(item, Items:get("minecraft:music_disc_creator_music_box")) or
    I:isOf(item, Items:get("minecraft:music_disc_creator")) or
    I:isOf(item, Items:get("minecraft:music_disc_far")) or
    I:isOf(item, Items:get("minecraft:music_disc_lava_chicken")) or
    I:isOf(item, Items:get("minecraft:music_disc_mall")) or
    I:isOf(item, Items:get("minecraft:music_disc_mellohi")) or
    I:isOf(item, Items:get("minecraft:music_disc_otherside")) or
    I:isOf(item, Items:get("minecraft:music_disc_pigstep")) or
    I:isOf(item, Items:get("minecraft:music_disc_precipice")) or
    I:isOf(item, Items:get("minecraft:music_disc_relic")) or
    I:isOf(item, Items:get("minecraft:music_disc_stal")) or
    I:isOf(item, Items:get("minecraft:music_disc_strad")) or
    I:isOf(item, Items:get("minecraft:music_disc_tears")) or
    I:isOf(item, Items:get("minecraft:music_disc_wait")) or
    I:isOf(item, Items:get("minecraft:music_disc_ward"))
) then
    M:moveX(matrices, -0.08 * l)
    M:moveY(matrices, -0.205)
    M:moveZ(matrices, -0.13)

    M:rotateX(matrices, -50)
    M:rotateY(matrices, 95 * l)
    M:rotateZ(matrices, 50 * l)

    M:scale(matrices, 1.35, 1.35, 1.35)
end

--fire charge
if (
    I:isOf(item, Items:get("minecraft:fire_charge"))
) then
    M:moveY(matrices, 0)
    M:rotateZ(matrices, -5 * l)

    M:scale(matrices, 1.25, 1.25, 1.25)
end

--throwables
if (
    I:isOf(item, Items:get("minecraft:snowball")) or
    I:isOf(item, Items:get("minecraft:egg")) or
    I:isOf(item, Items:get("minecraft:brown_egg")) or
    I:isOf(item, Items:get("minecraft:blue_egg")) or
    I:isOf(item, Items:get("minecraft:turtle_egg"))
) then
    M:moveY(matrices, 0)
    M:rotateZ(matrices, -5 * l)

    M:scale(matrices, 1, 1, 1)
end

--flower pots
if (
    I:isOf(item, Items:get("minecraft:flower_pot"))
) 
then
    M:moveX(matrices, 0.23 * l)
    M:moveY(matrices, -0)
    M:moveZ(matrices, -0.05)

    M:rotateX(matrices, 0.2)
    M:rotateY(matrices, -5 * l)
    M:rotateZ(matrices, 4 * l)

    M:scale(matrices, 1.9, 1.9, 1.9)
end

--flint and steel
if (
    I:isOf(item, Items:get("minecraft:flint_and_steel"))
) 
then
    M:rotateX(matrices, -10)
    M:rotateZ(matrices, -5)

    M:scale(matrices, 1.1, 1.1, 1.1)
end

--banners
if (
    I:isOf(item, Items:get("minecraft:bordure_indented_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:creeper_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:piglin_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:flower_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:field_masoned_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:skull_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:mojang_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:guster_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:globe_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:flow_banner_pattern")) 
) then
   M:rotateX(matrices, M:clamp(P:getPitch(player) / 2.5, -20, 90) + ptAngle + ywAngle * 0.5, 0, -0.13, 0)

    M:moveY(matrices, -0.2)
    M:moveZ(matrices, 0.1)
    M:rotateX(matrices, -130)
    M:rotateZ(matrices, -180)
    M:scale(matrices, 1.4, 1.4, 1.4)
end

-- boats
if (
    I:isOf(item, Items:get("minecraft:oak_boat")) or
    I:isOf(item, Items:get("minecraft:spruce_boat")) or
    I:isOf(item, Items:get("minecraft:birch_boat")) or
    I:isOf(item, Items:get("minecraft:jungle_boat")) or
    I:isOf(item, Items:get("minecraft:acacia_boat")) or
    I:isOf(item, Items:get("minecraft:dark_oak_boat")) or
    I:isOf(item, Items:get("minecraft:mangrove_boat")) or
    I:isOf(item, Items:get("minecraft:cherry_boat")) or
    I:isOf(item, Items:get("minecraft:bamboo_raft")) or 
    I:isOf(item, Items:get("minecraft:oak_chest_boat")) or
    I:isOf(item, Items:get("minecraft:spruce_chest_boat")) or
    I:isOf(item, Items:get("minecraft:birch_chest_boat")) or
    I:isOf(item, Items:get("minecraft:jungle_chest_boat")) or
    I:isOf(item, Items:get("minecraft:acacia_chest_boat")) or
    I:isOf(item, Items:get("minecraft:dark_oak_chest_boat")) or
    I:isOf(item, Items:get("minecraft:mangrove_chest_boat")) or
    I:isOf(item, Items:get("minecraft:cherry_chest_boat")) or
    I:isOf(item, Items:get("minecraft:bamboo_chest_raft")) or
    I:isOf(item, Items:get("minecraft:pale_oak_chest_boat")) or
    I:isOf(item, Items:get("minecraft:pale_oak_boat"))

) then
    M:moveY(matrices, 0.15)
    M:rotateX(matrices, -120)
    M:rotateZ(matrices, 180 * l)
    M:rotateY(matrices, 4 * l)
    M:scale(matrices, 1.35, 1.35, 1.35)
end

local itemIds = {"minecraft:repeater", "minecraft:comparator", "minecraft:cake", "minecraft:campfire", "minecraft:soul_campfire", "minecraft:oak_sign", "minecraft:spruce_sign", "minecraft:birch_sign", "minecraft:jungle_sign", "minecraft:acacia_sign", "minecraft:dark_oak_sign", "minecraft:mangrove_sign", "minecraft:cherry_sign", "minecraft:pale_oak_sign", "minecraft:bamboo_sign", "minecraft:crimson_sign", "minecraft:warped_sign", "minecraft:end_crystal", "minecraft:lever"}
for _, id in ipairs(itemIds) do
    renderAsBlock:put(id, false)
end

-- comp and rep
if (
    I:isOf(item, Items:get("minecraft:repeater")) or
    I:isOf(item, Items:get("minecraft:comparator")) 

) then
    M:moveY(matrices, -0.1)
    M:moveZ(matrices, 0.15)
    M:moveX(matrices, 0.15 * l)
    M:rotateX(matrices, -85)
    M:rotateZ(matrices, 35 * l)
    M:rotateY(matrices, 7 * l)
    M:scale(matrices, 1.35, 1.35, 1.35)
end

-- cake and campfire
if (
    I:isOf(item, Items:get("minecraft:cake")) or 
    I:isOf(item, Items:get("minecraft:campfire")) or
    I:isOf(item, Items:get("minecraft:soul_campfire")) 

) then
    M:moveY(matrices, 0.1)
    M:moveZ(matrices, 0.15)
    M:moveX(matrices, 0.10 * l)
    M:rotateX(matrices, -75)
    M:rotateZ(matrices, 15 * l)
    M:rotateY(matrices, 7 * l)
    M:scale(matrices, 1.35, 1.35, 1.5)
end

-- cake and campfire
if (
    I:isOf(item, Items:get("minecraft:lever")) 

) then
    M:moveY(matrices, 0.05)
    M:moveZ(matrices, 0.10)
    M:moveX(matrices, 0.05 * l)
    M:rotateX(matrices, -75)
    M:rotateZ(matrices, 10 * l)
    M:rotateY(matrices, 7 * l)
    M:scale(matrices, 1.35, 1.1, 1.35)
end

--facing short
if (
    I:isOf(item, Items:get("minecraft:ender_pearl")) or
    I:isOf(item, Items:get("minecraft:ender_eye")) or
    I:isOf(item, Items:get("minecraft:wind_charge")) or
    I:isOf(item, Items:get("minecraft:firework_rocket"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)
    M:rotateY(matrices, 95 * l)

    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, -0.05)
    M:scale(matrices, 1.05, 1.05, 1.05)
end

--facing short
if (
    I:isOf(item, Items:get("minecraft:coal")) or
    I:isOf(item, Items:get("minecraft:charcoal"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)
    M:rotateY(matrices, 95 * l)

    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, -0.05)
    M:scale(matrices, 1, 1.2, 1)
end

--facing short
if (
    I:isOf(item, Items:get("minecraft:clay_ball"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)
    M:rotateY(matrices, 95 * l)

    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, -0.05)
    M:scale(matrices, 1, 1, 1)
end

--raw ingredients
if (
    I:isOf(item, Items:get("minecraft:raw_gold")) or
    I:isOf(item, Items:get("minecraft:raw_copper")) or
    I:isOf(item, Items:get("minecraft:raw_iron"))
) then

    M:moveX(matrices, 0.05 * l)
    M:moveZ(matrices, -0.05)

    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)
    M:rotateY(matrices, 0 * l)
    
    M:scale(matrices, 1.3, 1, 1.3)
end

--ingredients
if (

    I:isOf(item, Items:get("minecraft:emerald")) or
    I:isOf(item, Items:get("minecraft:diamond")) or
    I:isOf(item, Items:get("minecraft:lapis_lazuli")) 
) then

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.1)
    M:moveY(matrices, -0.1)

    M:rotateZ(matrices, -7 * l)
    M:rotateX(matrices, -0.3)
    M:rotateY(matrices, 0 * l)
    
    M:scale(matrices, 1.1, 1.25, 1.1)
end

--hmm standard
if (

    I:isOf(item, Items:get("minecraft:quartz")) or
    I:isOf(item, Items:get("minecraft:gold_nugget")) or
    I:isOf(item, Items:get("minecraft:iron_nugget")) or
    I:isOf(item, Items:get("minecraft:amethyst_shard")) or
    I:isOf(item, Items:get("minecraft:honeycomb")) or
    I:isOf(item, Items:get("minecraft:nautilus_shell")) or
    I:isOf(item, Items:get("minecraft:gunpowder")) or
    I:isOf(item, Items:get("minecraft:glowstone_dust")) or
    I:isOf(item, Items:get("minecraft:bone_meal")) or
    I:isOf(item, Items:get("minecraft:redstone")) or
    I:isOf(item, Items:get("minecraft:blaze_powder")) or
    I:isOf(item, Items:get("minecraft:sugar")) or
    I:isOf(item, Items:get("minecraft:disc_fragment_5")) or
    I:isOf(item, Items:get("minecraft:end_crystal")) or
    I:isOf(item, Items:get("minecraft:armor_stand")) 
    
) then

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.05)
    M:moveY(matrices, -0)

    M:rotateZ(matrices, -7 * l)
    M:rotateX(matrices, -0.3)
    M:rotateY(matrices, 4 * l)
    
    M:scale(matrices, 1.1, 1.1, 1.1)
end

--shell
if (
  I:isOf(item, Items:get("minecraft:shulker_shell"))
    
) then

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.05)
    M:moveY(matrices, 0.05)

    M:rotateZ(matrices, -7 * l)
    M:rotateX(matrices, -0.3)
    M:rotateY(matrices, 4 * l)
    
    M:scale(matrices, 1.2, 1.2, 1.2)
end

--books
if (
    I:isOf(item, Items:get("minecraft:book")) or
    I:isOf(item, Items:get("minecraft:enchanted_book"))
    
) then

    M:moveX(matrices, 0.1 * l)
    M:moveZ(matrices, 0.07)
    M:moveY(matrices, 0.2)

    M:rotateZ(matrices, -30 * l)
    M:rotateX(matrices, -20)
    M:rotateY(matrices, 40 * l)
    
    M:scale(matrices, 1.1, 1.2, 1.1)
end

--ingredients row 2
if (

    I:isOf(item, Items:get("minecraft:writable_book")) or
    I:isOf(item, Items:get("minecraft:written_book"))
    
) then

    M:moveX(matrices, -0.03 * l)
    M:moveZ(matrices, 0.05)
    M:moveY(matrices, -0.05)

    M:rotateZ(matrices, -7 * l)
    M:rotateX(matrices, -30)
    M:rotateY(matrices, 4 * l)
    
    M:scale(matrices, 1.1, 1.1, 1.1)
end


--bone
if (

    I:isOf(item, Items:get("minecraft:bone")) or
    I:isOf(item, Items:get("minecraft:blaze_rod")) or
    I:isOf(item, Items:get("minecraft:breeze_rod"))

) then

    M:rotateY(matrices, 85 * l)
    M:rotateX(matrices, 0 )
    M:rotateZ(matrices, -4 * l)

    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, -0.07)
    M:moveY(matrices, -0.05)
end

--ingots
if (
    I:isOf(item, Items:get("minecraft:iron_ingot")) or
    I:isOf(item, Items:get("minecraft:gold_ingot")) or
    I:isOf(item, Items:get("minecraft:copper_ingot")) or
    I:isOf(item, Items:get("minecraft:netherite_ingot")) or
    I:isOf(item, Items:get("minecraft:brick")) or
    I:isOf(item, Items:get("minecraft:nether_brick")) or
    I:isOf(item, Items:get("minecraft:resin_brick"))
    
) then

    M:moveX(matrices, 0 * l)
    M:moveZ(matrices, -0.1)
    M:moveY(matrices, -0)

    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, -0.3)
    M:rotateY(matrices, 15 * l)
    
    M:scale(matrices, 1.15, 1.15, 1.15)
end

--scrap
if (
    I:isOf(item, Items:get("minecraft:netherite_scrap")) 
    
) then

    M:moveX(matrices, 0 * l)
    M:moveZ(matrices, 0)
    M:moveY(matrices, -0)

    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, -0.3)
    M:rotateY(matrices, 15 * l)
    
    M:scale(matrices, 1.15, 1.15, 1.15)
end

--totem
if (
    I:isOf(item, Items:get("minecraft:totem_of_undying"))
) then
    M:rotateZ(matrices, -9 * l)
    M:rotateX(matrices, -4)
    M:rotateY(matrices, 55 * l)

    M:moveX(matrices, -0.0 * l)
    M:moveZ(matrices, -0.01)
    M:moveY(matrices, -0.01)
    M:scale(matrices, 1.2, 1.2, 1.2)
end

-- shears
if I:isOf(item, Items:get("minecraft:shears")) 

then
    M:rotateZ(matrices, -45 * l)  
    M:rotateX(matrices, -30)  
    M:rotateY(matrices, -25 * l) 

    M:moveX(matrices, 0.05 * l) 
    M:moveZ(matrices, -0.1)

    M:scale(matrices, 1.3, 1.4, 1.3)
end

--bundle
if (
I:isOf(item, Items:get("minecraft:white_bundle")) or
I:isOf(item, Items:get("minecraft:light_gray_bundle")) or
I:isOf(item, Items:get("minecraft:gray_bundle")) or
I:isOf(item, Items:get("minecraft:black_bundle")) or
I:isOf(item, Items:get("minecraft:brown_bundle")) or
I:isOf(item, Items:get("minecraft:red_bundle")) or
I:isOf(item, Items:get("minecraft:orange_bundle")) or
I:isOf(item, Items:get("minecraft:yellow_bundle")) or
I:isOf(item, Items:get("minecraft:lime_bundle")) or
I:isOf(item, Items:get("minecraft:green_bundle")) or
I:isOf(item, Items:get("minecraft:cyan_bundle")) or
I:isOf(item, Items:get("minecraft:light_blue_bundle")) or
I:isOf(item, Items:get("minecraft:blue_bundle")) or
I:isOf(item, Items:get("minecraft:purple_bundle")) or
I:isOf(item, Items:get("minecraft:magenta_bundle")) or
I:isOf(item, Items:get("minecraft:pink_bundle")) or
I:isOf(item, Items:get("minecraft:bundle")) 
)
    
then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)
    M:rotateY(matrices, 95 * l)

    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, -0.05)
    M:scale(matrices, 1.3, 1.3, 1.3)
end

if (
    I:isOf(item, Items:get("minecraft:suspicious_stew")) or
    I:isOf(item, Items:get("minecraft:rabbit_stew")) or
    I:isOf(item, Items:get("minecraft:mushroom_stew")) or
    I:isOf(item, Items:get("minecraft:beetroot_soup")) or
    I:isOf(item, Items:get("minecraft:bowl")) 
    
) then
  M:moveX(matrices, 0 * l)
    M:moveY(matrices, 0.13)  
    M:moveZ(matrices, 0.2) 

    M:rotateX(matrices, 115)   
    M:rotateY(matrices, 180 * l)  
    M:rotateZ(matrices, -180 * l)
    
    M:scale(matrices, 1.2, 1.2, 1.2)
end

--horn
if (
    I:isOf(item, Items:get("minecraft:goat_horn"))
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)
    M:rotateY(matrices, 0 * l)

    M:moveX(matrices, 0.05 * l)
    M:moveZ(matrices, -0.05)
    M:scale(matrices, 1.3, 1.3, 1.3)
end

if P:isUsingItem(player) and I:isOf(item, Items:get("minecraft:goat_horn")
) then
    M:scale(matrices, 1.3, 1.3, 1.3)
    M:rotateX(matrices, 10)
    M:rotateY(matrices, 40 * l)
    M:rotateZ(matrices, 05 * l)
    M:moveZ(matrices, -0.05) 
    M:moveX(matrices, -0.02* l)
    M:moveY(matrices, -0.05)
   
end

--firework
if (
    I:isOf(item, Items:get("minecraft:firework_rocket"))
) then
    M:moveX(matrices, -0 * l)
    M:moveZ(matrices, -0.03)
    M:scale(matrices, 1.2, 1.2, 1.2)
end

--sign
if (
    I:isOf(item, Items:get("minecraft:oak_sign")) or
    I:isOf(item, Items:get("minecraft:spruce_sign")) or
    I:isOf(item, Items:get("minecraft:birch_sign")) or
    I:isOf(item, Items:get("minecraft:jungle_sign")) or
    I:isOf(item, Items:get("minecraft:acacia_sign")) or
    I:isOf(item, Items:get("minecraft:dark_oak_sign")) or
    I:isOf(item, Items:get("minecraft:mangrove_sign")) or
    I:isOf(item, Items:get("minecraft:cherry_sign")) or
    I:isOf(item, Items:get("minecraft:pale_oak_sign")) or
    I:isOf(item, Items:get("minecraft:bamboo_sign")) or
    I:isOf(item, Items:get("minecraft:crimson_sign")) or
    I:isOf(item, Items:get("minecraft:warped_sign"))
) then
    M:moveX(matrices, 0.06 * l)
    M:moveZ(matrices, -0.03)
    M:rotateZ(matrices, -8 * l)
    M:scale(matrices, 1, 1, 1)
end

--lead
if (
    I:isOf(item, Items:get("minecraft:lead"))
) then
    M:rotateY(matrices, 20 * l)
    M:moveZ(matrices, -0.2 )
    M:moveX(matrices, 0.1 * l)
    M:rotateZ(matrices, -10 * l)
     M:scale(matrices, 1.2, 1, 1)
end

--food
if (
   I:isOf(item, Items:get("minecraft:apple")) or
    I:isOf(item, Items:get("minecraft:golden_apple")) or
    I:isOf(item, Items:get("minecraft:enchanted_golden_apple")) or
    I:isOf(item, Items:get("minecraft:sweet_berries")) or
    I:isOf(item, Items:get("minecraft:chorus_fruit")) or
    I:isOf(item, Items:get("minecraft:pufferfish")) or
    I:isOf(item, Items:get("minecraft:honey_bottle")) or
    I:isOf(item, Items:get("minecraft:glass_bottle")) or
    I:isOf(item, Items:get("minecraft:experience_bottle")) or
    I:isOf(item, Items:get("minecraft:potion")) or
    I:isOf(item, Items:get("minecraft:splash_potion")) or
    I:isOf(item, Items:get("minecraft:lingering_potion")) or
    I:isOf(item, Items:get("minecraft:dragon_breath")) or
    I:isOf(item, Items:get("minecraft:ominous_bottle")) 
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.05)
    M:scale(matrices, 1.05, 1.05, 1.05)
end

--spider eyes
if (
    I:isOf(item, Items:get("minecraft:spider_eye")) or
    I:isOf(item, Items:get("minecraft:fermented_spider_eye"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.05 * l)
    M:moveZ(matrices, -0.04)
    M:scale(matrices, 1.1, 1.1, 1.1)
end


--pie
if (
    I:isOf(item, Items:get("minecraft:pumpkin_pie"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0)
    M:moveY(matrices, 0)
    M:scale(matrices, 1.15, 1.15, 1.15)
end

--potatoes
if (
    I:isOf(item, Items:get("minecraft:baked_potato")) or
    I:isOf(item, Items:get("minecraft:poisonous_potato"))
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.05)
    M:scale(matrices, 1.0, 1.0, 1.0)
end

--potato
if (
    I:isOf(item, Items:get("minecraft:potato"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.02)
    M:scale(matrices, 1.0, 1.0, 1.0)
end

--meaty boys
if (
    I:isOf(item, Items:get("minecraft:beef")) or
    I:isOf(item, Items:get("minecraft:cooked_beef")) or
    I:isOf(item, Items:get("minecraft:porkchop")) or
    I:isOf(item, Items:get("minecraft:cooked_porkchop")) or
    I:isOf(item, Items:get("minecraft:mutton")) or
    I:isOf(item, Items:get("minecraft:cooked_mutton")) or
    I:isOf(item, Items:get("minecraft:rotten_flesh"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.1)
    M:scale(matrices, 1.2, 1.4, 1.2)
end

--beefy food
if (
    I:isOf(item, Items:get("minecraft:cooked_chicken")) or
    I:isOf(item, Items:get("minecraft:cooked_rabbit")) or
    I:isOf(item, Items:get("minecraft:rabbit")) or
    I:isOf(item, Items:get("minecraft:chicken"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.15)
    M:moveZ(matrices, 0.05)
    M:scale(matrices, 1.15, 1.15, 1.15)
end

--bread
if (
    I:isOf(item, Items:get("minecraft:bread"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.15)
    M:moveZ(matrices, 0.05)
    M:scale(matrices, 1.15, 1.25, 1.15)
end

--cookie
if (
     I:isOf(item, Items:get("minecraft:cookie"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.07)
    M:moveZ(matrices, 0.05)
    M:scale(matrices, 1.15, 1.25, 1.15)
end

--fishy food
if (
    I:isOf(item, Items:get("minecraft:cod")) or
    I:isOf(item, Items:get("minecraft:cooked_cod")) or
    I:isOf(item, Items:get("minecraft:salmon")) or
    I:isOf(item, Items:get("minecraft:cooked_salmon")) or
    I:isOf(item, Items:get("minecraft:tropical_fish"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.1)
    M:moveZ(matrices, 0.05)
    M:scale(matrices, 1.3, 1.4, 1.3)
end

--kelp
if (
    I:isOf(item, Items:get("minecraft:dried_kelp"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.02)
    M:scale(matrices, 1.05, 1.05, 1.05)
end

--carrot
if (
    I:isOf(item, Items:get("minecraft:carrot"))
    
) then
    M:rotateZ(matrices, -8 * l)
    M:rotateX(matrices, 4)
    M:rotateY(matrices, 4 * l)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, 0.03)
    M:scale(matrices, 1.05, 1.05, 1.05)
end

--carrot
if (
    I:isOf(item, Items:get("minecraft:golden_carrot"))
    
) then
    M:rotateZ(matrices, -8 * l)
    M:rotateX(matrices, 4)
    M:rotateY(matrices, 4 * l)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, 0.01)
    M:scale(matrices, 1.04, 1.04, 1.04)
end

if (
    I:isOf(item, Items:get("minecraft:beetroot")) 
    
) then
    M:rotateZ(matrices, -8 * l)
    M:rotateX(matrices, 0)
    M:rotateY(matrices, 4 * l)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.02)
    M:scale(matrices, 1.04, 1.04, 1.04)
end

--glow berries
if (
     I:isOf(item, Items:get("minecraft:glow_berries"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, 0.02)
    M:moveY(matrices, 0.05)
    M:scale(matrices, 1.1, 1.1, 1.1)
end

--sweet berries
if (
     I:isOf(item, Items:get("minecraft:sweet_berries"))
    
) then
    M:moveX(matrices, -0.07 * l)
    M:moveY(matrices, -0.03)
    M:moveZ(matrices, 0.04)
    M:scale(matrices, 1.2, 1.2, 1.2)
end

--melon
if (
    I:isOf(item, Items:get("minecraft:melon_slice")) or
    I:isOf(item, Items:get("minecraft:glistering_melon_slice"))
    
) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)

    M:moveX(matrices, 0.07 * l)
    M:moveZ(matrices, -0.0)
    M:scale(matrices, 1.2, 1.2, 1.2)
end

if (
I:isOf(item, Items:get("minecraft:glow_squid_spawn_egg")) or
I:isOf(item, Items:get("minecraft:creeper_spawn_egg")) or
I:isOf(item, Items:get("minecraft:cow_spawn_egg")) or
I:isOf(item, Items:get("minecraft:polar_bear_spawn_egg")) or
I:isOf(item, Items:get("minecraft:chicken_spawn_egg")) or
I:isOf(item, Items:get("minecraft:turtle_spawn_egg")) or
I:isOf(item, Items:get("minecraft:zombie_villager_spawn_egg")) or
I:isOf(item, Items:get("minecraft:drowned_spawn_egg")) or
I:isOf(item, Items:get("minecraft:happy_ghast_spawn_egg")) or
I:isOf(item, Items:get("minecraft:enderman_spawn_egg")) or
I:isOf(item, Items:get("minecraft:piglin_brute_spawn_egg")) or
I:isOf(item, Items:get("minecraft:bogged_spawn_egg")) or
I:isOf(item, Items:get("minecraft:armadillo_spawn_egg")) or
I:isOf(item, Items:get("minecraft:magma_cube_spawn_egg")) or
I:isOf(item, Items:get("minecraft:sniffer_spawn_egg")) or
I:isOf(item, Items:get("minecraft:warden_spawn_egg")) or
I:isOf(item, Items:get("minecraft:pig_spawn_egg")) or
I:isOf(item, Items:get("minecraft:mule_spawn_egg")) or
I:isOf(item, Items:get("minecraft:ender_dragon_spawn_egg")) or
I:isOf(item, Items:get("minecraft:cod_spawn_egg")) or
I:isOf(item, Items:get("minecraft:tropical_fish_spawn_egg")) or
I:isOf(item, Items:get("minecraft:donkey_spawn_egg")) or
I:isOf(item, Items:get("minecraft:wolf_spawn_egg")) or
I:isOf(item, Items:get("minecraft:pillager_spawn_egg")) or
I:isOf(item, Items:get("minecraft:snow_golem_spawn_egg")) or
I:isOf(item, Items:get("minecraft:skeleton_horse_spawn_egg")) or
I:isOf(item, Items:get("minecraft:guardian_spawn_egg")) or
I:isOf(item, Items:get("minecraft:wandering_trader_spawn_egg")) or
I:isOf(item, Items:get("minecraft:trader_llama_spawn_egg")) or
I:isOf(item, Items:get("minecraft:spider_spawn_egg")) or
I:isOf(item, Items:get("minecraft:piglin_spawn_egg")) or
I:isOf(item, Items:get("minecraft:strider_spawn_egg")) or
I:isOf(item, Items:get("minecraft:evoker_spawn_egg")) or
I:isOf(item, Items:get("minecraft:frog_spawn_egg")) or
I:isOf(item, Items:get("minecraft:horse_spawn_egg")) or
I:isOf(item, Items:get("minecraft:sheep_spawn_egg")) or
I:isOf(item, Items:get("minecraft:witch_spawn_egg")) or
I:isOf(item, Items:get("minecraft:fox_spawn_egg")) or
I:isOf(item, Items:get("minecraft:dolphin_spawn_egg")) or
I:isOf(item, Items:get("minecraft:tadpole_spawn_egg")) or
I:isOf(item, Items:get("minecraft:mooshroom_spawn_egg")) or
I:isOf(item, Items:get("minecraft:vindicator_spawn_egg")) or
I:isOf(item, Items:get("minecraft:ravager_spawn_egg")) or
I:isOf(item, Items:get("minecraft:bat_spawn_egg")) or
I:isOf(item, Items:get("minecraft:skeleton_spawn_egg")) or
I:isOf(item, Items:get("minecraft:shulker_spawn_egg")) or
I:isOf(item, Items:get("minecraft:bee_spawn_egg")) or
I:isOf(item, Items:get("minecraft:squid_spawn_egg")) or
I:isOf(item, Items:get("minecraft:slime_spawn_egg")) or
I:isOf(item, Items:get("minecraft:zombie_horse_spawn_egg")) or
I:isOf(item, Items:get("minecraft:panda_spawn_egg")) or
I:isOf(item, Items:get("minecraft:rabbit_spawn_egg")) or
I:isOf(item, Items:get("minecraft:goat_spawn_egg")) or
I:isOf(item, Items:get("minecraft:silverfish_spawn_egg")) or
I:isOf(item, Items:get("minecraft:wither_skeleton_spawn_egg")) or
I:isOf(item, Items:get("minecraft:stray_spawn_egg")) or
I:isOf(item, Items:get("minecraft:salmon_spawn_egg")) or
I:isOf(item, Items:get("minecraft:zombie_spawn_egg")) or
I:isOf(item, Items:get("minecraft:endermite_spawn_egg")) or
I:isOf(item, Items:get("minecraft:wither_spawn_egg")) or
I:isOf(item, Items:get("minecraft:allay_spawn_egg")) or
I:isOf(item, Items:get("minecraft:husk_spawn_egg")) or
I:isOf(item, Items:get("minecraft:camel_spawn_egg")) or
I:isOf(item, Items:get("minecraft:blaze_spawn_egg")) or
I:isOf(item, Items:get("minecraft:cat_spawn_egg")) or
I:isOf(item, Items:get("minecraft:creaking_spawn_egg")) or
I:isOf(item, Items:get("minecraft:phantom_spawn_egg")) or
I:isOf(item, Items:get("minecraft:vex_spawn_egg")) or
I:isOf(item, Items:get("minecraft:zombified_piglin_spawn_egg")) or
I:isOf(item, Items:get("minecraft:hoglin_spawn_egg")) or
I:isOf(item, Items:get("minecraft:parrot_spawn_egg")) or
I:isOf(item, Items:get("minecraft:breeze_spawn_egg")) or
I:isOf(item, Items:get("minecraft:villager_spawn_egg")) or
I:isOf(item, Items:get("minecraft:axolotl_spawn_egg")) or
I:isOf(item, Items:get("minecraft:ocelot_spawn_egg")) or
I:isOf(item, Items:get("minecraft:iron_golem_spawn_egg")) or
I:isOf(item, Items:get("minecraft:elder_guardian_spawn_egg")) or
I:isOf(item, Items:get("minecraft:zoglin_spawn_egg")) or
I:isOf(item, Items:get("minecraft:llama_spawn_egg")) or
I:isOf(item, Items:get("minecraft:pufferfish_spawn_egg")) or
I:isOf(item, Items:get("minecraft:cave_spider_spawn_egg")) or
I:isOf(item, Items:get("minecraft:ghast_spawn_egg"))

) then
    M:rotateZ(matrices, -5 * l)
    M:rotateX(matrices, 0)
    M:rotateY(matrices, 95 * l)

    M:moveX(matrices, -0.05 * l)
    M:moveZ(matrices, -0.07)
    M:scale(matrices, 1.2, 1.2, 1.2)
end
