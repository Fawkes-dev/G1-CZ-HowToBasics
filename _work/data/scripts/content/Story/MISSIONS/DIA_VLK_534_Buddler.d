
instance DIA_Vlk_534_Exit(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 999;
	condition = DIA_Vlk_534_Exit_Condition;
	information = DIA_Vlk_534_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

func void DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Vlk_534_LeaveMe(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = DIA_Vlk_534_LeaveMe_Condition;
	information = DIA_Vlk_534_LeaveMe_Info;
	permanent = 1;
	description = "Proč jsi tady a ne v táboře?";
};


func int DIA_Vlk_534_LeaveMe_Condition()
{
	return 1;
};

func void DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00");	//Proč jsi tady a ne v táboře?
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01");	//Čekám na přítele, až se vrátí z dolu. Dluží mi nějakou rudu.
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02");	//Nemůžu přijít do tábora bez rudy - nemohl bych strážím zaplatit peníze za ochranu a to by mi dost věcí zkomplikovalo.
	AI_StopProcessInfos(self);
};

