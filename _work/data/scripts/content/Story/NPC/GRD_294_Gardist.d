
instance GRD_294_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	guild = GIL_GRD;
	npcType = npctype_guard;
	level = 30;
	voice = 7;
	id = 294;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",1,1,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Sword_02);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoCheese);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItem(self,ItLsTorch);
	EquipItem(self,ItRw_Crossbow_01);
	daily_routine = Rtn_FMstart_294;
};


func void Rtn_FMstart_294()
{
	TA_GuardPalisade(0,0,13,0,"FM_132");
	TA_GuardPalisade(13,0,0,0,"FM_132");
};

