
instance Info_Org_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Org_13_EXIT_Condition;
	information = Info_Org_13_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Org_13_EXIT_Condition()
{
	return 1;
};

func void Info_Org_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Org_13_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Org_13_EinerVonEuchWerden_Condition;
	information = Info_Org_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Co musím udělat, abych se mohl přidat k táboru?";
};


func int Info_Org_13_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Org_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_13_EinerVonEuchWerden_15_00");	//Co musím udělat, abych se mohl přidat k táboru?
	AI_Output(self,other,"Info_Org_13_EinerVonEuchWerden_13_01");	//Jdi na pole a pomoz rolníkům sklízet rýži.
};


instance Info_Org_13_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Org_13_WichtigePersonen_Condition;
	information = Info_Org_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};


func int Info_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_13_WichtigePersonen_Info()
{
	var C_Npc Lee;
	AI_Output(other,self,"Info_Org_13_WichtigePersonen_15_00");	//Kdo tady má velení?
	AI_Output(self,other,"Info_Org_13_WichtigePersonen_13_01");	//Lee je hlava žoldáků, jestli tě zrovna TOHLE zajímá. Ale já nejsem žoldák a ať mě vezme čert, jestli je nechám, aby mi rozkazovali!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_13_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Org_13_DasLager_Condition;
	information = Info_Org_13_DasLager_Info;
	permanent = 1;
	description = "Chci vědět o táboru víc.";
};


func int Info_Org_13_DasLager_Condition()
{
	return 1;
};

func void Info_Org_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_13_DasLager_15_00");	//Chci vědět o táboru víc.
	AI_Output(self,other,"Info_Org_13_DasLager_13_01");	//Tak jdi a porozhlédni se kolem. Dokud nebudeš patřit ke  Gomezových mužům, nikdo ti v tom nebude bránit.
};


instance Info_Org_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Org_13_DieLage_Condition;
	information = Info_Org_13_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};


func int Info_Org_13_DieLage_Condition()
{
	return 1;
};

func void Info_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_13_DieLage_15_00");	//Jak to jde?
	AI_Output(self,other,"Info_Org_13_DieLage_13_01");	//Co TY mi vlastně chceš?
};


instance Info_Org_13_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Org_13_Krautprobe_Condition;
	information = Info_Org_13_Krautprobe_Info;
	permanent = 1;
	description = "Vypadá to, jako bys měl co dělat s drogou z bažin.";
};


func int Info_Org_13_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Org_13_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_13_Krautprobe_15_00");	//Vypadá to, jako bys měl co dělat s drogou z bažin.
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
		};
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_01");	//Máš něco? Dám ti za jednu lodyhu 10 nugetů.
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_02");	//Můžeš vždycky zase přijít, bratře.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_13_Krautprobe_No_Joint_13_00");	//Ale ty nic nemáš. Přestaň si ze mě dělat blázny, jasný?
	};
};

func void B_AssignAmbientInfos_Org_13(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Org_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

