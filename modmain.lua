PrefabFiles = {
    "dmgind",
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

TUNING.SHOW_DECIMAL_POINTS = GetModConfigData("show_decimal_points")

TUNING.DISPLAY_MODE = GetModConfigData("display_mode")

TUNING.LABEL_FONT_SIZE = 70
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


TUNING.LABEL_Y_START = 4

TUNING.LABEL_TIME = 1.0

TUNING.LABEL_TIME_DELTA = 0.01

TUNING.GRAVITY = 0.1
TUNING.FRICTION_PRESERVE = 0.9

TUNING.LIFT_ACC = 0.003
TUNING.SIDE_WAVE_RND = 0.15
TUNING.LABEL_Y_START_VELO = 0.05

TUNING.LABEL_MIN_AMPLITUDE_X = 0.8
TUNING.LABEL_MAX_AMPLITUDE_X = 1.6

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
