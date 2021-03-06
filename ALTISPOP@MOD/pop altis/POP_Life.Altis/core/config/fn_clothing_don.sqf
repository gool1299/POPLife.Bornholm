#include <macro.h>

private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Tienda de Donadores"];

_ret = [];
switch (_filter) do
{
	//Uniformes
	case 0:
	{
	_ret =
		[
				  
				  ["TRYK_U_denim_jersey_blu",nil,18000],
				  ["TRYK_U_denim_jersey_blk",nil,18000],
				  ["TRYK_U_denim_hood_blk",nil,18000],
				  ["TRYK_U_pad_hood_tan",nil,18000],
				  ["TRYK_U_taki_wh",nil,18000],
				  ["TRYK_U_taki_COY",nil,18000],
				  ["TRYK_U_taki_BLK",nil,18000],
				  ["TRYK_U_denim_hood_blk",nil,18000],
				  ["TRYK_U_B_OD_OD_CombatUniform",nil,18000],
				  ["TRYK_U_B_OD_OD_R_CombatUniform",nil,18000],
				  ["TRYK_U_B_TANTAN_CombatUniform",nil,18000],
				  ["TRYK_U_B_TANTAN_R_CombatUniform",nil,18000],
				  ["TRYK_U_B_BLKBLK_CombatUniform",nil,18000],
				  ["TRYK_U_B_BLKBLK_R_CombatUniform",nil,18000],
				  ["TRYK_U_B_GRYOCP_CombatUniform",nil,18000],
				  ["TRYK_U_B_GRYOCP_R_CombatUniformTshirt",nil,18000],
				  ["TRYK_U_B_TANOCP_CombatUniform",nil, 18000],
				  ["TRYK_U_B_TANOCP_R_CombatUniformTshirt",nil,18000],
				  ["TRYK_U_B_BLKOCP_CombatUniform",nil, 18000],
				  ["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",nil,18000],
				  ["TRYK_U_B_BLKTAN_CombatUniform",nil, 18000],
				  ["TRYK_U_B_BLKTANR_CombatUniformTshirt",nil,18000],
				  ["TRYK_U_B_ODTAN_CombatUniform",nil, 18000],
				  ["TRYK_U_B_ODTANR_CombatUniformTshirt",nil,18000],
				  ["TRYK_U_B_GRTAN_CombatUniform",nil, 18000],
				  ["TRYK_U_B_GRTANR_CombatUniformTshirt",nil,18000],
				  ["TRYK_U_B_wood_CombatUniform",nil, 18000],
				  ["TRYK_U_B_wood3c_CombatUniform",nil, 18000],
				  ["TRYK_U_B_wood3c_CombatUniformTshirt",nil, 18000],
				  ["TRYK_U_B_MARPAT_WOOD_CombatUniform",nil, 18000],
				  ["TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt",nil, 18000],
				  ["TRYK_U_B_WOOD_MARPAT_CombatUniform",nil,18000],
				  ["TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",nil,18000],
				  ["TRYK_U_B_woodtan_CombatUniform",nil,18000],
				  ["TRYK_U_B_woodtanR_CombatUniformTshirt",nil,18000],
				  ["TRYK_U_B_JSDF_CombatUniform",nil,18000],
				  ["TRYK_U_B_3CD_Delta_BDU",nil,18000],
				  ["TRYK_U_B_3CD_Delta_BDUTshirt",nil,18000],
				  ["TRYK_U_B_3CD_Ranger_BDU",nil, 18000],
				  ["TRYK_U_B_3CD_Ranger_BDUTshirt",nil,18000],
				  ["TRYK_U_B_ACU",nil,18000],
				  ["TRYK_U_B_ACUTshirt",nil,18000],
				  ["TRYK_U_B_MARPAT_Wood",nil,18000],
				  ["TRYK_U_B_MARPAT_Wood_Tshirt",nil,18000],
				  ["TRYK_U_B_MARPAT_Desert",nil,18000],
				  ["TRYK_U_B_MARPAT_Desert_Tshirt",nil,18000],
				  ["TRYK_U_B_3c",nil,18000],
				  ["TRYK_U_B_3cr",nil,18000],
				  ["TRYK_U_B_Sage_Tshirt",nil,18000],
				  ["TRYK_U_B_BLK3CD",nil,18000],
				  ["TRYK_U_B_BLK3CD_Tshirt",nil,18000],
				  ["TRYK_U_B_BLK",nil,18000],
				  ["TRYK_U_B_BLK_Tshirt",nil,18000],
				  ["TRYK_U_B_BLKTAN",nil,18000],
				  ["TRYK_U_B_BLKTAN_Tshirt",nil,18000],
				  ["TRYK_U_B_ODTAN",nil,18000],
				  ["TRYK_U_B_C01_Tsirt",nil,18000]
		];

	};

	//Goros
	case 1:
	{
	_ret =
		 [

				  ["TRYK_H_pakol",nil,1800],
				  ["TRYK_H_pakol2",nil,1800],
				  ["kio_vfv_mask",nil, 1500],
				  ["Kio_Capital_Hat",nil, 1500],
				  ["casco_moto",nil, 1500],
				  ["H_Orel_Mask_Dead",nil, 1500],
				  ["H_Orel_FireFighter",nil, 1500],
				  ["H_Orel_FireFighter_Gaz",nil, 1500],
				  ["Kio_No1_Hat",nil, 1500],
				  ["Kio_Pirate_Hat",nil, 1500],
				  ["Kio_Santa_Hat",nil, 1500],
				  ["H_Soccer_Orange",nil, 1500],
				  ["Kio_Spinning_Hat",nil, 1500],
				  ["H_Spliff",nil, 1500],
				  ["H_Orel_Swat",nil, 1500],
				  ["Kio_Hat",nil, 1500]
		];
	};

	//Gafas
	case 2:
	{
	_ret =
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};

	//Chalecos
	case 3:
	{
	_ret =
		[

			  ["TRYK_V_ArmorVest_AOR1",nil, 15000],
			  ["TRYK_V_ArmorVest_AOR2",nil, 15000],
			  ["TRYK_V_ArmorVest_coyo",nil, 15000],
			  ["TRYK_V_ArmorVest_Brown",nil, 15000],
			  ["TRYK_V_ArmorVest_CBR",nil, 15000],
			  ["TRYK_V_ArmorVest_khk",nil, 15000],
			  ["TRYK_V_ArmorVest_green",nil, 15000],
			  ["TRYK_V_ArmorVest_tan",nil, 15000],
			  ["TRYK_V_ArmorVest_Delta",nil, 15000],
			  ["TRYK_V_ArmorVest_Ranger",nil, 15000],
			  ["TRYK_V_ArmorVest_AOR1_2",nil, 15000],
			  ["TRYK_V_ArmorVest_AOR2_2",nil, 15000],
			  ["TRYK_V_ArmorVest_Brown2",nil, 15000],
			  ["TRYK_V_ArmorVest_coyo2",nil, 15000],
			  ["TRYK_V_ArmorVest_cbr2",nil, 15000],
			  ["TRYK_V_ArmorVest_green2",nil, 15000],
			  ["TRYK_V_ArmorVest_tan2",nil, 15000],
			  ["TRYK_V_ArmorVest_Delta2",nil, 15000],
			  ["TRYK_V_ArmorVest_Ranger2",nil, 15000],
		      ["TRYK_V_PlateCarrier_blk",nil, 15000],
			  ["TRYK_V_PlateCarrier_oli",nil, 15000],
			  ["TRYK_V_PlateCarrier_coyo",nil, 15000],
			  ["TRYK_V_PlateCarrier_ACU",nil, 15000],
			  ["TRYK_V_TacVest_coyo",nil, 15000]
		];
	};

	//Mochilas
	case 4:
	{
	_ret =
		[
			  ["TRYK_B_AssaultPack_Type2camo",nil, 15000],
			  ["TRYK_B_AssaultPack_MARPAT_Desert",nil, 15000],
			  ["TRYK_B_AssaultPack_MARPAT_Wood",nil, 15000],
			  ["TRYK_B_Kitbag_Base",nil, 15000],
			  ["TRYK_B_Kitbag_blk",nil, 15000],
			  ["TRYK_B_Kitbag_aaf",nil, 15000],
			  ["TRYK_B_Carryall_blk",nil, 15000],
			  ["TRYK_B_Carryall_wood",nil, 15000],
			  ["TRYK_B_Carryall_JSDF",nil, 15000],
			  ["TRYK_B_Kitbag_Base_JSDF",nil, 15000],
			  ["TRYK_B_Coyotebackpack",nil, 15000],
			  ["TRYK_B_Coyotebackpack_OD",nil, 15000],
			  ["TRYK_B_Coyotebackpack_BLK",nil, 15000],
			  ["TRYK_B_Alicepack",nil, 15000],
			  ["TRYK_B_Medbag",nil, 15000],
			  ["TRYK_B_Medbag_OD",nil, 15000],
			  ["TRYK_B_Medbag_BK",nil, 15000],
			  ["TRYK_B_Medbag_ucp",nil, 15000]
			  
			];
	};
};
_ret;