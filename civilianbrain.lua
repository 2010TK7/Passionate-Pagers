local OldFunc = CivilianBrain.on_alarm_pager_interaction
function CivilianBrain:on_alarm_pager_interaction(status, ...)
	OldFunc(self, status, ...)
	if status ~= "started" and not self._unit:character_damage():dead() then
		self._unit:interaction():set_tweak_data("hostage_move")
		self._unit:interaction():set_active(true, true)
	end
end