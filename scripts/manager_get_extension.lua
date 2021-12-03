-- 
-- Please see the license.txt file included with this distribution for 
-- attribution and copyright information.
--

function getExtensionName()
	local bThemeTable = Extension.getExtensions();
	
	for _, bThemeTable in ipairs(bThemeTable) do
		local bThemeName = Extension.getExtensionInfo(bThemeTable).name;
		if string.find(bThemeName, "Theme:") then
			return bThemeName;
		end
	end
end