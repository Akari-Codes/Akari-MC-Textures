local l = (bl and 1) or -1

local vanilla_trims = {
  "minecraft:netherite_upgrade_smithing_template",
  "minecraft:sentry_armor_trim_smithing_template",
  "minecraft:vex_armor_trim_smithing_template",
  "minecraft:wild_armor_trim_smithing_template",
  "minecraft:coast_armor_trim_smithing_template",
  "minecraft:dune_armor_trim_smithing_template",
  "minecraft:wayfinder_armor_trim_smithing_template",
  "minecraft:raiser_armor_trim_smithing_template",
  "minecraft:shaper_armor_trim_smithing_template",
  "minecraft:host_armor_trim_smithing_template",
  "minecraft:ward_armor_trim_smithing_template",
  "minecraft:silence_armor_trim_smithing_template",
  "minecraft:tide_armor_trim_smithing_template",
  "minecraft:snout_armor_trim_smithing_template",
  "minecraft:rib_armor_trim_smithing_template",
  "minecraft:eye_armor_trim_smithing_template",
  "minecraft:spire_armor_trim_smithing_template",
  "minecraft:flow_armor_trim_smithing_template",
  "minecraft:bolt_armor_trim_smithing_template"
}

local more_armor_trims = {
  "more_armor_trims:storm_armor_trim_smithing_template",
  "more_armor_trims:ram_armor_trim_smithing_template",
  "more_armor_trims:myth_armor_trim_smithing_template",
  "more_armor_trims:greed_armor_trim_smithing_template",
  "more_armor_trims:beast_armor_trim_smithing_template",
  "more_armor_trims:fever_armor_trim_smithing_template",
  "more_armor_trims:wraith_armor_trim_smithing_template",
  "more_armor_trims:nihility_armor_trim_smithing_template",
  "more_armor_trims:horizon_armor_trim_smithing_template",
  "more_armor_trims:origin_armor_trim_smithing_template"
}

local frostiful = {
  "frostiful:fur_upgrade_template",
  "frostiful:ice_skate_upgrade_template",
  "frostiful:snow_man_armor_trim_smithing_template",
  "frostiful:frosty_armor_trim_smithing_template",
  "frostiful:glacial_armor_trim_smithing_template"
}

local adventurez = {
  "adventurez:gilded_upgrade_smithing_template"
}

local enderscape = {
  "enderscape:stasis_armor_trim_smithing_template"
}



local function isTrim(it)
  local all_trims = {}
  for _, t in ipairs({vanilla_trims, more_armor_trims, frostiful, enderscape}) do
    for _, v in ipairs(t) do
      table.insert(all_trims, v)
    end
  end

  for _, v in ipairs(all_trims) do
    local itemType = Items:get(v)
    if itemType and I:isOf(it, itemType) and not I:isEmpty(item) then
      return true
    end
  end
  return false
end

local function isAdventureZ(it)
  for _, v in ipairs(adventurez) do
    local itemType = Items:get(v)
    if itemType and I:isOf(it, itemType) and not I:isEmpty(item) then
      return true 
    end
  end
  return false
end

if isTrim(item) then

  M:scale(matrices, 1.3, 1.3, 1.3)
  M:rotateX(matrices, 15)
  M:rotateY(matrices, 80* l)
  M:rotateZ(matrices, -23* l)
  M:moveX(matrices, 0.03* l)
  M:moveY(matrices, 0.25)
  M:moveZ(matrices, 0.04)
  
particleManager:addParticle(
    particles,
    false,
    0.2* l, -0.13, -0.09,
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
    Texture:of("minecraft", "textures/particle/blue_glow.png"),
    "ITEM",
    hand,
    "SPAWN",
    "ADDITIVE",
    0,
    200
)
end

if isAdventureZ(item) then

  M:scale(matrices, 1.3, 1.3, 1.3)
  M:rotateX(matrices, 15)
  M:rotateY(matrices, 80* l)
  M:rotateZ(matrices, -23* l)
  M:moveX(matrices, 0.03* l)
  M:moveY(matrices, 0.25)
  M:moveZ(matrices, 0.04)
  
particleManager:addParticle(
    particles,
    false,
    0.2* l, -0.13, -0.09,
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
    200
)
end