/*
	File: fn_robosActivos.sqf
	Author: Quickskill
	Desc: Activar robo "+1 si ya estan robando sino incluir robo en array global de robos"
*/
private ["_nombreRobo ","_roboActivo ","_ladronesEnRobo"];

_nombreRobo =  [_this, 0, "",[""]] call BIS_fnc_param;
//_roboActivo = "no";

///for de robos activos
{
//nombre robo del array global de robos activos
_nombreRoboCompare = _x select [0,1];
//_ladronesEnRobo  = _x   select [1,1];

//buscar si no hay ningun robo con ese nombre en el array de robos activos
if !(_nombreRobo == _nombreRoboCompare) then {
  // ya estan robando actualizar numero de ladrones
 //   _roboActivo = "si";
  // _ladronesEnRobo  = _x select [1,1];
  robosActivosGLOBAL pushBack [_nombreRobo];
  //_x  set [_forEachIndex,[_nombreRoboCompare,_ladronesEnRobo + 1]];
} else {

};

} forEach robosActivosGLOBAL;


//sino esta en la lista de robosActivos agregamso el robo con 1 ladron inicial
/*if(_roboActivo == "no") then {

robosActivosGLOBAL pushBack [_nombreRobo];

};
*/
//publicVariable "robosActivosGLOBAL";


///for de robos activos
/*_robosActivosCount = 0;

{
	 // mirar cuantos ladrones hay en cada robo
   _ladronesData = _x;
   _ladronesEnRobo  = _ladronesData  select [1,1];
//debug
diag_log format["El array robosActivosGlobal contiene el robo: ""%1"" con ladrones  %2->", _ladronesData  select [0,1],_ladronesData  select [1,1]];

//buscar si no hay ningun robo con ese nombre en el array de robos activos
if (_ladronesEnRobo > 0) then {

  _robosActivosCount = _robosActivosCount +1;
};


} forEach robosActivosGLOBAL;
*/
//devuelve el numero de robos activos
//robosActivosGLOBAL = _robosActivosCount;
//publicVariable "robosActivosCount";
//diag_log format["La variable robosActivosCount contiene: ""%1""", robosActivosCount];
