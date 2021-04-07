
instance DIA_Stone_Hello(C_Info)
{
	npc = GRD_219_Stone;
	nr = 1;
	condition = DIA_Stone_Hello_Condition;
	information = DIA_Stone_Hello_Info;
	permanent = 0;
	description = "Ty jsi kovář, viď?";
};


func int DIA_Stone_Hello_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Stone_Hello_Info()
{
	AI_Output(other,self,"DIA_Stone_Hello_15_00");	//Ty jsi kovář, viď?
	AI_Output(self,other,"DIA_Stone_Hello_06_01");	//Ano.
};


instance DIA_Stone_NotSelling(C_Info)
{
	npc = GRD_219_Stone;
	nr = 1;
	condition = DIA_Stone_NotSelling_Condition;
	information = DIA_Stone_NotSelling_Info;
	permanent = 1;
	description = "Prodáváš zbraně a zbroj?";
};


func int DIA_Stone_NotSelling_Condition()
{
	if((Npc_GetTrueGuild(hero) != GIL_GRD) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Stone_NotSelling_Info()
{
	AI_Output(other,self,"DIA_Stone_NotSelling_15_00");	//Prodáváš zbraně a zbroj?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_01");	//O zbraních se nebavme. Dělám jenom zbroj.
	AI_Output(other,self,"DIA_Stone_NotSelling_15_02");	//Jaký typ zbroje můžeš nabídnout?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_03");	//Jedině zbroj pro stráže. A ty strážce nejsi. Takže si musíš zbroj obstarat někde jinde!
	AI_StopProcessInfos(self);
};


instance GRD_219_Stone_GETSTUFF(C_Info)
{
	npc = GRD_219_Stone;
	condition = GRD_219_Stone_GETSTUFF_Condition;
	information = GRD_219_Stone_GETSTUFF_Info;
	important = 0;
	permanent = 0;
	description = "Potřebuji zbroj.";
};


func int GRD_219_Stone_GETSTUFF_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_219_Stone_GETSTUFF_Info()
{
	AI_Output(other,self,"GRD_219_Stone_GETSTUFF_Info_15_01");	//Potřebuji zbroj.
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_02");	//Takže tě Thorus přijal, jo? blahopřeju!
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_03");	//Další dychtivec, který by nastavil za Gomeze krk. No výborně, o co se mám postarat?
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_04");	//Tady si vezmi zbroj a meč. Vítej mezi stráže.
	CreateInvItems(self,ItMw_1H_Sword_03,2);
	B_GiveInvItems(self,other,ItMw_1H_Sword_03,2);
	Npc_RemoveInvItem(other,ItMw_1H_Sword_03);
	CreateInvItem(other,grd_armor_l);
	AI_EquipBestArmor(hero);
	AI_EquipBestMeleeWeapon(hero);
	B_LogEntry(GE_BecomeGuard,"Dostal jsem od kováře Stonea svoji první zbroj stráže. Nemohl bych u něj ani koupit lepší, protože má příliš vysoké ceny.");
	AI_StopProcessInfos(self);
};


instance GRD_219_Stone_BETTERARMOR(C_Info)
{
	npc = GRD_219_Stone;
	condition = GRD_219_Stone_BETTERARMOR_Condition;
	information = GRD_219_Stone_BETTERARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Potřebuju lepší zbroj.";
};


func int GRD_219_Stone_BETTERARMOR_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_219_Stone_GETSTUFF) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void GRD_219_Stone_BETTERARMOR_Info()
{
	AI_Output(other,self,"GRD_219_Stone_BETTERARMOR_Info_15_01");	//Potřebuju lepší zbroj.
	AI_Output(self,other,"GRD_219_Stone_BETTERARMOR_Info_06_02");	//Můžeš ji mít, až si ji zasloužíš a jedině tehdy, když budeš mít dost rudy...
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,DIALOG_BACK,GRD_219_Stone_BETTERARMOR_BACK);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,B_BuildBuyArmorString(NAME_StoneHeavyGuards,VALUE_GRD_ARMOR_H),GRD_219_Stone_BETTERARMOR_H);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,B_BuildBuyArmorString(NAME_StoneGuards,VALUE_GRD_ARMOR_M),GRD_219_Stone_BETTERARMOR_M);
};

func void GRD_219_Stone_BETTERARMOR_M()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01");	//Chci obyčejnou zbroj pro stráž.
	if(Kapitel < 3)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02");	//Thorus říká, že se musíš nejdříve osvědčit jako strážce, než dostaneš lepší zbroj.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_GRD_ARMOR_M)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03");	//Jednu mám na skladě, ale neřekl bych, že bys na ni měl dost rudy! Vrať se, až si ji budeš moci dovolit!
	}
	else
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04");	//Dobrá, tady je nová zbroj pro stráže! Nedovol žoldákům, aby ti ji moc okousali, hahaha!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_GRD_ARMOR_M);
		B_GiveInvItems(self,hero,grd_armor_m,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_H()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01");	//Chci těžkou zbroj pro strážce.
	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02");	//Takovou může mít jedině vyšší třída stráží. Ale mám obavu, že do toho máš ještě hodně daleko.
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_BACK()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Rozmyslel jsem se.
	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02");	//Dělej, jak myslíš. Víš, kde mě najdeš!
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};


instance DIA_GRD_219_Stone_Exit(C_Info)
{
	npc = GRD_219_Stone;
	nr = 999;
	condition = DIA_GRD_219_Stone_Exit_Condition;
	information = DIA_GRD_219_Stone_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GRD_219_Stone_Exit_Condition()
{
	return 1;
};

func void DIA_GRD_219_Stone_Exit_Info()
{
	var C_Npc Stone;
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone4))
	{
		AI_StopProcessInfos(self);
		Stone = Hlp_GetNpc(GRD_219_Stone);
		TA_BeginOverlay(Stone);
		TA_Min(Stone,0,0,0,5,ZS_Position,"OCC_MERCS_HALLWAY_BACK");
		TA_Min(Stone,0,5,0,10,ZS_Position,"OCC_MERCS_ENTRANCE");
		TA_Min(Stone,0,10,0,15,ZS_Position,"OCC_SHADOWS_CORNER");
		TA_Min(Stone,0,15,0,20,ZS_Position,"OCC_STABLE_ENTRANCE");
		TA_Min(Stone,0,20,72,0,ZS_Position,"OCC_STABLE_LEFT_FRONT");
		TA_EndOverlay(Stone);
		AI_Output(self,other,"Info_EXIT_06_02");	//Ještě se uvidíme.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_EXIT_06_03");	//Ještě se uvidíme.
		AI_StopProcessInfos(self);
	};
};


instance DIA_GRD_219_Stone(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone_Condition;
	information = DIA_GRD_219_Stone_Info;
	important = 1;
	permanent = 0;
};


func int DIA_GRD_219_Stone_Condition()
{
	if(Kapitel >= 5)
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone_Info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone_06_01");	//Co chceš? Nevypadáš na Gomezova stoupence.
};


instance DIA_GRD_219_Stone1(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone1_Condition;
	information = DIA_GRD_219_Stone1_Info;
	important = 0;
	permanent = 0;
	description = "Máš pravdu, nejsem s Gomezem.";
};


func int DIA_GRD_219_Stone1_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone1_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_01");	//Máš pravdu, nejsem s Gomezem.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_02");	//Jak ses sem potom dostal? Gomez má klíč k vězení...
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_03");	//Dal mi ho.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_04");	//Snažíš se mi namluvit, že to TY jsi porazil Gomeze?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_05");	//To jsem já.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_06");	//Nikdy bych, hochu, neřekl, že zrovna ty bys to dokázal. Ale jsem rád, že ten hrdlořez konečně dostal to, co si zasluhoval.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_07");	//Proč jsi mě ale osvobodil?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_08");	//Slyšel jsem, že tě tu zamkli a pomyslel jsem si, že bych mohl Gomeze odstranit a vysvobodit tě.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_09");	//Tisíceré díky...
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_10");	//Hodně ti dlužím. Přijď za mnou do kovárny, tam si můžeme promluvit.
	Npc_ExchangeRoutine(self,"OTNEW");
};


instance DIA_GRD_219_Stone3(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone3_Condition;
	information = DIA_GRD_219_Stone3_Info;
	important = 1;
	permanent = 0;
};


func int DIA_GRD_219_Stone3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone1) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_STABLE_LEFT_FRONT"))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone3_Info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_01");	//Tady jsi. Jsem ti vděčný, žes mě vytáhl z toho krysího doupěte.
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_02");	//Není toho moc, co bych ti mohl dát, ale mohl bych pro tebe něco ukovat.
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_03");	//Možná prsten nebo něco takového...
};


instance DIA_GRD_219_Stone2(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone2_Condition;
	information = DIA_GRD_219_Stone2_Info;
	important = 0;
	permanent = 0;
	description = "Proč tě zavřeli do vězení?";
};


func int DIA_GRD_219_Stone2_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone2_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone2_15_01");	//Proč tě zavřeli do vězení?
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_02");	//Gomez! Ten bastard mě prohlásil za spřísežence mágů Ohně. Jediný důvod, proč mě nezabil, bylo to, že jsem nejlepší kovář ve Starém táboře.
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_03");	//A tak mě uvrhl do toho krysího doupěte a pouštěl ven jenom tehdy, když potřeboval něco vyrobit.
};


instance DIA_GRD_219_Stone4(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone4_Condition;
	information = DIA_GRD_219_Stone4_Info;
	important = 0;
	permanent = 0;
	description = "Můžeš mi vyztužit tuhle rudnou zbroj?";
};


func int DIA_GRD_219_Stone4_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && Npc_HasItems(hero,ore_armor_m) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone4_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone4_15_01");	//Můžeš mi vyztužit tuhle rudnou zbroj?
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_02");	//Jistě, že můžu. Sundej jí a chvilku počkej.
	AI_UnequipArmor(hero);
	B_GiveInvItems(hero,self,ore_armor_m,1);
	Npc_RemoveInvItem(self,ore_armor_m);
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	CreateInvItem(self,ore_armor_h);
	B_GiveInvItems(self,hero,ore_armor_h,1);
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_03");	//Tady je vyztužená zbroj. A jsme vyrovnáni.
	KnowStone = 1;
};


instance DIA_GRD_219_Stone5(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone5_Condition;
	information = DIA_GRD_219_Stone5_Info;
	important = 0;
	permanent = 0;
	description = "Potřeboval bych prsten, který zvyšuje životní energii.";
};


func int DIA_GRD_219_Stone5_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone5_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone5_15_01");	//Potřeboval bych prsten, který zvyšuje životní energii.
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_02");	//To není tak těžké, počkej chvilku.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_03");	//Tenhle prsten ti dodá zvláštní životní energii. Tohle by mělo být víc než dost pro naše vyrovnání.
	CreateInvItem(self,Ring_des_Lebens2);
	B_GiveInvItems(self,other,Ring_des_Lebens2,1);
	KnowStone = 1;
};


instance DIA_GRD_219_Stone6(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone6_Condition;
	information = DIA_GRD_219_Stone6_Info;
	important = 0;
	permanent = 0;
	description = "Chci, abys mi vykoval ochranný prsten.";
};


func int DIA_GRD_219_Stone6_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone6_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone6_15_01");	//Chci, abys mi vykoval ochranný prsten.
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_02");	//Ochranný prsten? Dobře, hned s tím začnu. Počkej chvilku.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_03");	//Chtěl jsi ochranný prsten, tady ho máš. Teď jsme vyrovnáni.
	CreateInvItem(self,Schutzring_Total2);
	B_GiveInvItems(self,other,Schutzring_Total2,1);
	KnowStone = 1;
};


instance DIA_GRD_219_Stone7(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone7_Condition;
	information = DIA_GRD_219_Stone7_Info;
	important = 0;
	permanent = 0;
	description = "Udělej mi něco, co by zvýšilo moji magickou moc.";
};


func int DIA_GRD_219_Stone7_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone7_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone7_15_01");	//Udělej mi něco, co by zvýšilo moji magickou moc.
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_02");	//...Něco, co by zvýšilo magickou moc...? Amulet! To je ono! Udělám ti amulet. Nebude to trvat dlouho.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_03");	//Tak, amulet je hotový a musím říci, že jsem odvedl dobrou práci. Teď jsme vyrovnáni.
	CreateInvItem(self,Amulett_der_Magie);
	B_GiveInvItems(self,other,Amulett_der_Magie,1);
	KnowStone = 1;
};

