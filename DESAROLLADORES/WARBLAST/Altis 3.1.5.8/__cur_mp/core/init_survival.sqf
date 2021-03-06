[] spawn {
	private["_fnc_food","_fnc_water"];
	_fnc_food = 
	{
		if(life_hunger < 2) then {[player,"Fainted due to starvation."] call life_fnc_medilogSubmit; player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
		else
		{

		_lvl1 = [8] call life_fnc_hasTalent;
		_lvl2 = [9] call life_fnc_hasTalent;
			
		//Work out the amount to reduce! DEFAULT: 10
		if(_lvl1) then {
			if(_lvl2) then {
				life_hunger = life_hunger - 5; //Take only 5 here (50% of 10)
			} else {
				life_hunger = life_hunger - 8; //Cannot use a double value. Lets use 7.5 rounded up.
			};
		} else {
			life_hunger = life_hunger - 10; //Normal Amount
		};
		if(life_hunger < 0) then {life_hunger = 0;}; //New safeguard.
		
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {[player,"Fainted due to starvation."] call life_fnc_medilogSubmit;player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
			switch(life_hunger) do {
				case 30: {hint localize "STR_NOTF_EatMSG_1";};
				case 20: {hint localize "STR_NOTF_EatMSG_2";};
				case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then {[player,"Fainted due to dehydration."] call life_fnc_medilogSubmit; player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
		else
		{
			_lvl1 = [8] call life_fnc_hasTalent;
			_lvl2 = [9] call life_fnc_hasTalent;
			
			//Work out the amount to reduce! DEFAULT: 10
			if(_lvl1) then {
				if(_lvl2) then {
					life_thirst = life_thirst - 5; //Take only 5 here (50% of 10)
				} else {
					life_thirst = life_thirst - 8; //Cannot use a double value. Lets use 7.5 rounded up.
				};
			} else {
				life_thirst = life_thirst - 10; //Normal Amount
			};
			if(life_thirst < 0) then {life_thirst = 0;}; //New safeguard.

			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {[player,"Fainted due to dehydration."] call life_fnc_medilogSubmit; player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
			switch(life_thirst) do 
			{
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
			};
		};
	};
	
	while{true} do
	{
		sleep 600;
		[] call _fnc_water;
		sleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 7);
		
		_talent1 = [20] call life_fnc_hasTalent;
		_talent2 = [21] call life_fnc_hasTalent;
		_talent3 = [22] call life_fnc_hasTalent;

		//Talent System add to the max weight.
		if(_talent1) then {
			_load = _load + 5;
			if(_talent2) then {
				_load = _load + 5;
				if(_talent3) then {
					_load = _load + 5;
				};
			};
		};

		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp || life_refreshBackpackSpace};
		if(life_refreshBackpackSpace) then {life_refreshBackpackSpace = false;};
			
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 2.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;

					//life_thirst = life_thirst - 5;
					//life_hunger = life_hunger - 5;
					_lvl1 = [8] call life_fnc_hasTalent;
					_lvl2 = [9] call life_fnc_hasTalent;

					//Work out the amount to reduce! DEFAULT: 5
					if(_lvl1) then {
						if(_lvl2) then {
							life_thirst = life_thirst - 2; //Take only 2 here, should be three but wanted a bigger impact.
							life_hunger = life_hunger - 2; //Take only 2 here, should be three but wanted a bigger impact.
						} else {
							life_thirst = life_thirst - 4; //Cannot use a double value. Lets use 3.75 rounded up.
							life_hunger = life_hunger - 4; //Cannot use a double value. Lets use 3.75 rounded up.
						};
					} else {
						life_thirst = life_thirst - 5; //Normal Amount
						life_hunger = life_hunger - 5; //Normal amount
					};
					if(life_thirst < 0) then {life_thirst = 0;}; //New safeguard.
					if(life_hunger < 0) then {life_hunger = 0;};

					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

[] spawn
{
	//Preform hud updates + Keep sentences off.. + Keep fatigue off
	while {true} do
	{
		sleep 20;
		[] call life_fnc_hudUpdate;
		enableSentences false;
		player enableFatigue false;
	};
};

[] spawn
{
	life_drinkypoo = 0;
	while {true} do
	{
		waitUntil {sleep 15; (life_drinkypoo > 0)};
		while{(life_drinkypoo > 0)} do {
			"chromAbberation" ppEffectEnable true;
			enableCamShake true;
			"radialBlur" ppEffectEnable true;

			"chromAberration" ppEffectAdjust[0.16,random 0.16, true];
			"chromAberration" ppEffectCommit 1;   
			"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
			"radialBlur" ppEffectCommit 3;
			
			_mod = (life_drinkypoo * 5);

			//TODO - RANDOM CHANCE OF GETTING KNOCKED OUT IF WE ARE SO DRUNK

			if(_mod < 1) then {_mod = 1;};
			if(_mod > 8) then {_mod = 7; hintSilent "I feel really sick..";};
			addcamShake[_mod, _mod, _mod];

			//sleep 240;
			life_drinkypoo = life_drinkypoo - 0.002;
			sleep 2;
			player setVariable["bac",life_drinkypoo,true];	
		};
		life_drinkypoo = 0;			
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		"chromAberration" ppEffectAdjust [0,0,true];
		"chromAberration" ppEffectCommit 5;
		sleep 5;
		resetCamShake;
		player setVariable["bac",life_drinkypoo,true];	
		[] call life_fnc_hudUpdate;
	};
};

[] spawn {
	if(playerSide != civilian) exitWith {};
	while {true} do {
		waitUntil {sleep 15; player distance fed_bank < 50};
		//If it is not hacked
		if(!(currentWeapon player == "" || currentWeapon player == "binocular")) then {
			if(!(life_fed_hacked)) then {
				//Security Spots them!
				hint "The security cameras have spotted you! The alarm has been raised and police are on the way.";
				[[[1,0,2],format["A camera at the federal reserve has detected a intruder with a weapon at the Altis Bank!"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
			} else {
				hint "The security cameras are disabled. You have not been detected!";
			};
		};	
		waitUntil {sleep 15; player distance fed_bank > 50};
	};
};