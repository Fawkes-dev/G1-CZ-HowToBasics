
instance Info_GorHanis_Exit(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 999;
	condition = Info_GorHanis_Exit_Condition;
	information = Info_GorHanis_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_GorHanis_Exit_Condition()
{
	return 1;
};

func void Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_GorHanis_What(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_What_Condition;
	information = Info_GorHanis_What_Info;
	permanent = 0;
	description = "Co tady děláš?";
};


func int Info_GorHanis_What_Condition()
{
	return 1;
};

func void Info_GorHanis_What_Info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//Co tady děláš?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//Já?! Bojuju za slávu Spáče!
};


instance Info_GorHanis_Arena(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_Arena_Condition;
	information = Info_GorHanis_Arena_Info;
	permanent = 1;
	description = "Bojuješ v aréně?";
};


func int Info_GorHanis_Arena_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Arena_Info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//Bojuješ v aréně?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//Byl jsem vyslaný svými mistry z bažin, abych bojoval za Spáče.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//Budu tu bojovat za jeho větší slávu - tak můžou všichni nevěrci poznat, jakou silou mě obdařila jeho moc!
};


instance Info_GorHanis_Sleeper(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Sleeper_Condition;
	information = Info_GorHanis_Sleeper_Info;
	permanent = 0;
	description = "Co je to Spáč?";
};


func int Info_GorHanis_Sleeper_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Sleeper_Info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//Co je to Spáč?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//V našem táboře najdeš kněze, kteří ti tuhle otázku budou schopni zodpovědět lépe než já.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//Můžu ti říci akorát tohle: Spáč je náš spasitel, který nás přivedl na tohle místo a který nás odtud zase vyvede.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//Tím chceš říci, že čekáte, až vás váš bůh osvobodí?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//Ano! A to čekání brzy skončí. Právě se připravuje velké vzývání!
};


instance Info_GorHanis_Summoning(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Summoning_Condition;
	information = Info_GorHanis_Summoning_Info;
	permanent = 0;
	description = "Jaký druh vzývání připravujete?";
};


func int Info_GorHanis_Summoning_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func void Info_GorHanis_Summoning_Info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//Jaký druh vzývání připravujete?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//Naši proroci říkají, že společné vzývání Spáče je naším klíčem ke svobodě!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//Jestli se chceš o tom dozvědět víc, jdi do našeho tábora.
};


instance Info_GorHanis_WayToST(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = Info_GorHanis_WayToST_Condition;
	information = Info_GorHanis_WayToST_Info;
	permanent = 1;
	description = "Můžeš mi popsat cestu do vašeho tábora?";
};


func int Info_GorHanis_WayToST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning))
	{
		return 1;
	};
};

func void Info_GorHanis_WayToST_Info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//Můžeš mi popsat cestu do vašeho tábora?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//Ve Starém táboře je několik noviců, kteří jsou ochotní doprovázet nové příchozí jako jsi ty do našeho tábora. Musíš si jim jenom říci.
};


instance Info_GorHanis_Charge(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_Charge_Condition;
	information = Info_GorHanis_Charge_Info;
	permanent = 0;
	description = "Vyzývám tě na souboj v aréně!";
};


func int Info_GorHanis_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Arena))
	{
		return 1;
	};
};

func void Info_GorHanis_Charge_Info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//Vyzývám tě na souboj v aréně!
	AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//Neposloužilo by příliš Spáčově slávě, kdybych před obecenstvem zabil nějakého břídila.
	AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//Budu proti tobě bojovat jedině v případě, že mi budeš důstojným protivníkem.
	AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//Jsem si jistý, že bojovníci ze Starého nebo Nového tábora nejsou všichni zásadoví muži...
};


instance Info_GorHanis_ChargeGood(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_ChargeGood_Condition;
	information = Info_GorHanis_ChargeGood_Info;
	permanent = 1;
	description = "Jsem už dost silný, abych se s tebou mohl utkat?";
};


func int Info_GorHanis_ChargeGood_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Charge))
	{
		return 1;
	};
};

func void Info_GorHanis_ChargeGood_Info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//Jsem už dost silný, abych se s tebou mohl utkat?
	AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//Ne! Nemáš dost síly - nejsi pro mě protivník!
};

