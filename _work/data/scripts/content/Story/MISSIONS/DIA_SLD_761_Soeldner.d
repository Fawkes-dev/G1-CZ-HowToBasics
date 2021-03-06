
instance DIA_SLD_761_Soeldner_INTRO(C_Info)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_INTRO_CONDITION;
	information = DIA_SLD_761_Soeldner_INTRO_INFO;
	important = 1;
	permanent = 0;
};


func int DIA_SLD_761_Soeldner_INTRO_CONDITION()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_INTRO_INFO()
{
	AI_Output(self,other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01");	//Co tady děláš v tom dole?
};


instance DIA_SLD_761_Soeldner_EXIT_1(C_Info)
{
	nr = 999;
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_EXIT_1_CONDITION;
	information = DIA_SLD_761_Soeldner_EXIT_1_INFO;
	important = 0;
	permanent = 0;
	description = "Dělám pořád tu samou práci.";
};


func int DIA_SLD_761_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_EXIT_1_INFO()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01");	//Dělám pořád tu samou práci.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");	//Taky si to myslím.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_761_Soeldner_EXIT_2(C_Info)
{
	nr = 999;
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_EXIT_2_CONDITION;
	information = DIA_SLD_761_Soeldner_EXIT_2_INFO;
	important = 0;
	permanent = 1;
	description = "Raději půjdu!";
};


func int DIA_SLD_761_Soeldner_EXIT_2_CONDITION()
{
	if(Npc_KnowsInfo(hero,DIA_SLD_761_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_EXIT_2_INFO()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01");	//Raději půjdu!
	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");	//Dobrá.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_761_Soeldner_UMSEHEN(C_Info)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_UMSEHEN_CONDITION;
	information = DIA_SLD_761_Soeldner_UMSEHEN_INFO;
	important = 0;
	permanent = 0;
	description = "Jen jsem se chtěl porozhlédnout po táboře.";
};


func int DIA_SLD_761_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_UMSEHEN_INFO()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01");	//Jen jsem se chtěl porozhlédnout po táboře.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");	//Pak jsi přišel na nesprávné místo, protože tohle je vchod do dolu, kam tě nepustíme.
};


instance DIA_SLD_761_Soeldner_INMINE(C_Info)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_INMINE_CONDITION;
	information = DIA_SLD_761_Soeldner_INMINE_INFO;
	important = 0;
	permanent = 0;
	description = "Chtěl jsem vidět důl.";
};


func int DIA_SLD_761_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_INMINE_INFO()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");	//Chtěl jsem vidět důl.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");	//Snad vidíš, že důl je zamčený, takže tu není vůbec nic k vidění.
};


instance DIA_SLD_761_Soeldner_Bribe(C_Info)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_Bribe_CONDITION;
	information = DIA_SLD_761_Soeldner_Bribe_INFO;
	important = 0;
	permanent = 0;
	description = "Nemohlo by se s tím něco udělat?";
};


func int DIA_SLD_761_Soeldner_Bribe_CONDITION()
{
	if(Npc_KnowsInfo(hero,DIA_SLD_761_Soeldner_INMINE))
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_Bribe_INFO()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");	//Nemohlo by se s tím něco udělat?
	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");	//Co bysme s tím měli udělat?
	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");	//Okamžik, jestli se mě pokoušíš podplatit, tak to jsi narazil na toho nesprávného.
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");	//Ne, nepokoušel jsem se nikoho podplatit, jenom jsem myslel...
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");	//Já myslím, že bys měl raději jít pryč.
	AI_StopProcessInfos(self);
};

