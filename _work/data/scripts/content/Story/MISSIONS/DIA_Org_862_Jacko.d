
instance Info_Jacko_EXIT(C_Info)
{
	npc = Org_862_Jacko;
	nr = 999;
	condition = Info_Jacko_EXIT_Condition;
	information = Info_Jacko_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Jacko_EXIT_Condition()
{
	return 1;
};

func void Info_Jacko_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_862_Jacko_GoAway(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GoAway_Condition;
	information = ORG_862_Jacko_GoAway_Info;
	permanent = 1;
	important = 1;
};


func int ORG_862_Jacko_GoAway_Condition()
{
	if((Npc_GetDistToWP(hero,"LOCATION_23_CAVE_1_IN") < 500) && (Kalom_DrugMonopol != LOG_RUNNING) && (Kalom_DrugMonopol != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GoAway_Info()
{
	AI_Output(self,other,"ORG_862_Jacko_GoAway_Info_06_00");	//Co tady k čertu pohledáváš?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance ORG_862_Jacko_GUARD(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GUARD_Condition;
	information = ORG_862_Jacko_GUARD_Info;
	permanent = 0;
	important = 1;
};


func int ORG_862_Jacko_GUARD_Condition()
{
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GUARD_Info()
{
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_00");	//Zabloudili jsme, že ano?
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Info_15_01");	//Cor Kalom ví o vašem malém podniku.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_02");	//Cože? Proč tady jsi?
	B_LogEntry(CH1_DrugMonopol,"Našel jsem tajnou výrobnu drogy z bažin. Jacko a dva další bandité tu produkují lodyhy drogy.");
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Jsem tu, abych vás varoval. Cor Kalom vyslal pět templářů, aby s vámi skoncovali.",ORG_862_Jacko_GUARD_Templer);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Zajímalo by mě, jakou cenu má pro tebe tahle informace.",ORG_862_Jacko_GUARD_InfoWert);
	Info_AddChoice(ORG_862_Jacko_GUARD,"A věc se chýlí ke konci!",ORG_862_Jacko_GUARD_Angriff);
};

func void ORG_862_Jacko_GUARD_Templer()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_00");	//Jsem tu, abych tě varoval. Co Kalom vyslal pět templářů, aby tě zastavili.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_01");	//Cože? To nemyslíš vážně!
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_02");	//Měli by dorazit během chvilky!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_03");	//Sakra! Musíme zmizet!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	B_LogEntry(CH1_DrugMonopol,"Malá lest s templáři, kteří tu vůbec nebyli, mi pomohla zbavit se těch zbabělců. Problém by měl být na chvilku vyřešen.");
	B_GiveXP(XP_JackoRetired);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_InfoWert()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00");	//Chci vědět, jestli je tvá informace pravdivá.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01");	//Och, tak tohle teda chceš... Dobrá. Ruka ruku myje. Tady je ruda, kterou u sebe mám.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02");	//Musíme jít! A ty bys měl zmizet taky.
	B_GiveInvItems(self,other,ItMiNugget,95);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	B_LogEntry(CH1_DrugMonopol,"Krátkou domluvou jsem vyřešil problém. Ta věc byla pro Jacka tak ožehavá, že se raději ztratil.");
	B_GiveXP(XP_JackoRetired);
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_Angriff()
{
	var C_Npc Killian;
	var C_Npc Renyu;
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00");	//A věc se chýlí ke konci!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01");	//Chlapi! Pojďte rychle sem.
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Killian = Hlp_GetNpc(Org_861_Killian);
	Npc_SetTarget(Killian,hero);
	AI_StartState(Killian,ZS_Attack,0,"");
	Npc_SetPermAttitude(Killian,ATT_HOSTILE);
	Npc_SetTempAttitude(Killian,ATT_HOSTILE);
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Npc_SetTarget(Renyu,hero);
	AI_StartState(Renyu,ZS_Attack,0,"");
	Npc_SetPermAttitude(Renyu,ATT_HOSTILE);
	Npc_SetTempAttitude(Renyu,ATT_HOSTILE);
};


instance ORG_862_Jacko_Banditencamp(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_Banditencamp_Condition;
	information = ORG_862_Jacko_Banditencamp_Info;
	permanent = 1;
	description = "Musíte se odtud odplížit.";
};


func int ORG_862_Jacko_Banditencamp_Condition()
{
	if((Kalom_DrugMonopol == LOG_SUCCESS) && Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08"))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_Banditencamp_Info()
{
	AI_Output(other,self,"ORG_862_Jacko_Banditencamp_15_00");	//Musíte se odtud odplížit.
	AI_Output(self,other,"ORG_862_Jacko_Banditencamp_06_01");	//To bylo o fous. Sektářští templáři by nás byli zabili.
	AI_StopProcessInfos(self);
};

