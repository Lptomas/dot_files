/*
To compile : # cd ~/.config/dwm/ ; rm -f config.h ; sudo make clean install'


EDIT:    config.def.h     NOT   config.h   remove "config.h" before compiling

patch -p1 < /path/to/patch.diff
remove "config.h" before compiling


Patches instalados:
dwm-systray-20210418-67d76bd.diff		
dwm-bar-height-spacing-6.3.diff			
dwm-scratchpads-20200414-728d397b.diff  
dwm-actualfullscreen-20211013-cb3f58a.diff
dwm-gridmode-5.8.2.diff
dwm-pertag-20200914-61bb8b2.diff
dwm-cyclelayouts-20180524-6.2.diff
dwm-attachbottom-6.3.diff 
dwm-cool-autostart-6.2.diff  -> configurated to have a autostart file: dwm_cool_autostart.sh

*/

/*

xkill   -  select window with mouse to kill
*/



/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  	 = 1;	/* border pixel of windows */
static const unsigned int snap      	 = 25;	/* snap pixel */
static const unsigned int systraypinning = 0;	/* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft  = 0;	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 1;	/* systray spacing */
static const int systraypinningfailfirst = 1;	/* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;		/* 0 means no systray */
static const int showbar            = 1;		/* 0 means no bar */
static const int topbar             = 1;		 /* 0 means bottom bar */
static const int user_bh            = 2;		/* 2 is the default spacing around the bar's font */
//static const char *fonts[]          = { "Noto Sans Mono:size=10" };
static const char *fonts[]          = { "hack:size=12", "Symbols Nerd Font:antialias=true:autohint=true"  };

static const char dmenufont[]       = "hack:size=12";
static const char col_gray1[]       = "#4d4d4d";
static const char col_gray2[]       = "#666666";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_gray5[]       = "#060606";
static const char col_cyan[]        = "#005577";
static const char col_green[]       = "#07AE06";
static const char col_dark_green[]  = "#153715"; //
static const char col_red[]       	= "#ff0000";
static const char col_black[]       = "#000000";
static const char *colors[][3]      = {		
	/*[SchemeNorm] = { A, B, C }, 
		A = cor do TEXTO do que NÂO está activo : workspaces não selecionados e slstatus
		B=  cor do FUNDO do que NÂO está activo : workspaces não selecionados e slstatus
		C = Cor da borda das janelas que não está em foco				*/
	[SchemeNorm] = { col_green, col_black, col_gray5 },
	
	/*[SchemeSel]  = {A , B,  C  }, 
		A = Cor texto em Focus e cor texto da designação das janelas
		B = Cor Fundo worksapce em focus e cor fundo da designação das janelas
		C = Cor da borda das janelas que estão em foco				*/		
	[SchemeSel]  = { col_green , col_dark_green,  col_green  },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;



/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }




/******************** scratchpad  
Para usar os scratchpad é necessário que pelo menos o Terminal aceite:
https://www.youtube.com/watch?v=sTHww5r_mVU
 - mudar o mome da janela, ou seja o "instance"
 - mudar o windows size

man st
man alacritty */

// *spcmd1[] = { programa + flag -n = name = spterm + flnag -g = size = 120x34		: st --man man 
//const char *spcmd1[] = {"st", "-n", "spterm", "-g", "120x34", NULL };
//const char *spcmd2[] = {"st", "-n", "spfm", "-g", "120x34", "-e", "lf", NULL };

// O tamanho da janela depende da resolução do ecrã e do: "-o", "window.dimensions.columns=120", "-o", "window.dimensions.lines=30"

//const char *spcmd1[] = {"alacritty", "--class", "spterm", "--config-file", "/home/lpt/.config/alacritty/alacritty_dwm_scratchpad.yml",NULL, NULL,NULL};
//const char *spcmd2[] = {"alacritty", "--class", "spfm", "--config-file", "/home/lpt/.config/alacritty/alacritty_dwm_scratchpad.yml","-e", "lf",NULL};
//const char *spcmd6[] = {"alacritty", "--class", "sphtop", "--config-file", "/home/lpt/.config/alacritty/alacritty_dwm_scratchpad.yml","-e", "htop",NULL};

const char *spcmd1[] = {"alacritty", "--class", "spterm", "-o", "window.dimensions.columns=120", "-o", "window.dimensions.lines=30",NULL, NULL,NULL};
/*Arch
const char *spcmd2[] = {"alacritty", "--class", "spfm", "-o", "window.dimensions.columns=160", "-o", "window.dimensions.lines=45", "-e", "sh", "-c", "~/.local/bin/lfub", NULL};
*/
/*Void*/
const char *spcmd2[] = {"alacritty", "--class", "spfm", "-o", "window.dimensions.columns=160", "-o", "window.dimensions.lines=45", "-e", "sh", "-c", "lf", NULL};


const char *spcmd3[] = {"thunar", NULL }; 
const char *spcmd4[] = {"firefox", "--class", "firefox",NULL }; // Nao funciona
const char *spcmd5[] = {"code", NULL }; // estava thunar
const char *spcmd6[] = {"alacritty", "--class", "sphtop", "-o", "window.dimensions.columns=130", "-o", "window.dimensions.lines=35","-e", "htop",NULL};



static Sp scratchpads[] = {   	//{"thunar",   	SHCMD("thunar")}, // nao funciona
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spranger",    spcmd2},
	{"thunar",   	spcmd3},
	{"firefox",   	spcmd4},   //nao funciona no scratchpads
	{"code",   		spcmd5},   
	{"sphtop",   	spcmd6},
};


/******************** Autostart  : dwm-cool-autostart-6.2.diff 
* Everything to start after DWM is in ~/.config/dwm/dwm_cool_autostart.sh file 			*/

static const char *const autostart[] = {
//	"st", NULL,
	"sh", "-c", "~/.config/dwm/dwm_cool_autostart.sh",
	NULL /* terminate */
};


/* tagging : https://www.unicode.org/charts/PDF/U260
0.pdf */ 
static const char *tags[] = {"", "", "3", "󰈙", "5", "󰊖", "7", "󰢹"};

static const Rule rules[] = {
	/* See windows properties with : xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 *  use tags mask to point an application to a specific workspace
	 * 
	 * https://dwm.suckless.org/customisation/tagmask/
	 * *tags[] = 00001 = work   Original position
	 * *tags[] = 00100 = FM   -> 1 << 2 : 1 is shifted 2 times to left: 
	 * 
	 * 
	 * monitor: "-1"= actual monitor ; "0"= main Monitor ? ;  "1"=2nd monitor  ; 
	 */
	 
	 //multiple scratchpads
	/* class      					instance    		title       tags mask    		isfloating   	monitor */
	{ NULL,		  					"spterm",			NULL,		SPTAG(0),			1,			 	-1 },
	{ NULL,		  					"spfm",				NULL,		SPTAG(1),			1,			 	-1 },
	{ NULL,		  					"thunar",			NULL,		SPTAG(2),			0,			 	-1 },
	{ NULL,		  					"firefox",			NULL,		SPTAG(3),			0,			 	-1 },
	{ NULL,		  					"code",				NULL,		SPTAG(4),			0,			 	-1 },
	{ NULL,		  					"sphtop",			NULL,		SPTAG(5),			1,			 	-1 },

// Actual workspace
	/* class                      	instance    		title      	Tags mask     		isfloating   	monitor */
	{ "Galculator", 				NULL,      			NULL,  		0,            		1,           	-1 },
	{ NULL, 		   	   			"xfce4-appfinder", 	NULL,   	0,           		1,           	-1 },
	{ "Arandr", 			   		NULL,      			NULL,  		0,            		1,           	-1 },
	{ "Gimp",                      	NULL,       		NULL,      	1,            		0,           	-1 },
	{ "Xfce4-terminal",            	NULL,       		NULL,      	0,            		1,           	-1 },
	{ "Arcolinux-welcome-app.py",  	NULL,       		NULL,      	0,           		1,           	-1 },
	{ "Arcolinux-calamares-tool.py",NULL,    			NULL,      	0,            		1,           	-1 },	
	{ "resistor_decoder",  			NULL,    			NULL,      	0,            		1,           	-1 },	
	{ "pixeltomatrix.exe",  		NULL,    			NULL,      	0,            		1,           	-1 },
	{ "pavucontrol",  				NULL,    			NULL,      	0,            		1,           	-1 },
	{ "float_windows",  			NULL,    			NULL,      	0,            		1,           	-1 },
	
	
	/* "Picture-in-Picture" do firefox--nao está a funcionar
	{ "Toolkit",  					NULL,    			NULL,      	0,            		1,           	-1 },	
	{ NULL,  						"Toolkit",  		NULL,      	0,            		1,           	-1 },
	{ NULL,  		   				NULL,      			"Toolkit",  0,            		1,           	-1 },
	{ "Picture-in-Picture",  		NULL,    			NULL,      	0,            		1,           	-1 },	
	{ NULL,  						"Picture-in-Picture", NULL,     0,            		1,           	-1 },
	{ NULL,  		   				NULL,      			"Picture-in-Picture",  0,       1,           	-1 },
*/
	{ NULL,  "Toolkit",  		   				     			"Picture-in-Picture",  0,       1,           	-1 },

/*
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
WM_CLASS(STRING) = "Toolkit", "firefox"
WM_NAME(STRING) = "Picture-in-Picture"

*/



// Workspace 1 // WEB
	/* class                       	instance    		title      		tags mask     		isfloating  	monitor */
	 { "firefox", 	            	NULL,       		NULL,     		1,       			0,           	-1 },


// Workspace 2    // code
	/* class                       	instance    		title     		tags mask     		isfloating   	monitor */
	{ NULL, 		   				"code",    			NULL,  	   		1 << 1,             0,           	-1 },
	{ "code",						NULL, 	   			NULL,  	   		1 << 1,             0,           	-1 },


// Workspace 3   // File manager
	/* class       					instance    		title     		tags mask     		isfloating  	 monitor */
	{ "thunar", 					NULL,    			NULL,      		1 << 2,       		0,           	-1 },
	{ "Thunar", 					NULL,    			NULL,      		1 << 2,       		0,           	-1 },
	{ "Nemo", 						NULL,    			NULL,     		1 << 2,       		0,          	-1 },	
	{ "lf", 						NULL,    			NULL,      		1 << 2,       		0,           	-1 },	
	//{ NULL, 						"Nemo",    			NULL,      		1 << 2,       		0,           	-1 },
// Workspace 4 // OFFICE
	/* class                    	instance    		Title      		tags mask     		isfloating   	monitor */
	{ NULL, 		   				"libreoffice",  	NULL,     		1 << 3,      		0,           	-1 },
	{ "libreoffice", 		   		"libreoffice",  	NULL,      		1 << 3,       		0,           	-1 },
	{ "libreoffice-writer", 		 NULL,				NULL,      		1 << 3,       		0,           	-1 },

	
	//voidlinux:
	{NULL , 		   				NULL, 				"libreoffice",  1 << 3,      		 0,           	-1 },

// Workspace 5 // PDF
	/* class                    	instance    		Title      		tags mask     		isfloating   	monitor */
	{ NULL, 		   				"evince",    		NULL,      		1 << 4,      		 0,           	-1 },	

// Workspace 6 // Game
	/* class                    	instance    		Title      			tags mask     	isfloating   	monitor */
	{ "Steam", 		   				NULL,    			NULL,      			1 << 5,       		0,           	-1 },
	{ NULL, 		   				"Steam",    		NULL,      			1 << 5,       		0,           	-1 },
	{ "steamwebhelper", 		   	NULL,    			NULL,      			1 << 5,       		0,           	-1 },
	{ NULL, 						"steamwebhelper",   NULL,      			1 << 5,       		0,           	-1 },
	{ NULL, 		   				NULL,    			"steamwebhelper",	1 << 5,       		0,           	-1 },
	{ "Special Offers", 		   	NULL,    			NULL,      			1 << 5,       		0,           	-1 },
	{ NULL, 						"Special Offers",   NULL,      			1 << 5,       		0,           	-1 },
	{ NULL, 		   				NULL,    			"Special Offers",   1 << 5,       		0,           	-1 },
	{ NULL, 		   				NULL,    			"Steam",   			1 << 5,      		0,           	-1 },	
	{ "Lutris", 		   			NULL,    			NULL,      			1 << 5,       		0,           	-1 },
	{ "chromium", 		   			NULL,    			NULL,      			1 << 5,       		0,           	-1 },
	{ "steam_proton", 		   		NULL,    			NULL,      			1 << 5,       		0,           	-1 },

// Workspace 7 // bluethood e som e comfig
	/* class                    	instance    		Title      				tags mask     isfloating   		monitor */
	{ NULL, 		   				NULL,    			"Bluetooth",      			1 << 6,       		0,           	0 },
	{ NULL, 						NULL,    			"Controlo de Volume",      	1 << 6,       		0,          	0 },
	{ NULL, 						NULL,    			"JBL E65BTNC",      		1 << 6,       		0,           	0 },
	{ NULL, 						NULL,    			"Flipbuds Lite",      		1 << 6,       		0,           	0 },
	{ NULL, 						NULL,    			"Xiaomi Buds 3",      		1 << 6,       		0,           	0 },
	{ NULL, 						NULL,    			"blueman-applet",      		1 << 6,       		0,           	0 },
	{ NULL, 						NULL,    			"Dispositivos Bluetooth",   1 << 6,       		0,           	0 },



// Workspace 8 // Remote
	/* class                    	instance    		Title      								tags mask     		isfloating   		monitor */
	{ "TeamViewer",					NULL, 	   			NULL,  	   								1 << 7,             		0,           	-1 },
	{ NULL,							NULL, 	   			"133 - Srv EPLAN — TeamViewer",  	   	1 << 7,             		0,           	-1 },
	{ NULL,							NULL, 	   			"Luis-Nuc — TeamViewer",  	   			1 << 7,             		0,           	-1 },
	

};

/* layout(s) */
static const float mfact    	= 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster    	= 1;    /* number of clients in master area */
static const int resizehints 	= 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; 	/* 1 will force focus on the fullscreen window */

#include "grid.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "HHH",      grid },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define WIN_KEY Mod4Mask  	// SUPER
#define MODKEY Mod1Mask   	// left ALT

#define TAGKEYS(KEY,TAG) \
	{ WIN_KEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ WIN_KEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ WIN_KEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ WIN_KEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },


/* commands */

//static const char *app_finder[]  	= { "xfce4-appfinder", NULL };
//{ WIN_KEY|ShiftMask,      			XK_a, 			spawn,          {.v = app_finder } },




static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */																
//static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };																	
static const char *dmenucmd[] = { "dmenu_run", "-i", "-m", dmenumon, "-fn", dmenufont, "-nb", col_black, "-nf", col_green, "-sb", col_green, "-sf", col_gray5, NULL };


/*
-fn defines the font
-nb defines the normal background color
-nf defines the normal foreground color (#RGB, #RRGGBB, and color names are supported).
-sb defines the selected background color

directamente no terminal
dmenu_run -m dmenumon -fn dmenufont -nb "#4d4d4d" -nf "#07AE06" -sb "#07AE06" -sf "#060606"

dmenu_run -m dmenumon -fn "monospace:size=12" -nb "#4d4d4d" -nf "#07AE06" -sb "#07AE06" -sf "#060606"
dmenu_run -m "0" -fn "hack:size=11" -nb "#000000" -nf "#07AE06" -sb "#07AE06" -sf "#060606"

SHCMD('dmenu_run -m "0" -fn "monospace:size=11" -nb "#col_black" -nf "#col_green" -sb "#col_green" -sf "#col_gray5"')  },

static const char *termcmd[]  		= { "alacritty", NULL };
static const char *fileterminal[]  	= { "alacritty", "-e", "lf", NULL };
static const char *editorcmd[]  	= { "xed", NULL };
//static const char *webcmd[]  		= { "firefox", NULL };
static const char *monitors[]  		= { "arandr", NULL };
static const char *filecmd[]  		= { "thunar", NULL };
static const char *printscreen[]  	= { "flameshot", "gui", NULL, NULL };
static const char *app_finder[]  	= { "xfce4-appfinder", NULL };
static const char *app_pdf[]  		= { "evince", NULL };
static const char *office[]  		= { "libreoffice", NULL };
static const char *calendar[]  		= { "gsimplecal", NULL };
static const char *taskmanager[]  	= { "alacritty", "-e", "htop", NULL };

//static const char *light_inc[]  		= { "xbacklight", "-inc", "5", NULL };  //nao detecta monitor
//static const char *light_dec[]  		= { "xbacklight", "-dec", "5", NULL };

static const char *light_inc[]  		= { "xlight", "-A", "5", NULL };  
static const char *light_dec[]  		= { "xlight", "-U", "5", NULL };  

// AUDIO 
static const char *alsa_Audioup[]  		= { "amixer", "-c", "0", "set", "Master","2+", NULL };
static const char *alsa_Audiodown[]  	= { "amixer", "-c", "0", "set", "Master","2-", NULL };
static const char *pipewire_Audioup[]  		= { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%", NULL };
static const char *pipewire_Audiodown[]  	= { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%", NULL };

static const char *Audioup[]  				= { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%", NULL };
static const char *Audiodown[]  			= { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%", NULL };


static const char *Touchpadtoggle[]  		= { "sh", "-c", "~/my_configs/scripts/toggletouchpad.sh", NULL };
static const char *turnoffscreens[]  		= { "xset", "dpms", "force", "off", NULL };
*/


/*+
	
https://dev.to/wallclocks/x11-special-keyboard-keys-for-window-managers-4no2
xbacklight -inc -20
{ 0,                            XF86XK_MonBrightnessUp,     spawn,      {.v = inclight } },
{ 0,                            XF86XK_MonBrightnessDown,   spawn,      {.v = declight } 

list de  XF86XK  /usr/include/X11/XF86keysym.h
*/

//   /usr/include/X11/XF86keysym.h

/*   xrandr --output HDMI1 --brightness 0.5
showkey -a

xmodmap -pk | grep PowerOff
evtest    https://unix.stackexchange.com/questions/130656/how-to-get-all-my-keys-to-send-keycodes
xev

*/

#include <X11/XF86keysym.h> // to use XF86XK_TouchpadToggle

static const Key keys[] = {

	/************** FN keys - HP AERO *******************/
	//{ 0, XF86XK ,	spawn,		SHCMD("xset dpms force off") },
	/*FN+F1 */   { WIN_KEY, XK_F1 ,	            spawn,		SHCMD("xset dpms force off") },            
	/*FN+F2 */   { 0, XF86XK_MonBrightnessDown ,spawn,		SHCMD("light -U 5") },
	/*FN+F3 */   { 0, XF86XK_MonBrightnessUp ,	spawn,		SHCMD("light -A 5") },
	/*FN+F4 */     // Keyboard back light
	/*FN+F5 */   { 0, XF86XK_AudioMute,		    spawn,		SHCMD("pactl set-sink-mute @DEFAULT_SINK@ toggle")  },
	/*FN+F6 */   { 0, XF86XK_AudioRaiseVolume,	spawn,		SHCMD("pactl set-sink-volume @DEFAULT_SINK@ +5%") },
	/*FN+F7 */   { 0, XF86XK_AudioLowerVolume,	spawn,		SHCMD("pactl set-sink-volume @DEFAULT_SINK@ -5%") },
	/*FN+F8 */   { 0, XF86XK_AudioPrev ,	    spawn,		SHCMD("xset dpms force off") },
	/*FN+F9 */   { 0, XF86XK_AudioPlay ,	    spawn,		SHCMD("xset dpms force off") },
	/*FN+F10*/   { 0, XF86XK_AudioNext ,	    spawn,		SHCMD("xset dpms force off") },
	/*FN+F11*/   { WIN_KEY, XK_p,	            spawn,		SHCMD("xset dpms force off") },      // monitor ?? / touchpad ?? Symbol ->
	/*FN+F12*/   { 0, XK_Insert, 				spawn,      SHCMD("xset dpms force off") },
	/*prt sc*/	 { 0, XK_Print, 				spawn,      SHCMD("flameshot gui") },
	/* ⏻ */	     { 0, XF86XK_PowerOff,	        spawn,		SHCMD("xset dpms force off") },  // NÂO funciona


	/************** DWM or patched *******************/

	/* modifier                    	key        					function        argument */
	//{ 0,      					XF86XK_TouchpadToggle , 	spawn,          {.v = Touchpadtoggle } },  // this file uses dunst to notifi
	//{ 0,      					XF86XK_TouchpadToggle , 	spawn,          SHCMD("(synclient | grep 'TouchpadOff.*1' && synclient TouchpadOff=0) || synclient TouchpadOff=1") },



	/* togglescratch */
	/* modifier                 key        		function        	argument */
	{ WIN_KEY,            		XK_s,  	   		togglescratch,  	{.ui = 0 } },
	{ WIN_KEY,            		XK_d,	   		togglescratch,  	{.ui = 1 } },
	{ WIN_KEY,            		XK_c,	   		togglescratch,  	{.ui = 2 } },
	//{ WIN_KEY,            		XK_w,	   		togglescratch,  		{.ui = 3 } },	 não funciona para o firefox
	{ WIN_KEY,            		XK_z,	   		togglescratch,  	{.ui = 4 } },	// 
	{ WIN_KEY,            		XK_h,	   		togglescratch,  	{.ui = 5 } },	// htop



	/* modifier                     key        		function        argument */
	//https://www.fosslinux.com/20109/7-best-ways-to-kill-unresponsive-programs-in-linux.htm
	//https://superuser.com/questions/757160/kill-the-currently-active-window-with-a-keyboard-shortcut
	{ MODKEY,					XK_F4,  		spawn,   			SHCMD("xdotool getwindowfocus windowkill") }, // KILL current window
	{ MODKEY,					XK_F5,  		spawn,   			SHCMD("xkill") }, // KILL selected window with mouse

	{ WIN_KEY,             		XK_f,      		togglefullscr,  	{0} },  // from patch
	{ WIN_KEY,					XK_q, 			killclient,     	{0} },
	{ WIN_KEY,                  XK_b,      		togglebar,     		{0} },
	{ MODKEY,					XK_comma,  		cyclelayout,    	{.i = -1 } },
	{ MODKEY,           		XK_space, 		cyclelayout,    	{.i = +1 } },
	//{ MODKEY,                   XK_p,      		spawn,          	{.v = dmenucmd } },
	//{ MODKEY|ShiftMask,      	XK_Return, 		spawn,          	{.v = termcmd } },
	{ MODKEY,                   XK_j,      		focusstack,     	{.i = +1 } },
	{ MODKEY,                   XK_k,      		focusstack,     	{.i = -1 } },
	{ MODKEY,                   XK_i,     		incnmaster,    		{.i = +1 } },
	{ MODKEY,                   XK_d,      		incnmaster,     	{.i = -1 } },
	{ MODKEY,                   XK_h,      		setmfact,       	{.f = -0.05} },
	{ MODKEY,                   XK_l,      		setmfact,       	{.f = +0.05} },
	{ MODKEY,                   XK_Return, 		zoom,           	{0} },
	{ MODKEY,                   XK_Tab,    		view,           	{0} },
	{ MODKEY|ShiftMask,      	XK_c,      		killclient,     	{0} },
	{ MODKEY,                   XK_t,      		setlayout,     		{.v = &layouts[0]} },
	{ MODKEY,                   XK_f,      		setlayout,      	{.v = &layouts[1]} },
	{ MODKEY,                   XK_m,      		setlayout,      	{.v = &layouts[2]} },
	{ MODKEY,                   XK_space,  		setlayout,      	{0} },
	{ MODKEY|ShiftMask,      	XK_space,  		togglefloating, 	{0} },
	{ MODKEY,                   XK_0,      		view,           	{.ui = ~0 } },
	{ MODKEY|ShiftMask,      	XK_0,      		tag,            	{.ui = ~0 } },
	{ MODKEY,                   XK_comma,  		focusmon,       	{.i = -1 } },
	{ MODKEY,                   XK_period, 		focusmon,       	{.i = +1 } },
	{ MODKEY|ShiftMask,     	XK_comma,  		tagmon,         	{.i = -1 } },
	{ MODKEY|ShiftMask,     	XK_period, 		tagmon,         	{.i = +1 } },	// move windows to another monitor
	TAGKEYS(                    XK_1,                     			0)
	TAGKEYS(                    XK_2,                      			1)
	TAGKEYS(                    XK_3,                      			2)
	TAGKEYS(                    XK_4,                      			3)
	TAGKEYS(                    XK_5,                      			4)
	TAGKEYS(                    XK_6,                      			5)
	TAGKEYS(                    XK_7,                      			6)
	TAGKEYS(                    XK_8,                      			7)
	TAGKEYS(                    XK_9,                      			8)
	{ MODKEY|ShiftMask,         XK_q,      		quit,           	{0} },  // restart DWM



	/************** Comands + keys *******************/
	{ WIN_KEY,      			XK_Return, 		spawn,          		SHCMD("alacritty") },
	//{ WIN_KEY,      			XK_a, 			spawn,          		{.v = dmenucmd } },
	{ WIN_KEY,      			XK_a, 			spawn,          		SHCMD("sh ~/.config/dwm/dmenu_favoritos.sh") },
	{ WIN_KEY,      			XK_v, 			spawn,          		SHCMD("alacritty -e sh ~/.local/bin/lfub") },
																		// com o SHCMD só aparece no munitor 1
	//{ WIN_KEY,      			XK_a, 			spawn,          		SHCMD("dmenu_run -i -m '0' -fn monospace:size=11 -nb '#000000' -nf '#07AE06' -sb '#07AE06' -sf '#060606'")  },
	{ WIN_KEY|ShiftMask,      	XK_a, 			spawn,          		SHCMD("xfce4-appfinder") },
	{ WIN_KEY,      			XK_t, 			spawn,          		SHCMD("thunar") },
	{ WIN_KEY,      			XK_o, 			spawn,          		SHCMD("libreoffice : evince") },
	{ WIN_KEY,      			XK_m, 			spawn,          		SHCMD("arandr") },

	//{ WIN_KEY,      			XK_e, 			spawn,          		SHCMD("xed") },   // EDITOR
	//{ WIN_KEY,      			XK_KP_Enter, 	spawn,          		{.v = termcmd } },
	//{ WIN_KEY,      			XK_Return, 		spawn,          		{.v = termcmd } },
	//{ WIN_KEY,      			XK_w, 			spawn,          		{.v = webcmd } },
};

/* button definitions
 click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin 
Clicar na Barra de tarefas e SystemTray 
 Rato esquerdo = Button1
 Rato centro = Button2
 Rato direito = Button3
 scroll cima= button4
 scroll baixo = button5
 
ClkTagBar= bar:indicadores dos workspaces
ClkLtSymbol= bar
ClkStatusText=   bar:Zona onde mostra o CPU, RAM, DATA, HORAS
ClkWinTitle=  	 bar: Windows Titles

ClkClientWin= 	Windows 
ClkRootWin=
*/
static const Button buttons[] = {
/* new  */

	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {.v = &layouts[2]} },
	{ ClkLtSymbol,          0,              Button4,        cyclelayout,    {.i = -1 }  },
	{ ClkLtSymbol,          0,              Button5,        cyclelayout,    {.i = +1 }  },


	/* click                event mask      button          function        argument */
	{ ClkWinTitle,          0,              Button1,        zoom,           {0} },  // altera entrea APP actual e ultima usada
	{ ClkWinTitle,          0,              Button4,        focusstack,     {.i = -1 } },
	{ ClkWinTitle,          0,              Button5,        focusstack,     {.i = +1 } },


// clicar no system Tray : 
	/* click                event mask      button          function        argument */
	//{ ClkStatusText,        0,              Button1,        spawn,          {.v = taskmanager } }, //
	{ ClkStatusText,        0,              Button1,        spawn,          SHCMD("alacritty -e htop") },
	{ ClkStatusText,        0,              Button2,        spawn,          SHCMD("thunar") },
	{ ClkStatusText,        0,              Button3,        spawn,          SHCMD("gsimplecal") },
	{ ClkStatusText,        0,              Button5,        spawn,          SHCMD("pactl set-sink-volume @DEFAULT_SINK@ -5%") },
	{ ClkStatusText,        0,              Button4,        spawn,          SHCMD("pactl set-sink-volume @DEFAULT_SINK@ +5%") },
	{ ClkStatusText,        WIN_KEY,        Button5,        spawn,          SHCMD("light -U 5") },
	{ ClkStatusText,        WIN_KEY,        Button4,        spawn,          SHCMD("light -A 5") },


// Nas janelas: 
/* click                	event mask      button         function        	argument */
	{ ClkClientWin,         WIN_KEY,        Button1,       movemouse,      	{0} },
	{ ClkClientWin,         WIN_KEY,        Button2,       togglefloating, 	{0} }, // FLOATING TO TILE
	{ ClkClientWin,         WIN_KEY,        Button3,       resizemouse,    	{0} },
	{ ClkClientWin,	  		WIN_KEY,	   	Button4,       focusstack,     	{.i = -1  }  }, 


// nos indicadores dos workspaces
	/* click                event mask      button          function        argument */
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },  // mostra tambem os outros workspaces
	{ ClkTagBar,            WIN_KEY,        Button1,        tag,            {0} },
	{ ClkTagBar,            WIN_KEY,        Button3,        toggletag,      {0} },
	//{ ClkTagBar,          	0,              Button4,        shiftview,      {.i =  -1 } },
	//{ ClkTagBar,          	0,              Button5,        shiftview,      {.i =  +1 } },


};


/*

Exemplos
{ 0, XF86XK_AudioMute,			spawn,		SHCMD("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle; kill -44 $(pidof dwmblocks)") },
{ 0, XF86XK_AudioRaiseVolume,	spawn,		SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%+; kill -44 $(pidof dwmblocks)") },
{ 0, XF86XK_AudioLowerVolume,	spawn,		SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-; kill -44 $(pidof dwmblocks)") },
{ 0, XF86XK_AudioPrev,			spawn,		{.v = (const char*[]){ "mpc", "prev", NULL } } },
{ 0, XF86XK_AudioNext,			spawn,		{.v = (const char*[]){ "mpc",  "next", NULL } } },
{ 0, XF86XK_AudioPause,			spawn,		{.v = (const char*[]){ "mpc", "pause", NULL } } },
{ 0, XF86XK_AudioPlay,			spawn,		{.v = (const char*[]){ "mpc", "play", NULL } } },
{ 0, XF86XK_AudioStop,			spawn,		{.v = (const char*[]){ "mpc", "stop", NULL } } },
{ 0, XF86XK_AudioRewind,		spawn,		{.v = (const char*[]){ "mpc", "seek", "-10", NULL } } },
{ 0, XF86XK_AudioForward,		spawn,		{.v = (const char*[]){ "mpc", "seek", "+10", NULL } } },
{ 0, XF86XK_AudioMedia,			spawn,		{.v = (const char*[]){ TERMINAL, "-e", "ncmpcpp", NULL } } },
{ 0, XF86XK_AudioMicMute,		spawn,		SHCMD("pactl set-source-mute @DEFAULT_SOURCE@ toggle") },
{ 0, XF86XK_PowerOff,			spawn,		{.v = (const char*[]){ "sysact", NULL } } }, 
{ 0, XF86XK_Calculator,			spawn,		{.v = (const char*[]){ TERMINAL, "-e", "bc", "-l", NULL } } },
{ 0, XF86XK_Sleep,				spawn,		{.v = (const char*[]){ "sudo", "-A", "zzz", NULL } } },
{ 0, XF86XK_WWW,				spawn,		{.v = (const char*[]){ BROWSER, NULL } } },
{ 0, XF86XK_DOS,				spawn,		{.v = termcmd } },
{ 0, XF86XK_ScreenSaver,		spawn,		SHCMD("slock & xset dpms force off; mpc pause; pauseallmpv") },
{ 0, XF86XK_TaskPane,			spawn,		{.v = (const char*[]){ TERMINAL, "-e", "htop", NULL } } },
{ 0, XF86XK_Mail,				spawn,		SHCMD(TERMINAL " -e neomutt ; pkill -RTMIN+12 dwmblocks") },
{ 0, XF86XK_MyComputer,			spawn,		{.v = (const char*[]){ TERMINAL, "-e",  "lfub",  "/", NULL } } },
{ 0, XF86XK_Battery,			spawn,		SHCMD("") }, 
{ 0, XF86XK_Launch1,			spawn,		{.v = (const char*[]){ "xset", "dpms", "force", "off", NULL } } },
{ 0, XF86XK_TouchpadToggle,		spawn,		SHCMD("(synclient | grep 'TouchpadOff.*1' && synclient TouchpadOff=0) || synclient TouchpadOff=1") },
{ 0, XF86XK_TouchpadOff,		spawn,		{.v = (const char*[]){ "synclient", "TouchpadOff=1", NULL } } },
{ 0, XF86XK_TouchpadOn,			spawn,		{.v = (const char*[]){ "synclient", "TouchpadOff=0", NULL } } },
{ 0, XF86XK_MonBrightnessUp,	spawn,		{.v = (const char*[]){ "xbacklight", "-inc", "15", NULL } } },
{ 0, XF86XK_MonBrightnessDown,	spawn,		{.v = (const char*[]){ "xbacklight", "-dec", "15", NULL } } },



*/
