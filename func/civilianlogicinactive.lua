PassionatePagers:Load()
if not PassionatePagers.settings.PP_civ_die then return end

local OldFunc = CivilianLogicInactive._set_interaction
function CivilianLogicInactive._set_interaction(data, my_data)
	if data.unit:character_damage():dead() then
		if managers.groupai:state():whisper_mode() then
			data.brain:begin_alarm_pager()
		else
			data.unit:interaction():set_tweak_data("corpse_dispose")
			data.unit:interaction():set_active(true, true, true)
		end
	end
end