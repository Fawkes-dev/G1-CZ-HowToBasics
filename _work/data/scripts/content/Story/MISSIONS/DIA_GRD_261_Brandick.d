
instance GRD_261_Brandick_Exit(C_Info)
{
	npc = GRD_261_Brandick;
	nr = 999;
	condition = GRD_261_Brandick_Exit_Condition;
	information = GRD_261_Brandick_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int GRD_261_Brandick_Exit_Condition()
{
	return 1;
};

func void GRD_261_Brandick_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance GRD_261_Brandick_ALEPH(C_Info)
{
	npc = GRD_261_Brandick;
	condition = GRD_261_Brandick_ALEPH_Condition;
	information = GRD_261_Brandick_ALEPH_Info;
	important = 0;
	permanent = 0;
	description = "(stěžuj si na Alepha)";
};


func int GRD_261_Brandick_ALEPH_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void GRD_261_Brandick_ALEPH_Info()
{
	AI_Output(other,self,"GRD_261_Brandick_ALEPH_Info_15_01");	//Poslyš, když tady nejsi, Aleph tu akorát celý den posedává a ani nepohne prstem.
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_02");	//Je to pravda?
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_03");	//Víš, kým opovrhuju ještě víc než línou kůží? Zrádcema! Ztrať se!
	AI_StopProcessInfos(self);
};

