
instance DIA_Huno_Exit(C_Info)
{
	npc = VLK_538_Huno;
	nr = 999;
	condition = DIA_Huno_Exit_Condition;
	information = DIA_Huno_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Huno_Exit_Condition()
{
	return 1;
};

func void DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Huno_YouKnowYourJob(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_YouKnowYourJob_Condition;
	information = DIA_Huno_YouKnowYourJob_Info;
	permanent = 0;
	important = 0;
	description = "Zdá se, že své práci rozumíš.";
};


func int DIA_Huno_YouKnowYourJob_Condition()
{
	return TRUE;
};

func void DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00");	//Zdá se, že své práci rozumíš.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01");	//Zatím si nikdo nestěžoval.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02");	//Rozhodně to nebyl špatný nápad. Každý idiot tu potřebuje meč a to je věc, kterou dostane ode mě.
};


instance DIA_Huno_HowLong(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowLong_Condition;
	information = DIA_Huno_HowLong_Info;
	permanent = 0;
	important = 0;
	description = "Jak dlouho ti trvá výroba jedné čepele?";
};


func int DIA_Huno_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowLong_Info()
{
	AI_Output(other,self,"DIA_Huno_HowLong_15_00");	//Jak dlouho ti trvá výroba jedné čepele?
	AI_Output(self,other,"DIA_Huno_HowLong_09_01");	//Záleží na typu. Jednoruční meče dělám rychle jako hurikán.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02");	//Samozřejmě v případě, kdy mě motivuje cena.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03");	//Podivín jako Whistler obvykle musí čekat na svou hračku déle než ostatní lidi.
	AI_Output(other,self,"DIA_Huno_HowLong_15_04");	//Proč? Neplatí dost?
	AI_Output(self,other,"DIA_Huno_HowLong_09_05");	//Ne, naopak. Za poslední meč dal 150 nugetů.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06");	//Ten chlapík má zálibu v ozdobách a lákadlech na holky, proto to není levné.
	AI_Output(self,other,"DIA_Huno_HowLong_09_07");	//Hele, nejsi trochu moc zvědavý, příteli?
};


instance DIA_Huno_HowsYourBusiness(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowsYourBusiness_Condition;
	information = DIA_Huno_HowsYourBusiness_Info;
	permanent = 1;
	important = 0;
	description = "Tak co, kováři, jak jdou obchody?";
};


func int DIA_Huno_HowsYourBusiness_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00");	//Tak co, kováři, jak jdou obchody?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01");	//Proč to chceš vědět?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02");	//Měl bych pro tebe zakázku.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03");	//Opravdu? A jakou?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04");	//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05");	//Přijď, až budeš něco opravdu potřebovat a přestaň mi lézt na nervy.
};


var int Huno_LearnSmith;

instance DIA_Huno_LEARNSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_LEARNSMITH_Condition;
	information = DIA_Huno_LEARNSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Chtěl bych tu zkusit pracovat.";
};


func int DIA_Huno_LEARNSMITH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_LEARNSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00");	//Chtěl bych tu zkusit pracovat.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01");	//Och, ale nemysli si, že tě nechám dělat výstřední čepele!
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Co musím dělat?
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Dobře, vezmi ocel a vlož ji do výhně.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Potom musíš do ruda rozžhavenou ocel položit na kovadlinu.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Když budeš hotový, vložíš horkou ocel do támhletoho kbelíku s vodou, aby se ochladila.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Vychladlá čepel se musí nakonec nabrousit na brusu.
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_07");	//Aha.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_08");	//Budeš k tomu samozřejmě potřebovat nějaké věci, které ti můžu prodat.
	Huno_LearnSmith = TRUE;
};


instance DIA_Huno_BUYSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_BUYSMITH_Condition;
	information = DIA_Huno_BUYSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Chtěl bych koupit kovářskou výbavu.";
	trade = 1;
};


func int DIA_Huno_BUYSMITH_Condition()
{
	if(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Huno_BUYSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00");	//Chtěl bych koupit kovářskou výbavu.
	if(Npc_HasItems(self,ItMiSwordraw) < 5)
	{
		CreateInvItems(self,ItMiSwordraw,5);
	};
	if(Npc_HasItems(self,ItMiSwordrawhot) < 5)
	{
		CreateInvItems(self,ItMiSwordrawhot,5);
	};
	if(Npc_HasItems(self,ItMiSwordbladehot) < 5)
	{
		CreateInvItems(self,ItMiSwordbladehot,5);
	};
	if(Npc_HasItems(self,ItMiSwordblade) < 5)
	{
		CreateInvItems(self,ItMiSwordblade,5);
	};
};

