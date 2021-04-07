
instance DIA_Caine_Exit(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 999;
	condition = DIA_Caine_Exit_Condition;
	information = DIA_Caine_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Caine_Exit_Condition()
{
	return 1;
};

func void DIA_Caine_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Caine_Hallo(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = DIA_Caine_Hallo_Condition;
	information = DIA_Caine_Hallo_Info;
	permanent = 0;
	description = "Zdar! Jsem tu nový!";
};


func int DIA_Caine_Hallo_Condition()
{
	return 1;
};

func void DIA_Caine_Hallo_Info()
{
	AI_Output(other,self,"DIA_Caine_Hallo_15_00");	//Zdar! Jsem tady nový!
	AI_Output(self,other,"DIA_Caine_Hallo_13_01");	//Já... Já... Já jsem Caine, žák Cora Kaloma. Určitě jsi o něm slyšel, že jo?
	Info_ClearChoices(DIA_Caine_Hallo);
	Info_AddChoice(DIA_Caine_Hallo,"Ne.",DIA_Caine_Hallo_Nein);
	Info_AddChoice(DIA_Caine_Hallo,"Ano.",DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Ja_15_00");	//Tak.
	AI_Output(self,other,"DIA_Caine_Hallo_Ja_13_01");	//Pak musíš vědět, že je to druhý muž tohohle tábora... p-po Y´Berionovi.
	Info_ClearChoices(DIA_Caine_Hallo);
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Nein_15_00");	//Ne.
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_01");	//Ne?! Ty tady asi nebudeš dlouho, viď?
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_02");	//Cor Kalom je druhý nejdůležitější muž po Y´Berionovi. Rozhoduje, kdo se k nám může přidat jako novic.
	Info_ClearChoices(DIA_Caine_Hallo);
};


instance DIA_Caine_Job(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_Job_Condition;
	information = DIA_Caine_Job_Info;
	permanent = 0;
	description = "Co je tvá práce?";
};


func int DIA_Caine_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return 1;
	};
};

func void DIA_Caine_Job_Info()
{
	AI_Output(other,self,"DIA_Caine_Job_15_00");	//A co máš na starosti ty?
	AI_Output(self,other,"DIA_Caine_Job_13_01");	//Já... Já... Já pomáhám svému mistrovi připravovat alchymistické lektvary.
	AI_Output(self,other,"DIA_Caine_Job_13_02");	//Většinou z d-drogy z b-bažin a z výměšků důlních červů. T.. ten výměšek je nesmírně žádaný.
};


instance DIA_Caine_WoSekret(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_WoSekret_Condition;
	information = DIA_Caine_WoSekret_Info;
	permanent = 0;
	description = "Kde dostanu ten výměšek důlních červů?";
};


func int DIA_Caine_WoSekret_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_WoSekret_Info()
{
	AI_Output(other,self,"DIA_Caine_WoSekret_15_00");	//Kde dostanu ten výměšek důlních červů?
	AI_Output(self,other,"DIA_Caine_WoSekret_13_01");	//Červy najdeš ve Starém dole. Musíš ale vědět, jak ten výměšek získat.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_02");	//Jestli chceš s těmi bestiemi opravdu bojovat, měl by sis promluvit s některým z templářů, kteří s tím mají zkušenosti. Jako třeba Gor Na Drak.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_03");	//Cestuje mezi naším táborem a Starým dolem každý den. R-ráno ho najdeš v dílně.
};


instance DIA_Caine_AddInfoKalom(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_AddInfoKalom_Condition;
	information = DIA_Caine_AddInfoKalom_Info;
	permanent = 0;
	description = "Co mi ještě můžeš říci o svém mistrovi?";
};


func int DIA_Caine_AddInfoKalom_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_AddInfoKalom_Info()
{
	AI_Output(other,self,"DIA_Caine_AddInfoKalom_15_00");	//Co mi ještě můžeš říci o svém mistrovi?
	AI_Output(self,other,"DIA_Caine_AddInfoKalom_13_01");	//On... on není jako... ostatní Guru. Každý se na něj může obrátit, ale... ale NIKDO nesmí plýtvat jeho vzácným časem.
};


instance Nov_1301_Caine_CHEST(C_Info)
{
	npc = NOV_1301_Caine;
	condition = Nov_1301_Caine_CHEST_Condition;
	information = Nov_1301_Caine_CHEST_Info;
	important = 0;
	permanent = 0;
	description = "Jak dostanu Kalomův recept?";
};


func int Nov_1301_Caine_CHEST_Condition()
{
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Nov_1301_Caine_CHEST_Info()
{
	AI_Output(other,self,"Nov_1301_Caine_CHEST_Info_15_01");	//Jak dostanu Kalomův recept?
	AI_Output(self,other,"Nov_1301_Caine_CHEST_Info_13_02");	//Nedostaneš ho. Má ho zamčený ve své truhle a nikomu ho nedá.
};

