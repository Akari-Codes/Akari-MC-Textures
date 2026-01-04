local l = (bl and 1) or -1
local d = (bl and 1) or -0.43
local a = (bl and 1) or 0.8
global.pitchAngle = 0.0;
global.pitchAngleO = 0.0;
global.yawAngle = 0.0;
global.yawAngleO = 0.0;

local ptAngle = (mainHand and pitchAngle) or pitchAngleO
local ywAngle = (mainHand and yawAngle) or yawAngleO

if  I:isOf(item, Items:get("minecraft:name_tag")) or 
    I:isOf(item, Items:get("minecraft:globe_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:field_masoned_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:flow_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:guster_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:mojang_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:skull_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:piglin_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:flower_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:creeper_banner_pattern")) or 
    I:isOf(item, Items:get("minecraft:bordure_indented_banner_pattern")
)
    
then
    M:moveY(matrices, 0.4)
    M:moveZ(matrices, -0.1)
    
end

--boats
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
    I:isOf(item, Items:get("minecraft:bamboo_chest_raft"))
)
    
then
    M:moveY(matrices, -0.05) 
end

--torch
if (
    I:isOf(item, Items:get("minecraft:torch")) or
    I:isOf(item, Items:get("minecraft:soul_torch")) or
    I:isOf(item, Items:get("minecraft:redstone_torch"))) 
then
    M:rotateZ(matrices, 10 * l)
    M:moveZ(matrices, 0.05)
end

--misc long
if (
    I:isOf(item, Items:get("minecraft:flint_and_steel")) or
    I:isOf(item, Items:get("minecraft:suspicious_stew")) or
    I:isOf(item, Items:get("minecraft:rabbit_stew")) or
    I:isOf(item, Items:get("minecraft:mushroom_stew")) or
    I:isOf(item, Items:get("minecraft:beetroot_soup")) or
    I:isOf(item, Items:get("minecraft:bowl")) or 
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
)

then
    M:rotateZ(matrices, 10 * l)
    M:moveZ(matrices, 0.05)
end

--bucket
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
    I:isOf(item, Items:get("minecraft:axolotl_bucket")) or
    I:isOf(item, Items:get("minecraft:milk_bucket")))
    
then
    M:rotateZ(matrices, 10 * l)
    M:rotateY(matrices, -5 * l)
    M:moveZ(matrices, 0.1)
    M:moveY(matrices, 0) 
end

--shears
if (
    I:isOf(item, Items:get("minecraft:shears")))

then
    M:rotateZ(matrices, 10 * l)
    M:moveZ(matrices, 0.05)
    M:moveY(matrices, -0.1)
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
    M:rotateZ(matrices, 10 * l)
    M:moveZ(matrices, 0.05)
    M:moveY(matrices, -0.09)
    M:moveX(matrices, -0.09 * l) 
end

--low misc
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
    I:isOf(item, Items:get("minecraft:music_disc_ward")) or
    I:isOf(item, Items:get("minecraft:fire_charge")) or
    I:isOf(item, Items:get("minecraft:goat_horn")) or
    I:isOf(item, Items:get("minecraft:snowball")) or
    I:isOf(item, Items:get("minecraft:egg")) or
    I:isOf(item, Items:get("minecraft:brown_egg")) or
    I:isOf(item, Items:get("minecraft:blue_egg")) or
    I:isOf(item, Items:get("minecraft:turtle_egg")) or
    I:isOf(item, Items:get("minecraft:ender_pearl")) or
    I:isOf(item, Items:get("minecraft:wind_charge")) or
    I:isOf(item, Items:get("minecraft:ender_eye")) or
    I:isOf(item, Items:get("minecraft:cooked_chicken")) or
    I:isOf(item, Items:get("minecraft:cooked_rabbit")) or
    I:isOf(item, Items:get("minecraft:rabbit")) or
    I:isOf(item, Items:get("minecraft:chicken")) or
    I:isOf(item, Items:get("minecraft:cod")) or
    I:isOf(item, Items:get("minecraft:cooked_cod")) or
    I:isOf(item, Items:get("minecraft:salmon")) or
    I:isOf(item, Items:get("minecraft:cooked_salmon")) or
    I:isOf(item, Items:get("minecraft:tropical_fish")) or
    I:isOf(item, Items:get("minecraft:repeater")) or
    I:isOf(item, Items:get("minecraft:comparator")) or
    I:isOf(item, Items:get("minecraft:pufferfish")) or
    I:isOf(item, Items:get("minecraft:bread")) or
    I:isOf(item, Items:get("minecraft:cake")) or
    I:isOf(item, Items:get("minecraft:campfire")) or
    I:isOf(item, Items:get("minecraft:firework_rocket")) or
    I:isOf(item, Items:get("minecraft:totem_of_undying")) or
    I:isOf(item, Items:get("minecraft:soul_campfire")) or
    I:isOf(item, Items:get("minecraft:rotten_flesh")) or
    I:isOf(item, Items:get("minecraft:lead")) or
    I:isOf(item, Items:get("minecraft:honey_bottle")) or
    I:isOf(item, Items:get("minecraft:glass_bottle")) or
    I:isOf(item, Items:get("minecraft:experience_bottle")) or
    I:isOf(item, Items:get("minecraft:potion")) or
    I:isOf(item, Items:get("minecraft:splash_potion")) or
    I:isOf(item, Items:get("minecraft:lingering_potion")) or
    I:isOf(item, Items:get("minecraft:dragon_breath")) or
    I:isOf(item, Items:get("minecraft:ominous_bottle")) or
    I:isOf(item, Items:get("minecraft:pumpkin_pie")) or
    I:isOf(item, Items:get("minecraft:spider_eye")) or
    I:isOf(item, Items:get("minecraft:fermented_spider_eye")) or
    I:isOf(item, Items:get("minecraft:beef")) or
    I:isOf(item, Items:get("minecraft:cooked_beef")) or
    I:isOf(item, Items:get("minecraft:porkchop")) or
    I:isOf(item, Items:get("minecraft:cooked_porkchop")) or
    I:isOf(item, Items:get("minecraft:mutton")) or
    I:isOf(item, Items:get("minecraft:cooked_mutton")) or
    I:isOf(item, Items:get("minecraft:cookie")) or
    I:isOf(item, Items:get("minecraft:coal")) or
    I:isOf(item, Items:get("minecraft:charcoal")) or
    I:isOf(item, Items:get("minecraft:raw_gold")) or
    I:isOf(item, Items:get("minecraft:raw_copper")) or
    I:isOf(item, Items:get("minecraft:raw_iron")) or
    I:isOf(item, Items:get("minecraft:emerald")) or
    I:isOf(item, Items:get("minecraft:diamond")) or
    I:isOf(item, Items:get("minecraft:lapis_lazuli")) or
    I:isOf(item, Items:get("minecraft:quartz")) or
    I:isOf(item, Items:get("minecraft:gold_nugget")) or
    I:isOf(item, Items:get("minecraft:iron_nugget")) or
    I:isOf(item, Items:get("minecraft:amethyst_shard")) or
    I:isOf(item, Items:get("minecraft:iron_ingot")) or
    I:isOf(item, Items:get("minecraft:gold_ingot")) or
    I:isOf(item, Items:get("minecraft:copper_ingot")) or
    I:isOf(item, Items:get("minecraft:netherite_ingot")) or
    I:isOf(item, Items:get("minecraft:netherite_scrap")) or
    I:isOf(item, Items:get("minecraft:bone")) or
    I:isOf(item, Items:get("minecraft:brick")) or
    I:isOf(item, Items:get("minecraft:nether_brick")) or
    I:isOf(item, Items:get("minecraft:resin_brick")) or
    I:isOf(item, Items:get("minecraft:honeycomb")) or
    I:isOf(item, Items:get("minecraft:clay_ball")) or
    I:isOf(item, Items:get("minecraft:nautilus_shell")) or
    I:isOf(item, Items:get("minecraft:blaze_rod")) or
    I:isOf(item, Items:get("minecraft:breeze_rod")) or
    I:isOf(item, Items:get("minecraft:book")) or
    I:isOf(item, Items:get("minecraft:enchanted_book")) or
    I:isOf(item, Items:get("minecraft:writable_book")) or
    I:isOf(item, Items:get("minecraft:written_book")) or
    I:isOf(item, Items:get("minecraft:gunpowder")) or
    I:isOf(item, Items:get("minecraft:glowstone_dust")) or
    I:isOf(item, Items:get("minecraft:bone_meal")) or
    I:isOf(item, Items:get("minecraft:redstone")) or
    I:isOf(item, Items:get("minecraft:blaze_powder")) or
    I:isOf(item, Items:get("minecraft:sugar")) or
    I:isOf(item, Items:get("minecraft:disc_fragment_5")) or
    I:isOf(item, Items:get("minecraft:shulker_shell")) or
    I:isOf(item, Items:get("minecraft:end_crystal")) or
    I:isOf(item, Items:get("minecraft:lever")) or

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


)
    
then
    M:rotateZ(matrices, 10 * l)
    M:moveZ(matrices, 0.05)
    M:moveY(matrices, -0.09)
    M:moveX(matrices, -0.09 * l) 
end

--low misc
if (
    I:isOf(item, Items:get("minecraft:armor_stand"))


)
    
then
    M:rotateZ(matrices, 10 * l)
    M:moveZ(matrices, 0.05)
    M:moveY(matrices, -0.12)
    M:moveX(matrices, -0.09 * l) 
end

--food
if (
    I:isOf(item, Items:get("minecraft:apple")) or
    I:isOf(item, Items:get("minecraft:golden_apple")) or
    I:isOf(item, Items:get("minecraft:enchanted_golden_apple")) or
    I:isOf(item, Items:get("minecraft:melon_slice")) or
    I:isOf(item, Items:get("minecraft:glistering_melon_slice")) or
    I:isOf(item, Items:get("minecraft:sweet_berries")) or
    I:isOf(item, Items:get("minecraft:glow_berries")) or
    I:isOf(item, Items:get("minecraft:chorus_fruit")) or
    I:isOf(item, Items:get("minecraft:carrot")) or
    I:isOf(item, Items:get("minecraft:golden_carrot")) or
    I:isOf(item, Items:get("minecraft:beetroot")) or
    I:isOf(item, Items:get("minecraft:potato")) or
    I:isOf(item, Items:get("minecraft:baked_potato")) or
    I:isOf(item, Items:get("minecraft:poisonous_potato")) or
    I:isOf(item, Items:get("minecraft:dried_kelp")) 
)
then
    M:rotateZ(matrices, 10 * l)
    M:moveZ(matrices, 0.05)
    M:moveY(matrices, -0.0)
    M:moveX(matrices, -0.09 * l) 
end