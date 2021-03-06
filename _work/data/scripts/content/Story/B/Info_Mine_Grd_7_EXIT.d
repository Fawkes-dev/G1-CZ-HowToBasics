
instance Info_Mine_Grd_7_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Grd_7_EXIT_Condition;
	information = Info_Mine_Grd_7_EXIT_Info;
	permanent = 1;
	description = "KONEC";
};


func int Info_Mine_Grd_7_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Grd_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Grd_7_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_7_Mine_Condition;
	information = Info_Mine_Grd_7_Mine_Info;
	permanent = 1;
	description = "Řekni mi něco o dole.";
};


func int Info_Mine_Grd_7_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Mine_15_00");	//Povídej mi o dole.
	AI_Output(self,other,"Info_Mine_Grd_7_Mine_07_01");	//Kopáči rubou rudu a my je chráníme před červy.
};


instance Info_Mine_Grd_7_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_7_WichtigePersonen_Condition;
	information = Info_Mine_Grd_7_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};


func int Info_Mine_Grd_7_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_WichtigePersonen_15_00");	//Kdo to tady vede?
	AI_Output(self,other,"Info_Mine_Grd_7_WichtigePersonen_07_01");	//Ian a Asghan. Když něco chceš, měl bys jim to říci.
};


instance Info_Mine_Grd_7_Minecrawler(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_7_Minecrawler_Condition;
	information = Info_Mine_Grd_7_Minecrawler_Info;
	permanent = 1;
	description = "Co víš o červech.";
};


func int Info_Mine_Grd_7_Minecrawler_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Minecrawler_15_00");	//Co si myslíš o červech?
	AI_Output(self,other,"Info_Mine_Grd_7_Minecrawler_07_01");	//Spousta by jich měla být vyhlazena, pokud se ptáš mě!
};


instance Info_Mine_Grd_7_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_7_DieLage_Condition;
	information = Info_Mine_Grd_7_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};


func int Info_Mine_Grd_7_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_DieLage_15_00");	//Jak se máš?
	AI_Output(self,other,"Info_Mine_Grd_7_DieLage_07_01");	//Chlape, hraješ mi na nervy!
};

func void B_AssignAmbientInfos_Mine_grd_7(var C_Npc slf)
{
	Info_Mine_Grd_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_DieLage.npc = Hlp_GetInstanceID(slf);
};

