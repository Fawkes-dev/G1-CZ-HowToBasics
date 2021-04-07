
instance IE_397_Announcer_Exit(C_Info)
{
	npc = IE_397_Announcer;
	nr = 999;
	condition = IE_397_Announcer_Exit_Condition;
	information = IE_397_Announcer_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int IE_397_Announcer_Exit_Condition()
{
	return 1;
};

func void IE_397_Announcer_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance IE_397_Announcer_ANNOUNCE(C_Info)
{
	npc = IE_397_Announcer;
	condition = IE_397_Announcer_ANNOUNCE_Condition;
	information = IE_397_Announcer_ANNOUNCE_Info;
	important = 1;
	permanent = 0;
};


func int IE_397_Announcer_ANNOUNCE_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void IE_397_Announcer_ANNOUNCE_Info()
{
	AI_Output(self,other,"Info_Announcer_ANNOUNCE_11_01");	//Mí vážení Rudobaroni, ctěné stráže, Stíny a kopáči...
	AI_Output(self,other,"Info_Announcer_ANNOUNCE_11_02");	//Mám tu nesmírnou čest vám představit...
	AI_Output(self,other,"Info_Announcer_ANNOUNCE_11_03");	//!!! V POSLEDNÍ CHVÍLI ŽIVOTA !!!
	Npc_ExchangeRoutine(self,"concert");
	B_ExchangeRoutine(Charlotte,"concert");
	B_InExtremoStartMusic();
	AI_StopProcessInfos(self);
};

