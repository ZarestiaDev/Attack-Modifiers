-- 
-- Please see the license.txt file included with this distribution for 
-- attribution and copyright information.
--

function getThemeName()
	local tTheme = Extension.getExtensions();
	
	for _,v in ipairs(tTheme) do
		local sThemeName = Extension.getExtensionInfo(v).name;
		if string.find(sThemeName, "Theme:") then
			return sThemeName;
		end
	end
end

function getExtensionName()
	local tName = Extension.getExtensions();
	local sName = table.concat(tName, ",");
	return sName;
end