
func void B_Story_FoundOrcSlave()
{
	B_LogEntry(CH4_UluMulu,"Ve spodní štole Svobodného dolu jsem se setkal s jedním přítelem Ur-Shaka. Jmenoval se Tarrok. Je otráven a okamžitě potřebuje lahvičku speciálního skřetího léku, kterou ztratil při útěku. Je někde ve spodních štolách dolu. Musím ji najít, jinak zemře.");
	B_GiveXP(XP_FoundOrcSlave);
	FreemineOrc_SuchePotion = LOG_RUNNING;
};

