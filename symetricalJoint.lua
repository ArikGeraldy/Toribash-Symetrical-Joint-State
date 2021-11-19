echo("Created by ryuu, requested by odranoel")
echo("Use Left Shift button to activate")

local function mirror_joint(key)
	local triggerState=get_shift_key_state()
	if triggerState == 1 then
		jointSelect = get_world_state().selected_joint
		playerSelect = get_world_state().selected_player
		if jointSelect>=10 then
			if jointSelect%2 == 0 then otherJoint=jointSelect+1		
			else otherJoint=jointSelect-1 
			end
			symetricalJoint()
		elseif jointSelect<=9 and jointSelect>=4 then
			if jointSelect<=6 then otherJoint=jointSelect+3
			else otherJoint=jointSelect-3
			end
			symetricalJoint()
		end 
	end
end

function symetricalJoint()
	jointState=get_joint_info(playerSelect, jointSelect)
	set_joint_state(playerSelect, otherJoint, jointState.state)
	set_ghost(2)
end

add_hook("mouse_button_up", "", mirror_joint)