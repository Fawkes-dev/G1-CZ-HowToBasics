
instance DIA_BaalCadar_Exit(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 999;
	condition = DIA_BaalCadar_Exit_Condition;
	information = DIA_BaalCadar_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalCadar_Exit_Condition()
{
	return 1;
};

func void DIA_BaalCadar_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int BaalCadar_Ansprechbar;
var int BaalCadar_Sakrileg;

instance DIA_BaalCadar_NoTalk(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 2;
	condition = DIA_BaalCadar_NoTalk_Condition;
	information = DIA_BaalCadar_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalCadar_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalCadar_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void DIA_BaalCadar_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalCadar_NoTalk);
	Info_AddChoice(DIA_BaalCadar_NoTalk,DIALOG_ENDE,DIA_BaalCadar_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"Je všechno v pořádku, příteli?",DIA_BaalCadar_NoTalk_Imp);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"Spáč buď s tebou!",DIA_BaalCadar_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"Zdar! Jsem tu nový!",DIA_BaalCadar_NoTalk_Hi);
};

func void DIA_BaalCadar_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Hi_15_00");	//Zdar! Jsem tu nový!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(vzdech)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Sleeper_15_00");	//Spáč buď s tebou!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_02_01");	//(vzdech)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Imp_15_00");	//Je všechno v pořádku, příteli?
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Imp_02_01");	//(vzdech)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalCadar_SleepSpell(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 1;
	condition = DIA_BaalCadar_SleepSpell_Condition;
	information = DIA_BaalCadar_SleepSpell_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalCadar_SleepSpell_Condition()
{
	var C_Npc Nov1336;
	var C_Npc Nov1340;
	var C_Npc Nov1345;
	Nov1336 = Hlp_GetNpc(NOV_1336_Novize);
	Nov1340 = Hlp_GetNpc(NOV_1340_Novize);
	Nov1345 = Hlp_GetNpc(NOV_1345_Novize);
	if(Npc_IsInState(Nov1336,ZS_MagicSleep) || Npc_IsInState(Nov1340,ZS_MagicSleep) || Npc_IsInState(Nov1345,ZS_MagicSleep))
	{
		return 1;
	};
};

func void DIA_BaalCadar_SleepSpell_Info()
{
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_00");	//Co děláš? Pokouším se meditovat se svými žáky.
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_01");	//Kdo tě naučil používat Spáčovu magickou moc?
	AI_Output(other,self,"DIA_BaalCadar_SleepSpell_15_02");	//Nikdo. Bylo to snadné.
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_03");	//Zdá se, že jsi bystrý žák. Budu tě učit.
	BaalCadar_Ansprechbar = TRUE;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Cadar mě má za vnímavého učně! ");
	B_GiveXP(XP_ImpressBaalCadar);
};


instance Gur_1208_BaalCadar_Teach(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_Teach_Condition;
	information = Gur_1208_BaalCadar_Teach_Info;
	permanent = 1;
	description = "Chtěl bych se naučit, jak zvětšit sílu svých kouzel. ";
};


func int Gur_1208_BaalCadar_Teach_Condition()
{
	if((BaalCadar_Ansprechbar == TRUE) || (Npc_GetTrueGuild(other) != GIL_None))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_Teach_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_Teach_Info_15_01");	//Chtěl bych se naučit, jak zvětšit sílu svého kouzla.
	AI_Output(self,other,"Gur_1208_BaalCadar_Teach_Info_02_02");	//Klíčem je síla tvojí duše.
	if(log_baalcadartrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Guru Baal Cadar mi může pomoci vylepšit MAGICKOU ENERGII.");
		log_baalcadartrain = TRUE;
	};
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,DIALOG_BACK,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_BACK()
{
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
};

func void Gur_1208_BaalCadar_Teach_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,DIALOG_BACK,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,DIALOG_BACK,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_1);
};


instance Gur_1208_BaalCadar_FIRSTTEST(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_FIRSTTEST_Condition;
	information = Gur_1208_BaalCadar_FIRSTTEST_Info;
	important = 0;
	permanent = 0;
	description = "Nauč mě magii run.";
};


func int Gur_1208_BaalCadar_FIRSTTEST_Condition()
{
	if(C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_FIRSTTEST_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01");	//Nauč mě magii run.
	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02");	//Mnozí se naučili jazyku run, ale jen někteří pochopili jejich kouzlo.
	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03");	//Pokusím se tě to naučit.
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Baal Cadar mě může naučit magické KRUHY runové magie.");
};


instance Gur_1208_BaalCadar_KREIS1(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS1_Condition;
	information = Gur_1208_BaalCadar_KREIS1_Info;
	important = 0;
	permanent = 1;
	description = "Jsem připraven vstoupit do Prvního kruhu.";
};


func int Gur_1208_BaalCadar_KREIS1_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && Npc_KnowsInfo(hero,Gur_1208_BaalCadar_FIRSTTEST) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS1_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS1_Info_15_01");	//Jsem připraven vstoupit do Prvního kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_02");	//Poslouchej má slova.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_03");	//Před dlouhou dobou se zjevil Spáč a seslal lidstvu vizi.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_04");	//Mnozí lidé však odmítali jeho znamení vnímat, neboť byli příliš zaslepeni touhou po rudě.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_05");	//Jen Y´Berion  s hrstkou dalších se sebral a založil Bratrstvo.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_06");	//V okamžiku, kdy vyslyšeli Spáčovo poselství, se zrodil První kruh. Kouzlu run porozuměl každý, kdo následoval Spáče.
		Gur_1208_BaalCadar_KREIS1.permanent = 0;
	};
	AI_StopProcessInfos(self);
};


instance Gur_1208_BaalCadar_KREIS2(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS2_Condition;
	information = Gur_1208_BaalCadar_KREIS2_Info;
	important = 0;
	permanent = 1;
	description = "Jsem připraven vstoupit do Druhého kruhu.";
};


func int Gur_1208_BaalCadar_KREIS2_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS2_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS2_Info_15_01");	//Jsem připraven vstoupit do Druhého kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_02");	//Pak naslouchej a věz.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_03");	//Spáč dovedl Y´Beriona a jeho věřící žáky na toto místo, kde se usadili.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_04");	//Pracovali bez odpočinku - dny, týdny, měsíce. Vyrostl Nový tábor. Přidávali se k němu noví a noví lidé, kteří následovali Spáčovo poselství.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_05");	//Společně se pak pokusili o spojení se Spáčem na duchovní úrovni.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_06");	//Tak se zrodil Druhý kruh.
		Gur_1208_BaalCadar_KREIS2.permanent = 0;
	};
	AI_StopProcessInfos(self);
};


instance Gur_1208_BaalCadar_KREIS3(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS3_Condition;
	information = Gur_1208_BaalCadar_KREIS3_Info;
	important = 0;
	permanent = 1;
	description = "Jsem připraven vstoupit do Třetího kruhu.";
};


func int Gur_1208_BaalCadar_KREIS3_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS3_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS3_Info_15_01");	//Jsem připraven vstoupit do Třetího kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_02");	//Zapamatuj si toto:
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_03");	//Vize se staly jasnější, ale síla Bratrstva nestačila pro navázání spojení.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_04");	//Jeden z Guru, alchymista, ten problém vyřešil. Připravil lektvar extrahovaný z výměšku z čelisti důlního červa. Bratři pak spojili své modlitby a jejich duchovní síla se poprvé sjednotila.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_05");	//V tu dobu se novicové vydali do táborů, aby tam zvěstovali Spáčovo učení a přesvědčovali nevěrce o víře.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_06");	//Tak byl dovršen Třetí kruh.
	};
	AI_StopProcessInfos(self);
};


instance Gur_1208_BaalCadar_KREIS4(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS4_Condition;
	information = Gur_1208_BaalCadar_KREIS4_Info;
	important = 0;
	permanent = 1;
	description = "Jsem připraven vstoupit do Pátého kruhu.";
};


func int Gur_1208_BaalCadar_KREIS4_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS4_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS4_Info_15_01");	//Jsem připraven vstoupit do Pátého kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_02");	//Uběhla dlouhá doba od založení tábora. Mnoho se toho změnilo.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_03");	//Víra zesílila, byla upevňována a šířena.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_04");	//Nezapomněli jsme však na naše poslání. Nevzdávali jsme se pokusů o vzývání Spáče.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_05");	//Vytrvalost a síla víry představují Čtvrtý kruh.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_06");	//Teď víš všechno, co bratr potřebuje o kouzlech vědět. Jsi dobrý žák.
		Gur_1208_BaalCadar_KREIS4.permanent = 0;
	};
};


instance Gur_1208_BaalCadar_SELLSTUFF(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_SELLSTUFF_Condition;
	information = Gur_1208_BaalCadar_SELLSTUFF_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int Gur_1208_BaalCadar_SELLSTUFF_Condition()
{
	if((BaalCadar_Ansprechbar == TRUE) || (Npc_GetTrueGuild(other) != GIL_None))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_SELLSTUFF_Info()
{
	if(log_baalcadarsell == FALSE)
	{
		Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
		B_LogEntry(GE_TraderPSI,"Guru Baal Cadar prodává RUNY, KOUZELNÉ SVITKY, LEKTVARY, AMULETY a PRSTENY.");
		log_baalcadarsell = TRUE;
	};
	AI_Output(other,self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01");	//Rád bych získal magické spisy.
};

