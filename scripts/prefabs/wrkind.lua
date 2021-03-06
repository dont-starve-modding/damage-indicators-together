local function CreateWorkIndicator(inst)
    local amount = inst.indicator:value() or 0
    local absAmount = math.abs(amount);

    local label = inst.entity:AddLabel()

    local size = 1
    
    label:SetFont(NUMBERFONT)
    label:SetFontSize(TUNING.LABEL_FONT_SIZE * size)

    label:SetWorldOffset(0, TUNING.LABEL_Y_START, 0)

    local color
    color = TUNING.WORK_COLOR

    label:SetColour(color.r, color.g, color.b)

    local dp_no = "%d";
    local dp_yes = "%.1f";

    local format = dp_no

    if TUNING.SHOW_DECIMAL_POINTS == "all" then
        format = dp_yes
    end

    if math.abs(amount) < 1.0 and TUNING.SHOW_DECIMAL_POINTS == "low" then
        format = dp_yes
    end

    label:SetText(string.format(format, amount))

    label:Enable(true)

    inst:StartThread(function()
        local label = inst.Label

        local t = 0
        local t_max = TUNING.LABEL_TIME
        local dt = TUNING.LABEL_TIME_DELTA

        -- waving upon mode ------------------
        local y = TUNING.LABEL_Y_START
        local dy = TUNING.LABEL_Y_START_VELO
        local ddy = 0.0

        local side = (math.random() * (TUNING.LABEL_MAX_AMPLITUDE_X - TUNING.LABEL_MIN_AMPLITUDE_X) + TUNING.LABEL_MIN_AMPLITUDE_X) * (math.random() >= 0.5 and -1 or 1)
        local dside = 0.0
        local ddside = 0.0

        if TUNING.DISPLAY_MODE == 'straight' then
            side = 0
        end

        -------------------------------------

        -- rocket mode ----------------------

        if TUNING.DISPLAY_MODE == 'rocket' then
            dy = 0
            ddy = 0

            side = 0
            dside = 0 -- (math.random() - 0.5)*0.5
        end

        local mass = TUNING.ROCKET_M0
        local lastsideoffset = 0
        local newsideoffset = 0

        -------------------------------------

        if TUNING.DISPLAY_MODE == 'bouncy' then
            -- bounce around mode ---------------
            y = TUNING.LABEL_Y_START
            dy = 0.05
            ddy = 0.0

            side = 0.0
            dside = 0.1
            if math.random() > 0.5 then
                dside = -dside
            end
            ddside = 0.0
            -------------------------------------
        end

        while inst:IsValid() and t < t_max do
            if TUNING.DISPLAY_MODE == 'waving' or TUNING.DISPLAY_MODE == 'straight' then
                -- waving upon mode ------------------
                ddy = TUNING.LIFT_ACC * (math.random() * 0.5 + 0.5)
                dy = dy + ddy
                y = y + dy

                ddside = -side * math.random() * TUNING.SIDE_WAVE_RND
                dside = dside + ddside
                side = side + dside
                --------------------------------------
            end

            if TUNING.DISPLAY_MODE == 'bouncy' then
                -- bounce around mode ----------------
                ddy = -TUNING.GRAVITY
                dy = dy + ddy
                y = y + dy
                if y < 0 then
                    y = -y
                    dy = -dy * TUNING.FRICTION_PRESERVE
                end

                ddside = 0
                dside = dside + ddside
                side = side + dside
                --------------------------------------
            end

            if TUNING.DISPLAY_MODE == 'rocket' then
                -- rocket mode -----------------------
                -- see https://en.wikipedia.org/wiki/Tsiolkovsky_rocket_equation

                ddy = (TUNING.ROCKET_FUEL_VELOCITY * TUNING.ROCKET_DM) / mass
                dy = dy + ddy
                y = y + dy

                -- for 'shivering'
                dside = dside
                newsideoffset = (math.random() - 0.5) * math.max(0.05, 0.001/math.abs(dy))
                side = side + dside - lastsideoffset + newsideoffset
                lastsideoffset = newsideoffset

                mass = mass - TUNING.ROCKET_DM
                if mass < TUNING.ROCKET_MF then
                    mass = TUNING.ROCKET_MF
                end
                --------------------------------------
            end

            local headingtarget = 45 --[[TheCamera.headingtarget]] % 180
            if headingtarget == 0 then
                label:SetWorldOffset(0, y, side) -- from 3d plane x = 0
            elseif headingtarget == 45 then
                label:SetWorldOffset(side, y, -side) -- from 3d plane x + z = 0
            elseif headingtarget == 90 then
                label:SetWorldOffset(side, y, 0) -- from 3d plane z = 0
            elseif headingtarget == 135 then
                label:SetWorldOffset(side, y, side) -- from 3d plane z - x = 0
            end
            t = t + dt
            label:SetFontSize(TUNING.LABEL_FONT_SIZE * size * math.sqrt(1 - t / t_max))
            Sleep(dt)
        end

        if TheWorld.ismastersim then
            inst:Remove()
        end
    end)
end

local function SetNumber(inst)
    CreateWorkIndicator(inst)
end

local function InitDI()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst.indicator = net_ushortint(inst.GUID, "wrkind.number", "numberdirty")
    inst:ListenForEvent("numberdirty", SetNumber)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    return inst
end

return Prefab("wrkind", InitDI)
