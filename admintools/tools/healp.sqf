private ["_player","_unit","_UIfix","_UIfix2"];healDistance = -1;_player = player;distanceMenu = [	["",true],	["Select distance:", [-1], "", -5, [["expression", ""]], "1", "0"],	["5", [2], "", -5, [["expression", "healDistance=5;"]], "1", "1"],	["10", [3], "", -5, [["expression", "healDistance=10;"]], "1", "1"],	["25", [4], "", -5, [["expression", "healDistance=25;"]], "1", "1"],	["50", [5], "", -5, [["expression", "healDistance=50;"]], "1", "1"],	["100", [6], "", -5, [["expression", "healDistance=100;"]], "1", "1"],	["500", [7], "", -5, [["expression", "healDistance=500;"]], "1", "1"],	["1000", [8], "", -5, [["expression", "healDistance=1000;"]], "1", "1"],	["10000", [9], "", -5, [["expression", "healDistance=10000;"]], "1", "1"],	["Self", [10], "", -5, [["expression", "healDistance=0;"]], "1", "1"],	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	];showCommandingMenu "#USER:distanceMenu";WaitUntil{commandingMenu == ""};if(healDistance == -1) exitWith {};r_player_blood = r_player_bloodTotal;r_player_inpain = false;r_player_infected = false;r_player_injured = false;dayz_hunger	= 0;dayz_thirst = 0;dayz_temperatur = 100;r_fracture_legs = false;r_fracture_arms = false;r_player_dead = false;r_player_unconscious = false;r_player_loaded = false;r_player_cardiac = false;r_player_lowblood = false;r_doLoop = false;r_action = false;r_player_timeout = 0;r_handlerCount = 0;r_interrupt = false;disableUserInput false;dayz_sourceBleeding = objNull;_player setVariable ["USEC_injured",false,true];_player setVariable['USEC_inPain',false,true];_player setVariable['USEC_infected',false,true];_player setVariable['USEC_lowBlood',false,true];_player setVariable['USEC_BloodQty',12000,true];_player setVariable['USEC_isCardiac',false,true];{_player setVariable[_x,false,true];} forEach USEC_woundHit;_player setVariable ["unconsciousTime", r_player_timeout, true];_player setVariable['NORRN_unconscious',false,true];_player setVariable ['messing',[dayz_hunger,dayz_thirst],true];_player setHit ['legs',0];_player setVariable ['hit_legs',0,true];_player setVariable ['hit_hands',0,true];_player setVariable['medForceUpdate',true,true];_player setVariable["inCombat",false, true];disableSerialization;_UIfix = (uiNameSpace getVariable 'DAYZ_GUI_display') displayCtrl 1303;_UIfix2 = (uiNameSpace getVariable 'DAYZ_GUI_display') displayCtrl 1203;_UIfix ctrlShow false;_UIfix2 ctrlShow false;if(healDistance == 0) exitWith {};xyzaa = _player nearEntities ["Man", healDistance];{	if (!(_x isKindOf "zZombie_Base") && !(_x isKindOf "Animal")) then {		_unit = _x;		PVDZ_send = [_unit,"Bandage",[_unit,player]];		publicVariableServer "PVDZ_send";				PVDZ_send = [_unit, "Transfuse", [_unit, player, 12000]];		publicVariableServer "PVDZ_send";				PVDZ_send = [_unit,"Morphine",[_unit,player]];		publicVariableServer "PVDZ_send";				PVDZ_send = [_unit,"Epinephrine",[_unit,player,"ItemEpinephrine"]];		publicVariableServer "PVDZ_send";				PVDZ_send = [_unit,"Painkiller",[_unit,player]];		publicVariableServer "PVDZ_send";				PVDZ_send = [_unit,"Antibiotics",[_unit,player]];		publicVariableServer "PVDZ_send";	};} forEach xyzaa;format["%1 healed",xyzaa] call dayz_rollingMessages;