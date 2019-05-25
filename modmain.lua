PrefabFiles = {
    "dmgind",
    "hngind",
    "sanind",
    "wrkind"
}


----------------------------------------------------
----------------- CONFIGURATION --------------------

TUNING.SHOW_DAMAGE_ONLY = GetModConfigData("dmg_only") == "on" -- set to true, if you want to see damage only (no healing)

TUNING.SHOW_NUMBERS_THRESHOLD = 0.1
if GetModConfigData("amount_of_numbers") == "high" then
    TUNING.SHOW_NUMBERS_THRESHOLD = 0.001
end
if GetModConfigData("amount_of_numbers") == "low" then
    TUNING.SHOW_NUMBERS_THRESHOLD = 0.99
end

TUNING.SHOW_HUNGER_NUMBERS_THRESHOLD = 0

TUNING.SHOW_DECIMAL_POINTS = GetModConfigData("show_decimal_points")

TUNING.DISPLAY_MODE = GetModConfigData("display_mode")

TUNING.LABEL_FONT_SIZE = 70
if (GetModConfigData("number_size") == "atomic") then
    TUNING.LABEL_FONT_SIZE = 20
end
if (GetModConfigData("number_size") == "tiny") then
    TUNING.LABEL_FONT_SIZE = 40
end
if (GetModConfigData("number_size") == "huge") then
    TUNING.LABEL_FONT_SIZE = 100
end

----------------------------------------------------


TUNING.HEALTH_LOSE_COLOR = {
    r = 0.7,
    g = 0,
    b = 0
}
TUNING.HEALTH_GAIN_COLOR = {
    r = 0,
    g = 0.7,
    b = 0
}

TUNING.HUNGER_GAIN_COLOR = {
    r = 0.7,
    g = 0.8,
    b = 0
}

TUNING.SANITY_LOSE_COLOR = {
    r = 0.3,
    g = 0.3,
    b = 0.3
}
TUNING.SANITY_GAIN_COLOR = {
    r = 0.7,
    g = 0,
    b = 0.9
}

TUNING.WORK_COLOR = {
    r = 0.9,
    g = 0.9,
    b = 1
}

TUNING.LABEL_Y_START = 4

TUNING.LABEL_TIME = 1.0

TUNING.LABEL_TIME_DELTA = 0.01

TUNING.GRAVITY = 0.1
TUNING.FRICTION_PRESERVE = 0.9

TUNING.LIFT_ACC = 0.003
TUNING.SIDE_WAVE_RND = 0.15
TUNING.LABEL_Y_START_VELO = 0.05

TUNING.LABEL_MIN_AMPLITUDE_X = 0.8
TUNING.LABEL_MAX_AMPLITUDE_X = 2.2

TUNING.ROCKET_M0 = 100              -- whole mass of the rocket
TUNING.ROCKET_MF = 10               -- propellor mass
TUNING.ROCKET_DM = 5                -- fuel mass emitted per time frame
TUNING.ROCKET_FUEL_VELOCITY = 0.01  -- velocity of fuel while emitted

TUNING.SCALE_WITH_DAMAGE = 1
if (GetModConfigData("size_scale") == "off") then
    TUNING.SCALE_WITH_DAMAGE = 0 
end

TUNING.SHOW_HUNGER_INDICATORS = GetModConfigData("show_hunger") == "on"
TUNING.SHOW_SANITY_INDICATORS = GetModConfigData("show_sanity") == "on"
TUNING.SHOW_WORK_INDICATORS = GetModConfigData("show_work") == "on"

AddComponentPostInit("health", function(Health, inst)
    inst:ListenForEvent("healthdelta", function(inst, data)
        if inst.components.health then
            local amount = data.newpercent * inst.components.health.maxhealth - data.oldpercent * inst.components.health.maxhealth

            if data.amount and math.abs(data.amount) < math.abs(amount) then
                amount = data.amount
            end

            if amount == 0 then
                return
            end

            if math.abs(amount) > TUNING.SHOW_NUMBERS_THRESHOLD then
                if not (TUNING.SHOW_DAMAGE_ONLY and amount > 0) then
                    local CDI = GLOBAL.SpawnPrefab("dmgind")
                    CDI.Transform:SetPosition(inst.Transform:GetWorldPosition())
                    CDI.isheal:set_local(false)
                    CDI.isheal:set(amount > 0)
                    CDI.indicator:set_local(0)
                    CDI.indicator:set(math.abs(amount))
                end
            end
        end
    end)
end)

AddComponentPostInit("hunger", function(Hunger, inst)
    inst:ListenForEvent("hungerdelta", function(inst, data)
        if inst.components.hunger then
            local amount = data.newpercent * inst.components.hunger.max - data.oldpercent * inst.components.hunger.max

            if data.amount and math.abs(data.amount) < math.abs(amount) then
                amount = data.amount
            end

            if amount == 0 then
                return
            end

            if TUNING.SHOW_HUNGER_INDICATORS and amount > TUNING.SHOW_HUNGER_NUMBERS_THRESHOLD then
                local hungerindicator = GLOBAL.SpawnPrefab("hngind")
                hungerindicator.Transform:SetPosition(inst.Transform:GetWorldPosition())
                hungerindicator.isheal:set_local(false)
                hungerindicator.isheal:set(amount >= 0)
                hungerindicator.indicator:set_local(0)
                hungerindicator.indicator:set(math.abs(amount))
            end
        end
    end)
end)


AddComponentPostInit("sanity", function(Sanity, inst)
    inst:ListenForEvent("sanitydelta", function(inst, data)
        if inst.components.sanity then
            local amount = data.newpercent * inst.components.sanity.max - data.oldpercent * inst.components.sanity.max

            if data.amount and math.abs(data.amount) < math.abs(amount) then
                amount = data.amount
            end

            if amount == 0 then
                return
            end

            if TUNING.SHOW_SANITY_INDICATORS and math.abs(amount) > TUNING.SHOW_NUMBERS_THRESHOLD then
                local sanityindicator = GLOBAL.SpawnPrefab("sanind")
                sanityindicator.Transform:SetPosition(inst.Transform:GetWorldPosition())
                sanityindicator.isheal:set_local(false)
                sanityindicator.isheal:set(amount >= 0)
                sanityindicator.indicator:set_local(0)
                sanityindicator.indicator:set(math.abs(amount))
            end
        end
    end)
end)

AddComponentPostInit("workable", function(Workable, inst)
    inst:ListenForEvent("worked", function(inst, data)
        if inst.components.workable then
            local left = data.workleft

            -- if left == 0 then
            --     return
            -- end

            if TUNING.SHOW_WORK_INDICATORS and math.abs(amount) > TUNING.SHOW_NUMBERS_THRESHOLD then
                local workindicator = GLOBAL.SpawnPrefab("wrkind")
                workindicator.Transform:SetPosition(inst.Transform:GetWorldPosition())
                workindicator.indicator:set_local(0)
                workindicator.indicator:set(left)
            end
        end
    end)
end)
