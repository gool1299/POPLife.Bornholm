/*
	Author: Tobias 'Xetoxyc' Sittenauer

	Edit CollinM999
	
	File: fn_removeWeapons.sqf
*/
private["_cop","_legal","_handgun","_magWeapAllow","_magArr","_handgun","_legalitems","_uniformitems","_backpackitems","_vestitems"];

_cop = [_this,0,objNull,[objNull]] call BIS_fnc_param;

_legalitems = ["Binocular","ItemGPS","ToolKit","FirstAidKit","NVGoggles","Chemlight_red","Chemlight_yellow","Chemlight_green","Chemlight_blue","Medikit"];
_legal = [
	"hgun_Rook40_F",
	"hgun_ACPC2_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_PDW2000_F",
	"hgun_P07_F",
	"hgun_P07_snds_F",
	"hgun_Pistol_heavy_02_F",
	"hgun_ACPC2_F",
	"hgun_PDW2000_F",
	"arifle_sdar_F"
];
_magWeapAllow = ["16Rnd_9x21_Mag","9Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder","30Rnd_9x21_Mag","20Rnd_556x45_UW_mag","11Rnd_45ACP_Mag","30Rnd_556x45_Stanag"];

_magArr = magazines player;
_handgun = handgunWeapon player;
_uniformitems = uniformItems player;
_backpackitems = backpackItems player;
_vestitems = vestItems player;

if(_cop == player) then {};
if(isNull player) exitWith {};
if(isNull _cop OR !(player getVariable["restrained",FALSE])) exitWith {};

//First remove ALL Weapons and Magazines, later add them back if they where legit.
removeAllWeapons player; 
{player removeMagazine _x} foreach (magazines player); 
hint "Se incautaron todas las armas ilegales.";

//Add Back normal stuff

{ if( (_x) in _legalitems ) then { player addItemToUniform _x; }; } foreach _uniformitems;
{ if( (_x) in _legalitems ) then { player addItemToVest _x; }; } foreach _vestitems;
{ if( (_x) in _legalitems ) then { player addItemToBackpack _x; }; } foreach _backpackitems;

//Now Check license and legal weps addback
if((license_civ_gun) && (_handgun) in _legal) then {
	switch(true) do 
	{
		case (player canAddItemToBackpack _handgun):
		{
			player addItemToBackpack _handgun;
			{ if( (_x) in _magWeapAllow ) then { player addMagazine _x; }; } foreach _magArr; 
 
		};
		case (player canAddItemToVest _handgun):
		{
			player addItemToVest _handgun;
			{ if( (_x) in _magWeapAllow ) then { player addMagazine _x; }; } foreach _magArr;	
		};
		case (player canAddItemToUniform _handgun):
		{
			player addItemToUniform _handgun;
			{ if( (_x) in _magWeapAllow ) then { player addMagazine _x; }; } foreach _magArr;
		};
		default
		{
			removeAllWeapons player;
			{player removeMagazine _x} foreach (magazines player);
		};
	};
} else {
	hint "No tiene licencia de armas, se decomisaron todas las armas.";
};

[[0,format["%1's Sus armas fueron confiscadas por %2 ", name player, name _cop]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;