
func void B_Story_FMTaken()
{
	var C_Npc fighter;
	fighter = Hlp_GetNpc(PC_Fighter);
	Npc_ExchangeRoutine(fighter,"NCREPORT");
	B_KillNpc(SLD_750_Soeldner);
	B_KillNpc(SLD_751_Soeldner);
	B_KillNpc(SLD_752_Okyl);
	B_KillNpc(SLD_753_Baloro);
	B_KillNpc(SLD_755_Soeldner);
	B_KillNpc(SLD_756_Soeldner);
	B_KillNpc(SLD_757_Soeldner);
	B_KillNpc(SLD_758_Soeldner);
	B_KillNpc(SLD_759_Soeldner);
	B_KillNpc(SLD_760_Soeldner);
	B_KillNpc(SLD_761_Soeldner);
	B_KillNpc(SLD_762_Soeldner);
	B_KillNpc(SLD_763_Soeldner);
	B_KillNpc(SLD_764_Soeldner);
	B_KillNpc(SLD_765_Soeldner);
	B_KillNpc(SFB_1030_Schuerfer);
	B_KillNpc(SFB_1031_Schuerfer);
	B_KillNpc(SFB_1032_Schuerfer);
	B_KillNpc(SFB_1033_Schuerfer);
	B_KillNpc(SFB_1034_Schuerfer);
	B_KillNpc(SFB_1035_Schuerfer);
	B_KillNpc(SFB_1036_Schuerfer);
	B_KillNpc(SFB_1037_Swiney);
	B_KillNpc(SFB_1038_Schuerfer);
	B_KillNpc(SFB_1039_Schuerfer);
	B_KillNpc(SFB_1040_Schuerfer);
	B_KillNpc(SFB_1041_Schuerfer);
	B_KillNpc(SFB_1042_Schuerfer);
	B_KillNpc(SFB_1043_Schuerfer);
	B_KillNpc(SFB_1044_Schuerfer);
	B_KillNpc(ORG_890_Organisator);
	B_KillNpc(ORG_891_Organisator);
	B_KillNpc(ORG_892_Organisator);
	Wld_InsertNpc(Grd_283_Gardist,"FMC_ENTRANCE");
	Wld_InsertNpc(Grd_285_Gardist,"FMC_ENTRANCE");
	B_ExchangeRoutine(Grd_201_Jackal,"FMTaken");
	Wld_SetObjectRoutine(0,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(1,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(2,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(3,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(4,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(5,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(6,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(7,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(8,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(9,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(10,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(11,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(12,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(13,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(14,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(15,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(16,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(17,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(18,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(19,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(20,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(21,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(22,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(23,0,"EVT_AM_LOB_GATE_BIG",1);
	if(Npc_KnowsInfo(hero,Info_Milten_OCWARN))
	{
		B_LogEntry(CH4_Firemages,"Diego mi byl schopen ????ci o ud??lostech ve Star??m t??bo??e n??co v??c.");
	}
	else
	{
		B_LogEntry(CH4_Firemages,"U zadn??ho vchodu do Star??ho t??bora m?? Diego zastavil a varoval m?? p??ed ??adou incident??, kter?? se tu nyn?? odehr??vaj??.");
	};
	B_LogEntry(CH4_Firemages,"Po zavalen?? Star??ho dolu p??ik??zal Gomez sv??m mu????m, aby napadli Svobodn?? d??l pat????c?? Nov??mu t??boru. Kdy?? se Corristo a m??gov?? Ohn?? proti tomuto pl??nu zp????ovali, Gomezovi mu??i je zavra??dili.");
	B_LogEntry(CH4_Firemages,"Mus??m co nejrychleji Nov?? t??bor varovat a informovat Saturase o tomto incidentu. K???? to stihnu v??as.");
	if(Scorpio_Exile == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Scorpio z??stal ve Star??m t??bo??e a te?? ob??v?? spolu s Cavalornem loveckou ch????i mezi Star??m a Nov??m t??borem.");
		Scorpio_Exile = TRUE;
	};
	FMTaken = TRUE;
};

