
instance Info_FreemineOrc_EXIT(C_Info)
{
	npc = FreemineOrc;
	nr = 999;
	condition = Info_FreemineOrc_EXIT_Condition;
	information = Info_FreemineOrc_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_FreemineOrc_EXIT_Condition()
{
	return 1;
};

func void Info_FreemineOrc_EXIT_Info()
{
	if(!Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_01");	//Musím pokračovat!
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_02");	//Pojď dál, cizinče!
	}
	else
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Děkuju. Půjdu si svou cestou.
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_04");	//Šťastnou cestu, cizinče!
	};
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_INTRO(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_INTRO_Condition;
	information = Info_FreemineOrc_INTRO_Info;
	important = 1;
	permanent = 0;
};


func int Info_FreemineOrc_INTRO_Condition()
{
	return TRUE;
};

func void Info_FreemineOrc_INTRO_Info()
{
	AI_Output(self,hero,"Info_FreemineOrc_INTRO_17_01");	//Tarrok potřebovat pomoc! Tarrok být raněn.
};


instance Info_FreemineOrc_WASPASSIERT(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_WASPASSIERT_Condition;
	information = Info_FreemineOrc_WASPASSIERT_Info;
	important = 0;
	permanent = 0;
	description = "Co se tu stalo?";
};


func int Info_FreemineOrc_WASPASSIERT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_WASPASSIERT_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASPASSIERT_15_01");	//Co se tu stalo?
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_02");	//Tarrok být tady zajat modrými vojáky. Rudí vojáci najednou všude.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_03");	//Rudí vojáci zabíjet každého.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_04");	//Tarrok utekl. Rudí vojáci sem nejít. Rudí vojáci se bát GACH LUGA.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_05");	//Prosím pomoc, Tarrok být raněn.
};


instance Info_FreemineOrc_WASTUN(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_WASTUN_Condition;
	information = Info_FreemineOrc_WASTUN_Info;
	important = 0;
	permanent = 0;
	description = "Co pro tebe můžu udělat?";
};


func int Info_FreemineOrc_WASTUN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_WASTUN_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_01");	//Co pro tebe můžu udělat?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_02");	//Tarrok potřebovat silný lék. Tarrok jinak brzy zemřít.
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_03");	//Jaký druh léku?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_04");	//GACH LUGŮV lektvar. Tarrok potřebovat lék.
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_05");	//Tarrok mít lék, ale Tarrok ztratit. Tarrok ho nenajít!
};


instance Info_FreemineOrc_OFFER(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_OFFER_Condition;
	information = Info_FreemineOrc_OFFER_Info;
	important = 0;
	permanent = 0;
	description = "Přinesu ti ten lék zpátky!";
};


func int Info_FreemineOrc_OFFER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) && !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION) && !Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_OFFER_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01");	//Přinesu ti ten lék zpátky!
	AI_Output(self,hero,"Info_FreemineOrc_OFFER_17_02");	//Tarrok být velmi slabý. Cizinec pospíchat, jinak Tarrok zemřít!
	AI_StopProcessInfos(self);
	B_Story_FoundOrcSlave();
};


instance Info_FreemineOrc_CRAWLER(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_CRAWLER_Condition;
	information = Info_FreemineOrc_CRAWLER_Info;
	important = 0;
	permanent = 0;
	description = "Co to znamená GACH LUG?";
};


func int Info_FreemineOrc_CRAWLER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_CRAWLER_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_01");	//Co to znamená GACH LUG?
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_02");	//Být velké zvíře, kráčet na mnoha nohách.
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_03");	//GACH LUG být nebezpečný! Jíst skřety a lidi!
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_04");	//Máš určitě na mysli důlní červy tady zezdola!
};


instance Info_FreemineOrc_TONGUE(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TONGUE_Condition;
	information = Info_FreemineOrc_TONGUE_Info;
	important = 0;
	permanent = 0;
	description = "Ty mluvíš naším jazykem?";
};


func int Info_FreemineOrc_TONGUE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TONGUE_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TONGUE_15_01");	//Ty mluvíš naším jazykem?
	AI_Output(self,hero,"Info_FreemineOrc_TONGUE_17_02");	//Tarrok být dlouho otrokem u lidí. Tarrok dobře poslouchat.
};


instance Info_FreemineOrc_SEARCHPOTION(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SEARCHPOTION_Condition;
	information = Info_FreemineOrc_SEARCHPOTION_Info;
	important = 0;
	permanent = 1;
	description = "Nemůžu ten lék najít!";
};


func int Info_FreemineOrc_SEARCHPOTION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER) && !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION) && !Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SEARCHPOTION_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SEARCHPOTION_15_01");	//Nemůžu ten lék najít!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_02");	//Cizinec ještě hledat! Lék být tady.
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_03");	//Tarrok utekl GACH LUGOVI! Tarrok se schovat na útěku.
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_04");	//Cizinec také hledat ve výklenku.
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_SUCHEULUMULU(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SUCHEULUMULU_Condition;
	information = Info_FreemineOrc_SUCHEULUMULU_Info;
	important = 0;
	permanent = 0;
	description = "Jsi přítel Ur-Shaka, toho šamana?";
};


func int Info_FreemineOrc_SUCHEULUMULU_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SUCHEULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_01");	//Jsi přítel Ur-Shaka, toho šamana?
	AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_02");	//Ur-Shak být otrok, jako Tarrok. Ur-Shak utéct! Být pryč už mnoho zim.
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_03");	//Tvůj přítel říkal, že bys mně mohl udělat Ulu-Mulu!
	if(FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_04");	//Ty pomoc mně, já pomoc tobě!
	}
	else
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_05");	//Tarrok být velmi slabý. Když nebýt lék, Tarrok zemřít.
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_06");	//Cizinec přinést lék, pak Tarrok pomoc!
	};
};


instance Info_FreemineOrc_GIVEPOTION(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_GIVEPOTION_Condition;
	information = Info_FreemineOrc_GIVEPOTION_Info;
	important = 0;
	permanent = 0;
	description = "Tady, našel jsem tvůj lék!";
};


func int Info_FreemineOrc_GIVEPOTION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) && Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_GIVEPOTION_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_01");	//Tady, našel jsem tvůj lék!
	B_GiveInvItems(hero,self,OrcMedicine,1);
	EquipItem(self,OrcMedicine);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItemToState(self,OrcMedicine,1);
	AI_UseItemToState(self,OrcMedicine,-1);
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_02");	//Cizinec nebýt špatný jako ostatní lidé! Cizinec být dobrý!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_03");	//Tarrok dlužit díky!
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_04");	//Můžeš mi teď dát ten Ulu-Mulu?
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_05");	//Cizinec pomoc Tarrokovi, Tarrok pomoc cizincovi také.
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_06");	//Cizinec potřebovat KROTAHK, KHAZ-TAK, DWACHKARR a ORTH-ANTAK.
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_07");	//Cizinec to přinést, Tarrok pak udělat Ulu-Mulu!
	if(!Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER))
	{
		B_Story_FoundOrcSlave();
	};
	B_Story_CuredOrc();
};


instance Info_FreemineOrc_FIREWARAN(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_FIREWARAN_Condition;
	information = Info_FreemineOrc_FIREWARAN_Info;
	important = 0;
	permanent = 0;
	description = "Co je to KROTAHK?";
};


func int Info_FreemineOrc_FIREWARAN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN_15_01");	//Co je to KROTAHK?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN_17_02");	//Být ohnivý jazyk. Být jazyk ohnivé ještěrky!
};


instance Info_FreemineOrc_FIREWARAN2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_FIREWARAN2_Condition;
	information = Info_FreemineOrc_FIREWARAN2_Info;
	important = 0;
	permanent = 0;
	description = "Kde najdu ohnivou ještěrku?";
};


func int Info_FreemineOrc_FIREWARAN2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN) && !Npc_HasItems(hero,ItAt_Waran_01) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN2_15_01");	//Kde najdu ohnivou ještěrku?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_02");	//Ohnivá ještěrka žít doma. Doma u Tarroka. Cizinec muset hledat!
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_03");	//Také najít ohnivou ještěrku na písku u moře.
	B_LogEntry(CH4_UluMulu,"Tarok potřebuje k výrobě ULU-MULU jazyk ohnivé ještěrky. Tyto ještěrky žijí hlavně v skřetích oblastech a na písčitém pobřeží. Nebyl tam lodní vrak plný ještěrek?");
};


instance Info_FreemineOrc_SHADOWBEAST(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SHADOWBEAST_Condition;
	information = Info_FreemineOrc_SHADOWBEAST_Info;
	important = 0;
	permanent = 0;
	description = "Co je to KHAZ-TAK?";
};


func int Info_FreemineOrc_SHADOWBEAST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01");	//Co je to KHAZ-TAK?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02");	//Být roh stínové obludy. Roh ostrý jako nůž a tvrdý jako kámen.
};


instance Info_FreemineOrc_SHADOWBEAST2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SHADOWBEAST2_Condition;
	information = Info_FreemineOrc_SHADOWBEAST2_Info;
	important = 0;
	permanent = 0;
	description = "Kde najdu stínovou obludu?";
};


func int Info_FreemineOrc_SHADOWBEAST2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST) && !Npc_HasItems(hero,ItAt_Shadow_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01");	//Kde najdu stínovou obludu?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02");	//Žít v lese nebo v jeskyni. Ne na světle.
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03");	//Být moc nebezpečná. Cizinec být opatrný!
	B_LogEntry(CH4_UluMulu,"Tarok potřebuje k výrobě ULU-MULU roh stínové šelmy. Tyto šelmy žijí hlavně v tmavých lesích a jeskyních. Pokud vím, tak největší les kolonie je mezi Starým táborem a Táborem v bažinách.");
};


instance Info_FreemineOrc_SWAMPSHARK(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SWAMPSHARK_Condition;
	information = Info_FreemineOrc_SWAMPSHARK_Info;
	important = 0;
	permanent = 0;
	description = "DWACHKARR? Co to je?";
};


func int Info_FreemineOrc_SWAMPSHARK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK_15_01");	//DWACHKARR? Co to je?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK_17_02");	//Být zub močálového žraloka. Když zub zakousnout, oběť už nikdy ne utéct.
};


instance Info_FreemineOrc_SWAMPSHARK2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SWAMPSHARK2_Condition;
	information = Info_FreemineOrc_SWAMPSHARK2_Info;
	important = 0;
	permanent = 0;
	description = "Kde najdu močálového žraloka?";
};


func int Info_FreemineOrc_SWAMPSHARK2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK) && !Npc_HasItems(hero,ItAt_Swampshark_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK2_15_01");	//Kde najdu močálového žraloka?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK2_17_02");	//Mnoho močálových žraloků být v táboře lidí. V táboře v bažinách, tak!
	B_LogEntry(CH4_UluMulu,"Tarok potřebuje k výrobě ULU-MULU zuby močálového žraloka. Spousty těchto bestií žijí za táborem Bratrstva.");
};


instance Info_FreemineOrc_TROLL(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TROLL_Condition;
	information = Info_FreemineOrc_TROLL_Info;
	important = 0;
	permanent = 0;
	description = "Co je to ORTH-ANTAK?";
};


func int Info_FreemineOrc_TROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL_15_01");	//Co je to ORTH-ANTAK?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL_17_02");	//Být zub velkého trola! Udělat velkou díru do kořisti!
};


instance Info_FreemineOrc_TROLL2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TROLL2_Condition;
	information = Info_FreemineOrc_TROLL2_Info;
	important = 0;
	permanent = 0;
	description = "Kde najdu trola?";
};


func int Info_FreemineOrc_TROLL2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL) && !Npc_HasItems(hero,ItAt_Troll_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL2_15_01");	//Kde najdu nějakého trola?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_02");	//Trol žít v horách. Trol milovat hodně prostoru!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_03");	//Cizinec muset jít hledat v severních horách! Ale dávat pozor na pěst trola!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_04");	//Když pěst udeřit, cizinec spadnout z hory!
	B_LogEntry(CH4_UluMulu,"Tarok potřebuje k výrobě ULU-MULU trolí tesáky. Tyto bestie žijí v horách na severu kolonie. Měl bych prohledat tamější rokliny.");
};


instance Info_FreemineOrc_LOOKINGULUMULU(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_LOOKINGULUMULU_Condition;
	information = Info_FreemineOrc_LOOKINGULUMULU_Info;
	important = 0;
	permanent = 1;
	description = "Ještě nemám všechny čtyři složky!";
};


func int Info_FreemineOrc_LOOKINGULUMULU_Condition()
{
	if(!Npc_HasItems(hero,ItAt_Waran_01) && Npc_HasItems(hero,ItAt_Shadow_02) && Npc_HasItems(hero,ItAt_Swampshark_02) && Npc_HasItems(hero,ItAt_Troll_02) && Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN2) && Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST2) && Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK2) && Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL2))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_LOOKINGULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_LOOKINGULUMULU_15_01");	//Ještě nemám všechny čtyři složky!
	AI_Output(self,hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02");	//Cizinec pokračovat hledat. Tarrok počkat tady!
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_EveryUlumulu(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_EVERYULUMULU_Condition;
	information = Info_FreemineOrc_EVERYULUMULU_Info;
	important = 0;
	permanent = 0;
	description = "Už mám všechny čtyři složky pro Ulu-Mulu!";
};


func int Info_FreemineOrc_EVERYULUMULU_Condition()
{
	if((FreemineOrc_LookingUlumulu == LOG_RUNNING) && Npc_HasItems(hero,ItAt_Waran_01) && Npc_HasItems(hero,ItAt_Shadow_02) && Npc_HasItems(hero,ItAt_Swampshark_02) && Npc_HasItems(hero,ItAt_Troll_02))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_EVERYULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_EVERYULUMULU_15_01");	//Už mám všechny čtyři složky pro Ulu-Mulu!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_02");	//Cizinec být silný bojovník! Dát mi ty složky! Tarrok udělat Ulu-Mulu!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_03");	//Tady! Cizinec nosit ULU-MULU s hrdostí! Tarrok teď spát!
	CreateInvItems(hero,ItAt_Waran_01,3);
	B_GiveInvItems(hero,self,ItAt_Waran_01,4);
	Npc_RemoveInvItem(hero,ItAt_Shadow_02);
	Npc_RemoveInvItem(hero,ItAt_Swampshark_02);
	Npc_RemoveInvItem(hero,ItAt_Troll_02);
	Npc_RemoveInvItems(self,ItAt_Waran_01,4);
	B_Story_GotUluMulu();
	AI_StopProcessInfos(self);
};

