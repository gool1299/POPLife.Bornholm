
private["_helicrashSpawns","_dropArmsArray","_helicrashArray","_result","_spawnCount","_spawnArray"]; // WarBlast: Variables para el bucle

while {true} do
{
	// WarBlast: Seteo de variables
	_helicrashSpawns =
	[
		["helicrash_1","markerHeliCrash1","textHeliCrash1"],
		["helicrash_2","markerHeliCrash2","textHeliCrash2"],
		["helicrash_3","markerHeliCrash3","textHeliCrash3"],
		["helicrash_4","markerHeliCrash4","textHeliCrash4"]
	];
	// ARMA | CANTIDAD | CARGADOR | CANTIDAD
	_dropArmsArray =
	[
		["launch_RPG32_F",1,"RPG32_HE_F",1],
		["",0,"RPG32_HE_F",2],
		["launch_RPG32_F",1,"",0],
		["srifle_LRR_CAMO_F",1,"7Rnd_408_Mag",3],
		["",0,"7Rnd_408_Mag",6],
		["srifle_LRR_CAMO_F",1,"",0],
		["srifle_GM6_F",1,"5Rnd_127x108_Mag",3],
		["",0,"5Rnd_127x108_Mag",6],
		["srifle_GM6_F",1,"",0],
		["LMG_Mk200_F",1,"200Rnd_65x39_cased_Box_Tracer",1],
		["LMG_Mk200_F",2,"",0],
		["",0,"200Rnd_65x39_cased_Box_Tracer",4],
		["LMG_Zafir_F",1,"150Rnd_762x51_Box_Tracer",1],
		["",0,"150Rnd_762x51_Box_Tracer",4],
		["LMG_Zafir_F",2,"",0]
	];
	// VEST | CANTIDAD | HELM | CANTIDAD
	/*_dropArray =
	[
		["V_HarnessOGL_brn",2,"H_Shemag_olive_hs",2],
		["V_TacVest_camo",2,"H_ShemagOpen_tan",2],
		["V_Chestrig_rgr",2,"H_Shemag_khk",2],
		["V_BandollierB_cbr",2,"H_Watchcap_khk",2]
	];*/
	_helicrashArray = [];
	_spawnArray = [];

	// WarBlast: Seleccion de spawns
	_spawnCount = 2 + round(random(4));
	for "_i" from 1 to _spawnCount do {
		_result = _helicrashSpawns call BIS_fnc_selectRandom;
		_spawnArray pushBack _result;
		_helicrashSpawns = _helicrashSpawns - _result;
	};

	// WarBlast: Spawns de helicrash seleccionados.
	{
		private["_marker","_text","_heliSpawn","_smokeSpawn","_MilitaryCrate","_randomCrate","_randomPos","_Pos"];
		// WarBlast: Spawn del heli crash
		_heliSpawn = "Land_Wreck_Heli_Attack_01_F" createVehicle ([(_x select 0),0] call SHK_pos);
		_heliSpawn enableSimulation false;
		_heliSpawn allowDamage false;
		_Pos = position _heliSpawn;
		_smokeSpawn = "test_EmptyObjectForSmoke" createVehicle _Pos;

		// WarBlast: Caja militar que cae con aleatoriedad
		_MilitaryCrate = objNull;
		_randomCrate = random(100);
		if (_randomCrate > 40) then {
			_MilitaryCrate = "Box_NATO_Wps_F" createVehicle ([_heliSpawn,10] call SHK_pos);
			clearWeaponCargoGlobal _MilitaryCrate;
			clearMagazineCargoGlobal _MilitaryCrate;
			clearItemCargoGlobal _MilitaryCrate;
			clearBackpackCargoGlobal _MilitaryCrate;
			_result = _dropArmsArray call BIS_fnc_selectRandom;
            if ((_result select 0) != "" OR (_result select 1) != 0) then {
                _MilitaryCrate addWeaponCargoGlobal [(_result select 0), (_result select 1)];
            };
            if ((_result select 2) != "" OR (_result select 3) != 0) then {
                _MilitaryCrate addMagazineCargoGlobal [(_result select 2), (_result select 3)];
            };
            _MilitaryCrate = "Box_NATO_Wps_F" createVehicle ([_heliSpawn,10] call SHK_pos);
			clearWeaponCargoGlobal _MilitaryCrate;
			clearMagazineCargoGlobal _MilitaryCrate;
			clearItemCargoGlobal _MilitaryCrate;
			clearBackpackCargoGlobal _MilitaryCrate;
			_result = _dropArmsArray call BIS_fnc_selectRandom;
            if ((_result select 0) != "" OR (_result select 1) != 0) then {
                _MilitaryCrate addWeaponCargoGlobal [(_result select 0), (_result select 1)];
            };
            if ((_result select 2) != "" OR (_result select 3) != 0) then {
                _MilitaryCrate addMagazineCargoGlobal [(_result select 2), (_result select 3)];
            };
		};

		// WarBlast: Marcador
		_marker = _x select 1;
		createMarker [_marker, _Pos];
		_marker setMarkerColor "ColorOrange";
		_marker setMarkerType "Empty";
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [500,500];
		/*_text = _x select 2;
		createMarker [_text, _Pos];
		_text setMarkerColor "ColorIndependent";
		_text setMarkerText "Accidente de helicoptero";
		_text setMarkerType "mil_warning";
        */
		_helicrashArray pushBack [_heliSpawn,_smokeSpawn,_MilitaryCrate,_marker];
	} foreach _spawnArray;

	[[3,"<t color='#1EFF00' size='2'>¡ATENCIÓN!</t><br/>Se han registrado nuevos accidentes de helicopteros en Altis. Comprueba tu mapa para saber donde estan."],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

	sleep ([3600,5400] call BIS_fnc_randomInt); // 1 hora / 1 hora  media
	// WarBlast: Eliminamos los helicrash para meter nuevos.
	{
		private["_heli","_smoke","_crate"];
		_heli = _x select 0; _smoke = _x select 1; _crate = _x select 2;
		if(!isNil "_heli" OR !isNull _heli) then { deleteVehicle _heli; };
		if(!isNil "_crate" OR !isNull _crate) then { detach _crate; deleteVehicle _crate; };
		if(!isNil "_smoke" OR !isNull _smoke) then { _smoke setPos (getMarkerPos "helicrash_dropeffects");	};
		deleteMarker (_x select 3);
		//deleteMarker (_x select 4);
	} foreach _helicrashArray;
};