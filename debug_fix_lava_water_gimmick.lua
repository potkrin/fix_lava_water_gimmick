log.info("[Field Gimmick] started loading")

-- 0: area 12
-- 1: area 14
-- 2: area 13
local LavaAreaID = 2

-- 0: area 6
-- 1: area 7
-- 2: area 8
local WaterAreaID = 2

--[[
local DifficultyWaveArgs = nil

-- type is the "typeof" variant, not the type definition
local function dump_fields_by_type(type)
    log.debug("Dumping fields...")

    local binding_flags = 32 | 16 | 4 | 8
    local fields = type:call("GetFields(System.Reflection.BindingFlags)", binding_flags)

    if fields then
        fields = fields:get_elements()

        for i, field in ipairs(fields) do
            log.debug("Field: " .. field:call("ToString"))
        end
    end
end

local function dump_fields(object)
    local object_type = object:call("GetType")

    log.debug("dump_fields()")

    dump_fields_by_type(object_type)
end
 

function on_pre_questStart(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.questStart() " .. tostring(isSkill))
    log.debug("on_pre_questStart: args 2: " .. tostring(args2))
    log.debug("on_pre_questStart: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_questStart: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end

function on_post_questStart(retval)

    -- local NandoYuragi_type = sdk.to_int64(DifficultyWaveArgs[3])
    -- local isSkill = sdk.to_int64(DifficultyWaveArgs[4])
	-- local waveLv = sdk.to_ptr(0)
	
    -- log.debug("lua:log: args 3: " .. tostring(NandoYuragi_type))
    -- log.debug("lua:log: args 4: " .. tostring(isSkill))
	
	-- if NandoYuragi_type == 0 then
	-- 	waveLv = sdk.to_ptr(0)
	-- 	log.debug("lua:log: out: " .. tostring(waveLv))
	-- 	return waveLv
	-- elseif NandoYuragi_type == 1 then
	-- 	waveLv = sdk.to_ptr(-1)
	-- 	log.debug("lua:log: out: " .. tostring(waveLv))
	-- 	return waveLv
	-- elseif NandoYuragi_type == 2 then
	-- 	waveLv = sdk.to_ptr(-2)
	-- 	log.debug("lua:log: out: " .. tostring(waveLv))
	-- 	return waveLv
	-- else
	-- 	log.debug("lua:log: retval: " .. tostring(retval))
	-- 	return retval		
	-- end
		
end

-- place of the function to search in REFramework ObjectExplorer
---- snow.enemy.EnemyManager -> AutoGenerated Types -> 0x278: snow.enemy.SystemDifficultyWaveData -> questStart()
	
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("questStart"), 
	on_pre_questStart,
	on_post_questStart)



function on_pre_getGimmick(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.getGimmick() " .. tostring(isSkill))
    log.debug("on_pre_getGimmick: args 2: " .. tostring(args2))
    log.debug("on_pre_getGimmick: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_getGimmick: args 4: " .. tostring(isSkill))
    log.debug("\n")
    

    return sdk.PreHookResult.CALL_ORIGINAL
end

function on_post_getGimmick(retval)

    -- local NandoYuragi_type = sdk.to_int64(DifficultyWaveArgs[3])
    -- local isSkill = sdk.to_int64(DifficultyWaveArgs[4])
	-- local waveLv = sdk.to_ptr(0)
	
    -- log.debug("lua:log: args 3: " .. tostring(NandoYuragi_type))
    -- log.debug("lua:log: args 4: " .. tostring(isSkill))
	
	-- if NandoYuragi_type == 0 then
	-- 	waveLv = sdk.to_ptr(0)
	-- 	log.debug("lua:log: out: " .. tostring(waveLv))
	-- 	return waveLv
	-- elseif NandoYuragi_type == 1 then
	-- 	waveLv = sdk.to_ptr(-1)
	-- 	log.debug("lua:log: out: " .. tostring(waveLv))
	-- 	return waveLv
	-- elseif NandoYuragi_type == 2 then
	-- 	waveLv = sdk.to_ptr(-2)
	-- 	log.debug("lua:log: out: " .. tostring(waveLv))
	-- 	return waveLv
	-- else
	-- 	log.debug("lua:log: retval: " .. tostring(retval))
	-- 	return retval		
	-- end
		
end

-- place of the function to search in REFramework ObjectExplorer
---- snow.enemy.EnemyManager -> AutoGenerated Types -> 0x278: snow.enemy.SystemDifficultyWaveData -> getGimmick()
	
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("getGimmick"), 
	on_pre_getGimmick,
	on_post_getGimmick)
]]--

local g_fgbase = nil;

function on_pre_addFieldGimmick(args)

    -- log.debug("snow.stage.FieldGimmickManager.addFieldGimmick() " .. tostring(isSkill))
	-- DifficultyWaveArgs = args
    -- local args2 = args[2]
    -- local NandoYuragi_type = args[3]
    -- local isSkill = args[4]
    -- local managed2 = sdk.to_managed_object(args[2])
    local fgbase = sdk.to_managed_object(args[3])
    g_fgbase = sdk.to_managed_object(args[3])


    return sdk.PreHookResult.CALL_ORIGINAL
    -- return sdk.PreHookResult.SKIP_ORIGINAL
end

function on_post_addFieldGimmick(retval)
    log.debug("POST: snow.stage.FieldGimmickManager.addFieldGimmick() " .. tostring(isSkill))

    -- local fgstate = g_fgbase:get_field("k__BackingField")
    -- local fgstate2 = g_fgbase:get_field("_ReservedState")
    
    local groupid = g_fgbase:get_field("_GroupId")
    local fg005id = g_fgbase:get_field("_Fg005Id")
    -- local uniqueid = g_fgbase:get_field("_UniqueID")
    local fgtype = g_fgbase:get_field("_Type")
    -- local mapfloortype = g_fgbase:get_field("_MapFloorType")
    -- local ditherstate = g_fgbase:get_field("_DitherState")
    -- local ditherenabled = g_fgbase:get_field("_DitherEnabled")
    -- local dithervalue = g_fgbase:get_field("_DitherValue")
    -- local materialdither = g_fgbase:get_field("_MaterialParamDither")

    if fgtype == 4 then 
        -- log.debug("g_fgbase.getfield(k__BackingField) : " .. tostring(fgstate))
        -- log.debug("g_fgbase.getfield(_reservedstate) : " .. tostring(fgstate2))
        -- log.debug("g_fgbase.getfield(groupid) : " .. tostring(groupid))
        -- log.debug("g_fgbase.getfield(fg005id) : " .. tostring(fg005id))
        -- log.debug("g_fgbase.getfield(fgtype) : " .. tostring(fgtype))
        -- log.debug("g_fgbase.getfield(mapfloortype) : " .. tostring(mapfloortype))
        -- log.debug("g_fgbase.getfield(ditherstate) : " .. tostring(ditherstate))
        -- log.debug("g_fgbase.getfield(ditherenabled) : " .. tostring(ditherenabled))
        -- log.debug("g_fgbase.getfield(dithervalue) : " .. tostring(dithervalue))
        -- log.debug("g_fgbase.getfield(materialdither) : " .. tostring(materialdither))



        -- g_fgbase:set_field("k__BackingField", 1)
        -- g_fgbase:set_field("_ReservedState", 1)
 
        -- if mapfloortype == 0 then
        --     g_fgbase:set_field("_ReservedState", 1)
        --     log.debug("if mapfloortype 0 ")
        -- end

        -- g_fgbase:set_field("_ReservedState", 1)
        -- log.debug("set field 1")
 
 
        if groupid == 0 then
            if fg005id == LavaAreaID then
                -- g_fgbase:set_field("k__BackingField", 1)
                g_fgbase:set_field("_ReservedState", 1)
                log.debug("gid=0 fgid=0 set to 1")
            else
                -- g_fgbase:set_field("k__BackingField", 4)
                g_fgbase:set_field("_ReservedState", 4)
                log.debug("gid=0 fgid!=0 set to 4")
            end
        end

        if groupid == 1 then
            --g_fgbase:set_field("_ReservedState", 1)
 
            if fg005id == WaterAreaID then
                -- g_fgbase:set_field("k__BackingField", 1)
                g_fgbase:set_field("_ReservedState", 1)
                log.debug("gid=1 fgid=0 set to 1")
            else
                -- g_fgbase:set_field("k__BackingField", 4)
                g_fgbase:set_field("_ReservedState", 4)
                log.debug("gid=1 fgid!=0 set to 4")
            end
        end

    end
end

	
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("addFieldGimmick"), 
	on_pre_addFieldGimmick,
	on_post_addFieldGimmick)

local LavaAreaValues = {"12", "13", "14"}
local LavaSelection = 1
local WaterAreaValues = {"6", "7", "8"}
local WaterSelection = 1
 
re.on_draw_ui(function()
	imgui.text("FixLava&WaterGimmick")
	imgui.same_line()
	if imgui.button("Options") then
		drawFixLavaWaterGimmickOptionsWindow = true
	end
	
    if drawFixLavaWaterGimmickOptionsWindow then
        if imgui.begin_window("Fix Lava & Water Gimmick Options", true, 64) then
            changed, value = imgui.combo('LavaArea', LavaSelection, LavaAreaValues)
			if changed then
                LavaSelection = value
                if value == 1 then
                    LavaAreaID = 0
                elseif value == 2 then
                    LavaAreaID = 2
                else
                    LavaAreaID = 1
                end
                --LavaAreaID = tonumber(value)-1
                log.debug(tostring(LavaAreaID))
			end
            changed, value = imgui.combo('WaterArea', WaterSelection, WaterAreaValues)
			if changed then
                WaterSelection = value
                WaterAreaID = tonumber(value)-1
                log.debug(tostring(WaterAreaID))
			end


			-- changed, value = imgui.checkbox('Infinite Coatings (for Bow)', config.infiniteCoatings)
			-- if changed then
			-- 	doWrite = true
			-- 	config.infiniteCoatings = value
			-- end
            imgui.end_window()
        else
            drawFixLavaWaterGimmickOptionsWindow = false
        end
    
    end
end)

--[[
function on_pre_getGimmickAtUniqueID(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.getGimmickAtUniqueID() " .. tostring(isSkill))
    log.debug("on_pre_getGimmickAtUniqueID: args 2: " .. tostring(args2))
    log.debug("on_pre_getGimmickAtUniqueID: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_getGimmickAtUniqueID: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end

function on_post_getGimmickAtUniqueID(retval)

end

-- place of the function to search in REFramework ObjectExplorer
---- snow.enemy.EnemyManager -> AutoGenerated Types -> 0x278: snow.enemy.SystemDifficultyWaveData -> getGimmickAtUniqueID()
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("getGimmickAtUniqueID"), 
	on_pre_getGimmickAtUniqueID,
	on_post_getGimmickAtUniqueID)


function on_pre_initFg(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.initFg() " .. tostring(isSkill))
    log.debug("on_pre_initFg: args 2: " .. tostring(args2))
    log.debug("on_pre_initFg: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_initFg: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end

function on_post_initFg(retval)

end

-- place of the function to search in REFramework ObjectExplorer
---- snow.enemy.EnemyManager -> AutoGenerated Types -> 0x278: snow.enemy.SystemDifficultyWaveData -> initFg()
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("initFg"), 
	on_pre_initFg,
	on_post_initFg)

function on_pre_get_Fg002CreateAction(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.get_Fg002CreateAction() " .. tostring(isSkill))
    log.debug("on_pre_get_Fg002CreateAction: args 2: " .. tostring(args2))
    log.debug("on_pre_get_Fg002CreateAction: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_get_Fg002CreateAction: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
    -- return sdk.PreHookResult.SKIP_ORIGINAL
end

function on_post_get_Fg002CreateAction(retval)

end

-- place of the function to search in REFramework ObjectExplorer
---- snow.enemy.EnemyManager -> AutoGenerated Types -> 0x278: snow.enemy.SystemDifficultyWaveData -> get_Fg002CreateAction()
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("get_Fg002CreateAction"), 
	on_pre_get_Fg002CreateAction,
	on_post_get_Fg002CreateAction)



function on_pre_set_Fg002CreateAction(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.set_Fg002CreateAction() " .. tostring(isSkill))
    log.debug("on_pre_set_Fg002CreateAction: args 2: " .. tostring(args2))
    log.debug("on_pre_set_Fg002CreateAction: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_set_Fg002CreateAction: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
    -- return sdk.PreHookResult.SKIP_ORIGINAL
end
function on_post_set_Fg002CreateAction(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("set_Fg002CreateAction"), on_pre_set_Fg002CreateAction, on_post_set_Fg002CreateAction)


function on_pre_initQuestStart(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.initQuestStart() " .. tostring(isSkill))
    log.debug("on_pre_initQuestStart: args 2: " .. tostring(args2))
    log.debug("on_pre_initQuestStart: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_initQuestStart: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_initQuestStart(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("initQuestStart"), on_pre_initQuestStart, on_post_initQuestStart)


function on_pre_get_IsNetworkPlay(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.get_IsNetworkPlay() " .. tostring(isSkill))
    log.debug("on_pre_get_IsNetworkPlay: args 2: " .. tostring(args2))
    log.debug("on_pre_get_IsNetworkPlay: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_get_IsNetworkPlay: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_get_IsNetworkPlay(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("get_IsNetworkPlay"), on_pre_get_IsNetworkPlay, on_post_get_IsNetworkPlay)


function on_pre_awake(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.awake() " .. tostring(isSkill))
    log.debug("on_pre_awake: args 2: " .. tostring(args2))
    log.debug("on_pre_awake: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_awake: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_awake(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("awake"), on_pre_awake, on_post_awake)


function on_pre_start(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.start() " .. tostring(isSkill))
    log.debug("on_pre_start: args 2: " .. tostring(args2))
    log.debug("on_pre_start: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_start: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_start(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("start"), on_pre_start, on_post_start)


-- function on_pre_update(args)
-- 	-- DifficultyWaveArgs = args
--     local args2 = args[2]
--     local NandoYuragi_type = args[3]
--     local isSkill = args[4]
--     log.debug("snow.stage.FieldGimmickManager.update() " .. tostring(isSkill))
--     log.debug("on_pre_update: args 2: " .. tostring(args2))
--     log.debug("on_pre_update: args 3: " .. tostring(NandoYuragi_type))
--     log.debug("on_pre_update: args 4: " .. tostring(isSkill))
--     log.debug("\n")
--     return sdk.PreHookResult.CALL_ORIGINAL
-- end
-- function on_post_update(retval)
-- end
-- sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("update"), on_pre_update, on_post_update)


function on_pre_initQuestEnd(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.initQuestEnd() " .. tostring(isSkill))
    log.debug("on_pre_initQuestEnd: args 2: " .. tostring(args2))
    log.debug("on_pre_initQuestEnd: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_initQuestEnd: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_initQuestEnd(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("initQuestEnd"), on_pre_update, on_post_update)


function on_pre_addUniqueList(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.addUniqueList() " .. tostring(isSkill))
    log.debug("on_pre_addUniqueList: args 2: " .. tostring(args2))
    log.debug("on_pre_addUniqueList: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_addUniqueList: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_addUniqueList(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("addUniqueList"), on_pre_update, on_post_update)


function on_pre_receiveCreateObj(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.receiveCreateObj() " .. tostring(isSkill))
    log.debug("on_pre_receiveCreateObj: args 2: " .. tostring(args2))
    log.debug("on_pre_receiveCreateObj: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_receiveCreateObj: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_receiveCreateObj(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("receiveCreateObj"), on_pre_update, on_post_update)


function on_pre_destroyObj(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.destroyObj() " .. tostring(isSkill))
    log.debug("on_pre_destroyObj: args 2: " .. tostring(args2))
    log.debug("on_pre_destroyObj: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_destroyObj: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_destroyObj(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("destroyObj"), on_pre_update, on_post_update)


function on_pre_removeFieldGimmick(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.removeFieldGimmick() " .. tostring(isSkill))
    log.debug("on_pre_removeFieldGimmick: args 2: " .. tostring(args2))
    log.debug("on_pre_removeFieldGimmick: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_removeFieldGimmick: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_removeFieldGimmick(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("removeFieldGimmick"), on_pre_update, on_post_update)


function on_pre_createObj(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.createObj() " .. tostring(isSkill))
    log.debug("on_pre_createObj: args 2: " .. tostring(args2))
    log.debug("on_pre_createObj: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_createObj: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_createObj(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("createObj"), on_pre_update, on_post_update)


function on_pre_loadFieldGimmickPrefab(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.loadFieldGimmickPrefab() " .. tostring(isSkill))
    log.debug("on_pre_loadFieldGimmickPrefab: args 2: " .. tostring(args2))
    log.debug("on_pre_loadFieldGimmickPrefab: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_loadFieldGimmickPrefab: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_loadFieldGimmickPrefab(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("loadFieldGimmickPrefab"), on_pre_update, on_post_update)


-- function on_pre_setFg001coolTime(args)
-- 	-- DifficultyWaveArgs = args
--     local args2 = args[2]
--     local NandoYuragi_type = args[3]
--     local isSkill = args[4]
--     log.debug("snow.stage.FieldGimmickManager.setFg001coolTime() " .. tostring(isSkill))
--     log.debug("on_pre_setFg001coolTime: args 2: " .. tostring(args2))
--     log.debug("on_pre_setFg001coolTime: args 3: " .. tostring(NandoYuragi_type))
--     log.debug("on_pre_setFg001coolTime: args 4: " .. tostring(isSkill))
--     log.debug("\n")
--     return sdk.PreHookResult.CALL_ORIGINAL
-- end
-- function on_post_setFg001coolTime(retval)
-- end
-- sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("setFg001coolTime"), on_pre_update, on_post_update)


function on_pre_requestFg001(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.requestFg001() " .. tostring(isSkill))
    log.debug("on_pre_requestFg001: args 2: " .. tostring(args2))
    log.debug("on_pre_requestFg001: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_requestFg001: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_requestFg001(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("requestFg001"), on_pre_update, on_post_update)


function on_pre_getRandomTargetFg002(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.getRandomTargetFg002() " .. tostring(isSkill))
    log.debug("on_pre_getRandomTargetFg002: args 2: " .. tostring(args2))
    log.debug("on_pre_getRandomTargetFg002: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_getRandomTargetFg002: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_getRandomTargetFg002(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("getRandomTargetFg002"), on_pre_update, on_post_update)


function on_pre_isSelectFg002(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.isSelectFg002() " .. tostring(isSkill))
    log.debug("on_pre_isSelectFg002: args 2: " .. tostring(args2))
    log.debug("on_pre_isSelectFg002: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_isSelectFg002: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_isSelectFg002(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("isSelectFg002"), on_pre_update, on_post_update)


function on_pre_getTargetFg002(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.getTargetFg002() " .. tostring(isSkill))
    log.debug("on_pre_getTargetFg002: args 2: " .. tostring(args2))
    log.debug("on_pre_getTargetFg002: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_getTargetFg002: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_getTargetFg002(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("getTargetFg002"), on_pre_update, on_post_update)


function on_pre_sendFg005LotInfo(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.sendFg005LotInfo() " .. tostring(isSkill))
    log.debug("on_pre_sendFg005LotInfo: args 2: " .. tostring(args2))
    log.debug("on_pre_sendFg005LotInfo: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_sendFg005LotInfo: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_sendFg005LotInfo(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("sendFg005LotInfo"), on_pre_update, on_post_update)


function on_pre_getFg005ActivationOrder(args)
	-- DifficultyWaveArgs = args
    local args2 = args[2]
    local NandoYuragi_type = args[3]
    local isSkill = args[4]
    log.debug("snow.stage.FieldGimmickManager.getFg005ActivationOrder() " .. tostring(isSkill))
    log.debug("on_pre_getFg005ActivationOrder: args 2: " .. tostring(args2))
    log.debug("on_pre_getFg005ActivationOrder: args 3: " .. tostring(NandoYuragi_type))
    log.debug("on_pre_getFg005ActivationOrder: args 4: " .. tostring(isSkill))
    log.debug("\n")
    return sdk.PreHookResult.CALL_ORIGINAL
end
function on_post_getFg005ActivationOrder(retval)
end
sdk.hook(sdk.find_type_definition("snow.stage.FieldGimmickManager"):get_method("getFg005ActivationOrder"), on_pre_update, on_post_update)
]]--


log.info("[Field Gimmick] finished loading")
