
instance Info_Yberion_EXIT(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 999;
	condition = Info_Yberion_EXIT_Condition;
	information = Info_Yberion_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Yberion_EXIT_Condition()
{
	return 1;
};

func void Info_Yberion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_YBerion_Wache(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Wache_Condition;
	information = DIA_YBerion_Wache_Info;
	permanent = 1;
	important = 1;
};


func int DIA_YBerion_Wache_Condition()
{
	if(Kapitel == 1)
	{
		return 1;
	};
};

func void DIA_YBerion_Wache_Info()
{
	AI_Output(self,other,"DIA_YBerion_Wache_12_00");	//Co tady děláš? Kdo tě sem pustil? Stráže!
	B_IntruderAlert(self,other);
	AI_StopProcessInfos(self);
};


instance DIA_YBerion_Kennen(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Kennen_Condition;
	information = DIA_YBerion_Kennen_Info;
	permanent = 0;
	description = "Buď pozdraven, mistře Y´Berione.";
};


func int DIA_YBerion_Kennen_Condition()
{
	if(Kapitel == 2)
	{
		return 1;
	};
};

func void DIA_YBerion_Kennen_Info()
{
	AI_Output(other,self,"DIA_YBerion_Kennen_15_00");	//Buď pozdraven, mistře Y´Berione.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_01");	//Ach! Tuhle tvář znám!
	AI_Output(other,self,"DIA_YBerion_Kennen_15_02");	//Vyloučeno. Nikdy jsme se neviděli.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_03");	//Ale přece... Dobře - co chceš?
};


instance Info_YBerion_BringFocus(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = Info_YBerion_BringFocus_Condition;
	information = Info_YBerion_BringFocus_Info;
	permanent = 1;
	description = "Slyšel jsem, že něco hledáš.";
};


func int Info_YBerion_BringFocus_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_YBerion_Kennen) && (Npc_GetTrueGuild(hero) != GIL_None) && (YBerion_BringFocus != LOG_RUNNING) && (YBerion_BringFocus != LOG_SUCCESS))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01");	//Slyšel jsem, že něco hledáš.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02");	//To je pravda. Potřebujeme kouzelné ohnisko.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03");	//Poslali jsme novice Nyrase, aby ho přinesl. Ještě se ale nevrátil.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04");	//Mohl bys pro mě vypátrat, co se stalo.
	Info_ClearChoices(Info_YBerion_BringFocus);
	Info_AddChoice(Info_YBerion_BringFocus,DIALOG_BACK,Info_YBerion_BringFocus_BACK);
	Info_AddChoice(Info_YBerion_BringFocus,"Přinesu to ohnisko zpátky!",Info_YBerion_BringFocus_OK);
	Info_AddChoice(Info_YBerion_BringFocus,"Kde mám začít pátrat?",Info_YBerion_BringFocus_WO);
	Info_AddChoice(Info_YBerion_BringFocus,"Proč je to ohnisko tak důležité?",Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK()
{
	Info_ClearChoices(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01");	//Přinesu to ohnisko zpátky!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02");	//Vem si tuhle mapu! Je na ní vyznačena poloha ohniska.
	B_Story_BringFirstFocus();
	B_LogEntry(CH2_Focus,"Y´Berion vyslal novice Nyrase, aby přinesl magické ohnisko, ten se však ještě nevrátil. Guru mi dal mapu s vyznačenou cestou k ohnisku.");
};

func void Info_YBerion_BringFocus_WO()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01");	//Kde mám začít pátrat?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02");	//Vyjdi z tábora, dej se doprava a pak nahoru na vysoký útes. Pak pokračuj lesem, dokud neuvidíš moře. Tam to ohnisko najdeš.
};

func void Info_YBerion_BringFocus_FOKUS()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01");	//Proč je to ohnisko tak důležité?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02");	//Je to magický předmět, který soustřeďuje naši duchovní sílu.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03");	//Je to jeden z pěti ohniskových kamenů, které použili mágové ke vztyčení Bariéry.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04");	//V jedné vidině jsem viděl, jak využíváme sílu toho ohniska.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05");	//To byla docela zajímavá vidina.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06");	//Moje vidina byla znamením od Spáče. Můžeme k němu dojít pomocí toho ohniska!
};


instance Info_YBerion_BringFocus_RUNNING(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_RUNNING_Condition;
	information = Info_YBerion_BringFocus_RUNNING_Info;
	permanent = 0;
	description = "Pořád to ohnisko nemůžu najít.";
};


func int Info_YBerion_BringFocus_RUNNING_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && !Npc_HasItems(hero,Focus_1))
	{
		return TRUE;
	};
};

func void Info_YBerion_BringFocus_RUNNING_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01");	//Pořád to ohnisko nemůžu najít.
	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02");	//Tak hledej. Spáč tě povede.
};


instance Info_YBerion_BringFocus_Success(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_Success_Condition;
	information = Info_YBerion_BringFocus_Success_Info;
	permanent = 0;
	description = "Našel jsem to ohnisko.";
};


func int Info_YBerion_BringFocus_Success_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Success_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01");	//Našel jsem to ohnisko.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02");	//Výborně. Nesmírně jsi nám pomohl.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03");	//Teď dej to ohnisko zpátky Corovi Kalomovi. Ten ví, co je třeba udělat.
	if(Kalom_TalkedTo == FALSE)
	{
		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04");	//Kde najdu toho Cora Kaloma?
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05");	//Většinu času tráví ve své alchymistické dílně v horní sekci můstků.
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06");	//Zeptej se u vchodu do tábora Lestera... ten často provádí nováčky po táboru.
		B_LogEntry(CH2_Focus,"Y´Berion mi řekl, abych to ohnisko předal dalšímu guru jménem Cor Kalom. Cor Kalom tráví celé dny ve své alchymistické dílně.");
	}
	else
	{
		B_LogEntry(CH2_Focus,"Y´Berion mi řekl, abych to ohnisko předal  Cor Kalomovi. Jaké potěšení, shledat se zase s tím příjemným chlapíkem.");
	};
	TPL_1406_Templer.aivar[AIV_PASSGATE] = TRUE;
	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP(XP_BringFocusToYBerion);
};


instance Info_YBerion_NYRAS(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_NYRAS_Condition;
	information = Info_YBerion_NYRAS_Info;
	permanent = 0;
	description = "Novic Nyras zešílel!";
};


func int Info_YBerion_NYRAS_Condition()
{
	if(Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_NYRAS_Info()
{
	AI_Output(other,self,"Info_YBerion_NYRAS_15_01");	//Novic Nyras zešílel!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_02");	//Říkal, že mluvil se Spáčem, který si ho zvolil za svého pomocníka!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_03");	//Pak mě napadl a pokusil se mě zabít!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_04");	//Spáčova moc je tak nesmírná, že nepřipravené duše přivede k zoufalství!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_05");	//Jenom my, Guru, jsme léty strávenými v meditacích dosáhli takové duchovní síly, která dokáže unést sílu hlasu všemohoucího Spáče!
};


instance GUR_1200_Yberion_EARN(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = GUR_1200_Yberion_EARN_Condition;
	information = GUR_1200_Yberion_EARN_Info;
	important = 0;
	permanent = 0;
	description = "A co takhle nějaká odměna?";
};


func int GUR_1200_Yberion_EARN_Condition()
{
	if((YBerion_BringFocus == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) != GIL_NOV) && C_IsChapter(2))
	{
		return 1;
	};
};

func void GUR_1200_Yberion_EARN_Info()
{
	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//A co takhle nějakou odměnu?
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02");	//Protože nejsi členem našeho Bratrstva, odměním tě.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03");	//Vezmi si tento amulet na znamení mé vděčnosti.
	CreateInvItem(self,Schutzamulett_Feuer);
	B_GiveInvItems(self,hero,Schutzamulett_Feuer,1);
};

