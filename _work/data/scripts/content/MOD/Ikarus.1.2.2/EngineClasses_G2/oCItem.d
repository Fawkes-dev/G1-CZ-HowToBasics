class oCItem {
//zCVob {
  //zCObject {
  var int    _vtbl;					//0
  var int    _zCObject_refCtr;				//4
  var int    _zCObject_hashIndex;			//8
  var int    _zCObject_hashNext;			//12
  var string _zCObject_objectName;			//16
  //}
  var int    _zCVob_globalVobTreeNode;			//36
  var int    _zCVob_lastTimeDrawn;			//40
  var int    _zCVob_lastTimeCollected;			//44
  var int    _zCVob_vobLeafList_array;			//48
  var int    _zCVob_vobLeafList_numAlloc;		//52
  var int    _zCVob_vobLeafList_numInArray;		//56
  var int    _zCVob_trafoObjToWorld[16];		//60
  var int    _zCVob_bbox3D_mins[3];			//124
  var int    _zCVob_bbox3D_maxs[3];			//136
  var int    _zCVob_bsphere3D_center[3];		//148
  var int    _zCVob_bsphere3D_radius;			//160
  var int    _zCVob_touchVobList_array;			//164
  var int    _zCVob_touchVobList_numAlloc;		//168
  var int    _zCVob_touchVobList_numInArray;		//172
  var int    _zCVob_type;				//176
  var int    _zCVob_groundShadowSizePacked;		//180
  var int    _zCVob_homeWorld;				//184
  var int    _zCVob_groundPoly;				//188
  var int    _zCVob_callback_ai;			//192
  var int    _zCVob_trafo;				//196
  var int    _zCVob_visual;				//200
  var int    _zCVob_visualAlpha;			//204
  var int    _zCVob_m_fVobFarClipZScale;		//208
  var int    _zCVob_m_AniMode;				//212
  var int    _zCVob_m_aniModeStrength;			//216
  var int    _zCVob_m_zBias;				//220
  var int    _zCVob_rigidBody;				//224
  var int    _zCVob_lightColorStat;			//228
  var int    _zCVob_lightColorDyn;			//232
  var int    _zCVob_lightDirectionStat[3];		//236
  var int    _zCVob_vobPresetName;			//248
  var int    _zCVob_eventManager;			//252
  var int    _zCVob_nextOnTimer;			//256
  var int    _zCVob_bitfield[5];			//260
  var int    _zCVob_m_poCollisionObjectClass;		//280
  var int    _zCVob_m_poCollisionObject;		//284
  
// Für alle Items
	VAR INT		id;				//288
	VAR STRING  name,nameID;			//292, 312
	VAR INT		hp,hp_max;			//332, 336

	VAR INT     mainflag,flags;			//340, 344	Hauptflag und weitere Flags
	VAR INT		weight,value;			//348, 352

	// Für Waffen
	VAR INT		damageType;			//356		Welche Schadensarten
	VAR INT		damageTotal;			//360
	VAR INT		damage[DAM_INDEX_MAX];		//364

	// Für Rüstungen
	VAR INT		wear;				//396
	VAR INT		protection[PROT_INDEX_MAX];	//400

	// Für Nahrung
	VAR INT		nutrition;			//432	HP-Steigerung bei Nahrung

	// Benötigte Attribute zum Benutzen des Items
	VAR INT		cond_atr[3];			//436
	VAR INT		cond_value[3];			//448

	// Attribute, die bei anlegen des Items verändert werden
	VAR INT		change_atr[3];			//460
	VAR INT		change_value[3];		//472

	// Parserfunktionen
	VAR int 	magic;				//484	Parserfunktion zum "Magie Header"
	VAR int 	on_equip;			//488	Parserfunktion, wenn Item equipped wird.
	VAR int 	on_unequip;			//492	Parserfunktion, wenn Item unequipped wird.
	VAR int 	on_state[4];			//496

	// Besitzer									
	VAR int 	owner;				//512	Besitzer : Instanz-Name
	VAR INT		ownerGuild;			//516	Besitzer : Gilde
	VAR INT		disguiseGuild;			//520	Zur Schau getragene Gilde durch Verkleidung

	// Die 3DS-Datei
	VAR STRING	visual;				//524

	// Veränderung des NSC-Meshes beim Anlegen dieses Gegenstandes
	VAR STRING  visual_change;			//544	ASC - File
	VAR STRING  effect;				//564	Effekt Instanz

	VAR INT		visual_skin;			//584
	
	VAR STRING 	scemeName;			//588
	VAR INT		material;			//608
	// VAR STRING	pfx								;		//	Magic Weapon PFX
	VAR INT		munition;			//612	instance of Munition

	var int 	spell;				//616
	var int		range;				//620
	
	var int		mag_circle;			//624
	
	VAR STRING	description;			//628
	VAR STRING	text			[ITM_TEXT_MAX]	;
	VAR INT		count			[ITM_TEXT_MAX]	;
	
	// inventory darstellungs geschichten, wird nur benutzt, falls von 0 abweichend
	var int	    inv_zbias;								//  wie weit ist das item im inventory richtung far plane verschoben (integer scale 100=1)
	var	int		inv_rotx;								//  wieviel grad um die x achse ist das item im inv gedreht
	var int 	inv_roty;								//  wieviel grad um die y achse ist das item im inv gedreht
	var int 	inv_rotz;								//  wieviel grad um die z achse ist das item im inv gedreht
	var int 	inv_animate;							//  soll das item in inv rotiert werden

	var int amount;							//int Wieviele Items sind das (Itemstapel)
	var int instanz;						//int Symbolindex
	var int c_manipulation;					//int ?
	var int last_manipulation;				//zREAL ?
	var int magic_value;					//int ?
	var int effectVob;						//oCVisualFX*
	var int next;							//oCItem* sind wohl einfach verkettete Listen.
};				