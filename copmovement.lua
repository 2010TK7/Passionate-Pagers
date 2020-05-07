local OldFunc = CopMovement.post_init
function CopMovement:post_init()
	OldFunc(self)
	self._unit:unit_data().has_alarm_pager = true
end