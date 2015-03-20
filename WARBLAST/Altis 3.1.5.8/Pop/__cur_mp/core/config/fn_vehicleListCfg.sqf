#include <macro.h>
/*
	File: fn_vehicleListCfg.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Ciaran + Wilco
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "crate_shop":
	{
		_return =
		[
			["Land_Cargo20_blue_F",400000]
		];
	};

	case "kart_shop":
	{
		_return =
		[
			["C_Kart_01_Blu_F",80000],
			["C_Kart_01_Red_F",80000],
			["C_Kart_01_Fuel_F",80000],
			["C_Kart_01_Vrana_F",80000]
		];
	};

	case "wreb_car":
	{
		_return =
		[
			["I_Heli_light_03_F",3500000],
			["I_Heli_light_03_unarmed_F",2000000],
			["B_Heli_Light_01_F",225000],
			["C_Heli_Light_01_civil_F",225000],
			["I_MRAP_03_F",400000],
			["O_G_Offroad_01_armed_F",1000000],
			["O_Truck_03_transport_F",70000],
			["O_Truck_03_covered_F",85000],
			["B_G_Offroad_01_F",8500]
		];
	};
	
	case "med_shop":
	{
		//Default
		_return = [
			["C_Hatchback_01_F",0]
		];

		if(__GETC__(life_nhsrank) >= 2) then //FA And Above
		{
			_return pushBack ["C_Van_01_box_F",0];
		};

		if(__GETC__(life_nhsrank) >= 3) then //MD And Above
		{
			_return pushBack ["C_SUV_01_F",0];
			_return pushBack ["C_Offroad_01_F",0];
		};
		
		if(__GETC__(life_nhsrank) >= 4) then //SUR And Above
		{
			_return pushBack ["C_Hatchback_01_sport_F",0];
		};
	};

	case "med_ship":
	{
		if(__GETC__(life_nhsrank) >= 3) then //MD And Above
		{
			_return = [
				["C_Boat_Civil_01_rescue_F",0],
				["O_Lifeboat",0]
			];
		};
	};

	case "arac_car":
	{
		_return = [
			["C_Offroad_01_repair_F",15000]
		];
	};

	case "taxi_car":
	{
		_return = [
			["C_SUV_01_F",40000]
		];
	};
	
	case "med_air_hs": {
		if(__GETC__(life_nhsrank) >= 3) then //MD And Above
		{
			_return = [
				["O_Heli_Light_02_unarmed_F",0]
			];
		};
	};
	
	case "civ_car_noquad": //No longer noquad.
	{
		_return =
		[
			["B_Quadbike_01_F",5000],
			["C_Hatchback_01_F",7000],
			["C_Offroad_01_F",14000],
			["C_SUV_01_F",40000],
			["C_Hatchback_01_sport_F",200000]
		];
	};

	case "civ_car":
	{
		_return =
		[
			["B_Quadbike_01_F",5000],
			["C_Hatchback_01_F",7000],
			["C_Offroad_01_F",14000],
			["C_SUV_01_F",40000],
			["C_Hatchback_01_sport_F",200000]
		];
	};

	case "civ_quad":
	{
		_return =
		[
			["B_Quadbike_01_F",5000]
		];
	};

	case "donator_sml":
	{
		_return =
		[
			["C_Hatchback_01_F",3500],
			["C_Hatchback_01_sport_F",50000],
			["C_Offroad_01_F",7000],
			["O_MRAP_02_F",1500000],
			["C_Van_01_transport_F",10000],
			["C_Van_01_box_F",15000],
			["I_Truck_02_transport_F",30000],
			["I_Truck_02_covered_F",40000],
			["O_Truck_03_transport_F",70000],
			["O_Truck_03_covered_F",85000],
			["B_Truck_01_transport_F",160000],
			["B_Truck_01_box_F",200000],
			["B_Truck_01_covered_F",160000],
			["B_Truck_01_mover_F",100000]
		];
	};

	case "donator_lrg":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",3500],
			["C_Hatchback_01_sport_F",50000],
			["C_Offroad_01_F",7000],
			["O_MRAP_02_F",1500000],
			["C_Van_01_transport_F",10000],
			["C_Van_01_box_F",15000],
			["I_Truck_02_transport_F",30000],
			["I_Truck_02_covered_F",40000],
			["O_Truck_03_transport_F",70000],
			["O_Truck_03_covered_F",85000],
			["B_Truck_01_transport_F",160000],
			["B_Truck_01_box_F",200000],
			["B_Truck_01_covered_F",160000],
			["B_Truck_01_mover_F",100000],
			["B_Heli_Light_01_F",225000],
			["C_Heli_Light_01_civil_F",225000],
			["O_Heli_Light_02_unarmed_F",500000],
			["I_Heli_light_03_unarmed_F",2000000],
			["I_Heli_Transport_02_F",3000000],
			["B_Heli_Transport_03_unarmed_F",15000000]
		];
	};		
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_transport_F",30000],
			["C_Van_01_box_F",45000],
			["I_Truck_02_transport_F",100000],
			["I_Truck_02_covered_F",120000],
			["O_Truck_03_transport_F",200000],
			["O_Truck_03_covered_F",225000],
			["B_Truck_01_transport_F",400000],
			["B_Truck_01_box_F",550000],
			["B_Truck_01_covered_F",400000],
			["B_Truck_01_mover_F",300000],
			["O_Truck_03_device_F",450000]
		];	
	};
	
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",5000],
			["C_Hatchback_01_F",7000],
			["C_Hatchback_01_sport_F",200000],
			["C_Offroad_01_F",14000],
			["O_MRAP_02_F",3000000],
			["C_Van_01_transport_F",30000],
			["C_Van_01_box_F",45000],
			["I_Truck_02_transport_F",100000],
			["I_Truck_02_covered_F",120000],
			["O_Truck_03_transport_F",200000],
			["O_Truck_03_covered_F",225000],
			["B_Truck_01_transport_F",400000],
			["B_Truck_01_box_F",550000],
			["B_Truck_01_covered_F",400000],
			["B_Truck_01_mover_F",300000],
			["B_G_Offroad_01_armed_F",500000]
		];
	};
	
	case "reb_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",450000],
			["C_Heli_Light_01_civil_F",450000],
			["O_Heli_Light_02_unarmed_F",1000000],
			["I_Heli_light_03_unarmed_F",4000000],
			["I_Heli_Transport_02_F",6000000]
		];
	};

	case "mayor":
	{
		_return pushBack ["C_SUV_01_F",40000];
	};
	
	case "cop_car":
	{
		_return = //CSO AND PCSO
		[
			["C_Hatchback_01_F",0]
			//["C_Offroad_01_F",0]
		];
		
		if(__GETC__(life_plodrank) >= 3) then //PC AND ABOVE
		{
			_return pushBack ["C_SUV_01_F",0];
			_return pushBack ["I_Truck_02_covered_F",0];
		};
		
		if(__GETC__(life_plodrank) >= 4) then //SPC AND ABOVE
		{
			_return pushBack ["C_Offroad_01_F",0];
		};

		if(__GETC__(life_plodrank) >= 5) then //SGT AND ABOVE
		{
			_return pushBack ["C_Hatchback_01_sport_F",0];
		};

		if(__GETC__(life_plodrank) >= 8 || call life_fnc_isAR) then
		{
			_return pushBack ["B_MRAP_01_F",0];
			_return pushBack ["B_UAV_01_F",0];
		};
		if(call life_fnc_isAR) then
		{
			_return pushBack ["B_UGV_01_rcws_F",0];
		};
	};	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",450000],
			["C_Heli_Light_01_civil_F",450000],
			["O_Heli_Light_02_unarmed_F",1000000],
			["I_Heli_light_03_unarmed_F",4000000],
			["I_Heli_Transport_02_F",6000000],
			["I_Plane_Fighter_03_AA_F",15000000],
			["O_Plane_CAS_02_F",20000000],
			["B_Heli_Transport_03_unarmed_F",30000000]
		];
	};
	
	case "cop_air":
	{
		if(call life_fnc_isNPAS) then
		{
			_return pushBack ["B_Heli_Light_01_F",0];
			_return pushBack ["C_Heli_Light_01_civil_F",0];
		};

		if(__GETC__(life_plodrank) >= 4) then
		{
			_return pushBack ["B_UAV_01_F",0];
		};
	};

	case "cop_airhq":
	{
		if(call life_fnc_isNPAS) then
		{
			_return pushBack ["I_Heli_light_03_unarmed_F",0];
			_return pushBack ["B_Heli_Transport_01_F",0];
			_return pushBack ["B_Heli_Light_01_F",0];
			_return pushBack ["C_Heli_Light_01_civil_F",0];
		};
		if(__GETC__(life_plodrank) >= 4 || call life_fnc_isAR || call life_fnc_isNPAS) then
		{
			_return pushBack ["B_UAV_01_F",0];
		};
		if(call life_fnc_isAR) then 
		{
			_return pushBack ["O_Heli_Transport_04_bench_F",0];
			_return pushBack ["O_Heli_Transport_04_covered_F",0];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",4999],
			["C_Boat_Civil_01_F",39999]
		];
		if(license_civ_rebel) then
		{
			_return pushBack ["I_SDV_01_F",1499999];
		};
	};
	
	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",0],
			["C_Boat_Civil_01_police_F",0],
			["B_Boat_Armed_01_minigun_F",0],
			["B_SDV_01_F",0]
		];
	};
};

_return;
