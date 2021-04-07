
instance Info_Vlk_4_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_4_EXIT_Condition;
	information = Info_Vlk_4_EXIT_Info;
	permanent = 1;
	description = "KONEC";
};


func int Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_4_EXIT_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00");	//Díky. Hodně štěstí.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01");	//Hlavu vzhůru, hochu.
	AI_StopProcessInfos(self);
};


instance Info_Vlk_4_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_4_EinerVonEuchWerden_Condition;
	information = Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Co musím udělat, abych se mohl přidat k táboru?";
};


func int Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_4_EinerVonEuchWerden_Info()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01");	//Co musím udělat, abych se mohl přidat k táboru?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04");	//Myslíš jako Stín nebo jako strážce? To nebude snadné, člověče. Než tě starý Thorus pustí za Gomezem, budeš muset složit pár zkoušek.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02");	//A budeš tu muset dobře vyjít s lidmi Ale dokud nebudeš patřit k nějakému táboru, nikdo tě nebude brát vážně.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03");	//Být tebou, dal bych řeč s některým ze Stínů. Možná bys našel někoho, kdo by ti mohl pomoci. Samozřejmě když nabídneš něco na oplátku.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Vlk_4_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_4_WichtigePersonen_Condition;
	information = Info_Vlk_4_WichtigePersonen_Info;
	permanent = 1;
	description = "Je tu něco zvláštního, co bych měl vědět?";
};


func int Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00");	//Je tu někdo důležitý, koho bych měl znát?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01");	//Když jsi tu nový, neměl by ses dostat do křížku s Gravem. I když je jenom kopáč, ví, jak jednat s Rudobarony.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02");	//Pokud se dostaneš do problémů s někým z Gomezovy party, může ti z toho pomoci ven.
};


instance Info_Vlk_4_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_4_DasLager_Condition;
	information = Info_Vlk_4_DasLager_Info;
	permanent = 1;
	description = "Která místa bych tady měl znát?";
};


func int Info_Vlk_4_DasLager_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00");	//Která místa bych tady měl znát?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01");	//Jestli nemáš chuť kopat v dolech, měl by ses porozhlédnout mezi severní a hradní bránou.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02");	//Když budeš mít štěstí, Thorus nebo Diego by ti mohli navrhnout něco, co bys pro ně mohl udělat - tak budeš mít šanci dostat se na jejich stranu. Určitě není špatné patřit ke Gomezovým lidem..
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03");	//Nebo by ses měl setkat s mágy. Občas potřebují vyřídit nějaké obchůzky. A platí vždycky dobře.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04");	//Mágové vycházejí z hradu? A kdy?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05");	//Co já vím.Zeptej se lidí, kteří tam žijí.
};


instance Info_Vlk_4_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_4_DieLage_Condition;
	information = Info_Vlk_4_DieLage_Info;
	permanent = 1;
	description = "Jsi v pořádku?";
};


func int Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00");	//Jsi v pořádku?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01");	//Tak jako před dvaceti lety. Nic se za tu dobu nezměnilo.
};

func void B_AssignAmbientInfos_Vlk_4(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc = Hlp_GetInstanceID(slf);
};

