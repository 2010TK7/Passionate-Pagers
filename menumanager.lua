Hooks:Add('LocalizationManagerPostInit', 'PP_LocalizationManagerPostInit', function(loc)
	PassionatePagers:Load()
	if PassionatePagers.settings.PP_loc_chn then
		loc:load_localization_file(PassionatePagers._path .. 'loc/zh_cn.json', false)
	else
		loc:load_localization_file(PassionatePagers._path .. 'loc/en.json', false)
	end
end)

Hooks:Add('MenuManagerInitialize', 'PP_MenuManagerInitialize', function(menu_manager)
	MenuCallbackHandler.PPCheck = function(this, item)
		PassionatePagers.settings[item:name()] = item:value() == 'on'
		PassionatePagers:Save()
	end

	MenuCallbackHandler.PPSave = function(this, item)
		PassionatePagers:Save()
	end

	PassionatePagers:Load()
	MenuHelper:LoadFromJsonFile(PassionatePagers._path .. 'menu.json', PassionatePagers, PassionatePagers.settings)
end)