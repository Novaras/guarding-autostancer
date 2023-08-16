

-- on update:
--  if guarding and no saved stance:
--    save the current stance
--    update stance to evasive
--  elseif not guarding and saved stance:
--    re-apply the saved
--    clear the saved

---@class GuardingAutostancer : Ship, { saved_stances: table<string, Stance> }
guarding_autostancer = {
	saved_stances = {}; -- ship_id <-> stance
};

function guarding_autostancer:update()
	local saved = guarding_autostancer.saved_stances[self.id];

	if (self:guarding() and saved == nil) then
		guarding_autostancer.saved_stances[self.id] = self:stance();
		self:stance(STANCE.EvasiveStance);
	elseif (not self:guarding() and saved ~= nil) then
		self:stance(saved);
		guarding_autostancer.saved_stances[self.id] = nil;
	end
end

modkit.compose:addBaseProto(guarding_autostancer);
