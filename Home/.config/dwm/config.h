/*
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


/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  	 = 1;       /* border pixel of windows */
static const unsigned int snap      	 = 25;      /* snap pixel */
static const unsigned int systraypinning = 0;   	/* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft  = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 1;   	/* systray spacing */
static const int systraypinningfailfirst = 1;   	/* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;    	 	/* 0 means no systray */
static const int showbar            = 1;       	 	/* 0 means no bar */
static const int topbar             = 1;        	/* 0 means bottom bar */
static const int user_bh            = 1;        	/* 2 is the default spacing around the bar's font */
//static const char *fonts[]          = { "Noto Sans Mono:size=10" };
static const char *fonts[]          = { "monospace:size=10", "Symbols Nerd Font:antialias=true:autohint=true"  };

static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#4d4d4d";
static const char col_gray2[]       = "#666666";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_gray5[]       = "#060606";
static const char col_cyan[]        = "#005577";
static const char col_green[]       = "#07AE06";
static const char col_dark_green[]       = "#153715"; //
static const char col_red[]       = "#ff0000";
static const char col_black[]       = "#000000";
static const char *colors[][3]      = {
			/*               fg         bg         border   */
			
	/*[SchemeNorm] = { A, B, C }, 
		A = cor do TEXTO do que NÂO está activo : workspaces não selecionados e slstatus
		B=  cor do FUNDO do que NÂO está activo : workspaces não selecionados e slstatus
		C = Cor da borda das janelas que não está em foco
	*/
	[SchemeNorm] = { col_green, col_black, col_gray5 },
	
	/*[SchemeSel]  = {A , B,  C  }, 
		A = Cor texto em Focus e cor texto da designação das janelas
		B = Cor Fundo worksapce em focus e cor fundo da designação das janelas
		C = Cor da borda das janelas que estão em foco
	*/	
	[SchemeSel]  = { col_green , col_dark_green,  col_green  },
	
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;


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

// o tamnho definido no alacritty_dwm_scratchpad.yml depende da resolução do ecrã
const char *spcmd1[] = {"alacritty", "--class", "spterm", "--config-file", "/home/lpt/.config/alacritty/alacritty_dwm_scratchpad.yml",NULL, NULL,NULL};
const char *spcmd2[] = {"alacritty", "--class", "spfm", "--config-file", "/home/lpt/.config/alacritty/alacritty_dwm_scratchpad.yml","-e", "lf",NULL};

const char *spcmd3[] = {"thunar", NULL }; // estava thunar
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spranger",    spcmd2},
	{"thunar",   	spcmd3},
};




/******************** Autostart  
 * Everything to start after DWM is in ~/.config/dwm/dwm_cool_autostart.sh file
*/
static const char *const autostart[] = {
//	"st", NULL,
	"sh", "-c", "~/.config/dwm/dwm_cool_autostart.sh",
	NULL /* terminate */
};

/*
static const char *const autostart[] = {
	"mpd-notification", NULL,
	"hsetroot", "-center", "/usr/home/bit6tream/pic/wallapper.png", NULL,
	"xrdb", "/usr/home/bit6tream/.config/X/Xresources", NULL,
	"sh", "-c", "while :; do dwmstatus.sh -; sleep 60; done", NULL,
	"dunst", NULL,
	"picom", NULL,
	"bash", "-c", "~/.febg"
	"bash", "-c", "~/.scrits../xpto.sh"
	NULL
};

*/


/* tagging : https://www.unicode.org/charts/PDF/U260
0.pdf */ 
static const char *tags[] = { "1", "", "3", "", "5", ""};

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
	 * monitor: "-1"= actual monitor ; "1"=VGA1 caso esteja ligado
	 */
	 
	 //multiple scratchpads
	/* class      					instance    		title       tags mask    		isfloating   	monitor */
	{ NULL,		  					"spterm",			NULL,		SPTAG(0),			1,			 	-1 },
	{ NULL,		  					"spfm",				NULL,		SPTAG(1),			1,			 	-1 },
	{ NULL,		  					"thunar",			NULL,		SPTAG(2),			0,			 	-1 },

		/* class                    instance   			title      	tags mask      i	sfloating   	monitor */

// Actual workspace
	/* class                      	instance    		title      	Tags mask     		isfloating   	monitor */
	{ "Galculator", 				NULL,      			NULL,  		0,            		1,           	-1 },
	{ NULL, 		   	   			"xfce4-appfinder", 	NULL,   	0,           		1,           	-1 },
	{ "Arandr", 			   		NULL,      			NULL,  		0,            		1,           	-1 },
	{ "Gimp",                      	NULL,       		NULL,      	1,            		0,           	1 },
	{ "Xfce4-terminal",            	NULL,       		NULL,      	0,            		1,           	-1 },
	{ "Arcolinux-welcome-app.py",  	NULL,       		NULL,      	0,           		1,           	-1 },
	{ "Arcolinux-calamares-tool.py",NULL,    			NULL,      	0,            		1,           	-1 },	
	{ "resistor_decoder",  			NULL,    			NULL,      	0,            		1,           	-1 },	
	{ "pixeltomatrix.exe",  		NULL,    			NULL,      	0,            		1,           	-1 },
	{ "pavucontrol",  				NULL,    			NULL,      	0,            		1,           	-1 },
// Workspace 1
	/* class                       	instance    		title      	tags mask     		isfloating  	monitor */
	{ NULL, 		   				"code",    			NULL,  	   	1,            		0,           	-1 },
	{ "code",						NULL, 	   			NULL,  	   	1,            		0,           	-1 },

	
// Workspace 2
	/* class                       	instance    	title     		tags mask     		isfloating   	monitor */
	{ "firefox",                   	NULL,       	NULL,     		1 << 1,       		0,           	-1 },
	{ "Firefox",                   	NULL,       	NULL,      		1 << 1,       		0,           	-1 },
// Workspace 3
	/* class       					instance    	title     		tags mask     		isfloating  	 monitor */
	{ "thunar", 					NULL,    		NULL,      		1 << 2,       		0,           	-1 },
	{ "Thunar", 					NULL,    		NULL,      		1 << 2,       		0,           	-1 },
	{ "Nemo", 						NULL,    		NULL,     		1 << 2,       		0,          	-1 },	
	{ "lf", 						NULL,    		NULL,      		1 << 2,       		0,           	-1 },	
	//{ NULL, 						"Nemo",    		NULL,      		1 << 2,       		0,           	-1 },
// Workspace 4
	/* class                    	instance    t	Title      		tags mask     		isfloating   	monitor */
	{ NULL, 		   				"libreoffice",  NULL,     		1 << 3,      		0,           	-1 },
	{ "libreoffice", 		   		"libreoffice",  NULL,      		1 << 3,       		0,           	-1 },
	
	//voidlinux:
	{NULL , 		   				NULL, 			"libreoffice",  1 << 3,      		 0,           	-1 },

// Workspace 5
	{ NULL, 		   				"evince",    	NULL,      		1 << 4,      		 0,           	-1 },	

// Workspace 6
	{ "Steam", 		   				NULL,    		NULL,      		1 << 5,       		0,           	-1 },
	{ NULL, 		   				"Steam",    	NULL,      		1 << 5,       		0,           	-1 },
	{ NULL, 		   				NULL,    		"Steam",   		1 << 5,      		0,           	-1 },	
	{ "Lutris", 		   			NULL,    		NULL,      		1 << 5,       		0,           	-1 },


};

/* layout(s) */
static const float mfact    	= 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster    	= 1;    /* number of clients in master area */
static const int resizehints 	= 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

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
#define WIN_KEY Mod4Mask   // SUPER
#define MODKEY Mod1Mask   // left ALT

#define TAGKEYS(KEY,TAG) \
	{ WIN_KEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ WIN_KEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ WIN_KEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ WIN_KEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },



/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */

static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */

//																	"-nb", cor fundo, "-nf", cor_texto,"-sb", cor_Selecção 
//static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };																	
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_green, "-sb", col_green, "-sf", col_gray5, NULL };


static const char *termcmd[]  		= { "alacritty", NULL };
static const char *fileterminal[]  		= { "alacritty", "-e", "lf", NULL };
static const char *editorcmd[]  		= { "gedit", NULL };
static const char *webcmd[]  		= { "firefox", NULL };
static const char *monitors[]  		= { "arandr", NULL };
static const char *filecmd[]  		= { "thunar", NULL };
static const char *printscreen[]  		= { "flameshot", "gui", NULL, NULL };
static const char *app_finder[]  		= { "xfce4-appfinder", NULL };
static const char *app_pdf[]  		= { "evince", NULL };
static const char *office[]  			= { "libreoffice", NULL };
static const char *calendar[]  		= { "gsimplecal", NULL };
static const char *taskmanager[]  	= { "alacritty", "-e", "htop", NULL };

static const char *light_inc[]  		= { "xbacklight", "-inc", "5", NULL };
static const char *light_dec[]  		= { "xbacklight", "-dec", "5", NULL };
static const char *Audioup[]  		= { "amixer", "-c", "0", "set", "Master","2+", NULL };
static const char *Audiodown[]  		= { "amixer", "-c", "0", "set", "Master","2-", NULL };
static const char *Touchpadtoggle[]  	= { "sh", "-c", "~/my_configs/scripts/toggletouchpad.sh", NULL };
static const char *turnoffscreens[]  	= { "xset", "dpms", "force", "off", NULL };



/*
	
	
https://dev.to/wallclocks/x11-special-keyboard-keys-for-window-managers-4no2

xbacklight -inc -20
{ 0,                            XF86XK_MonBrightnessUp,     spawn,      {.v = inclight } },
{ 0,                            XF86XK_MonBrightnessDown,   spawn,      {.v = declight } 


list de  XF86XK  /usr/include/X11/XF86keysym.h
*/




#include <X11/XF86keysym.h> // to use XF86XK_TouchpadToggle


static const Key keys[] = {

	/* FN keys */
	/* modifier                    	key        					function        argument */
	{ 0,      					XF86XK_TouchpadToggle , 	    spawn,          {.v = Touchpadtoggle } },  // this file uses dunst to notifi
	//{ 0,      					XF86XK_TouchpadToggle , 	    spawn,          SHCMD("(synclient | grep 'TouchpadOff.*1' && synclient TouchpadOff=0) || synclient TouchpadOff=1") },


	{ 0,      					XF86XK_ScreenSaver , 	     	spawn,          {.v = turnoffscreens } },
	{ 0,      					XK_Print, 						spawn,          {.v = printscreen } },	



	/* togglescratch */
	/* modifier                 key        		function        			argument */
	{ WIN_KEY,            		XK_s,  	   		togglescratch,  		{.ui = 0 } },
	{ WIN_KEY,            		XK_d,	   		togglescratch,  		{.ui = 1 } },
	{ WIN_KEY,            		XK_c,	   		togglescratch,  		{.ui = 2 } },	
	
	{ WIN_KEY,             		XK_f,      		togglefullscr,  		{0} },
	
	{ WIN_KEY,      			XK_a, 			spawn,          		{.v = dmenucmd } },
	{ WIN_KEY|ShiftMask,      			XK_a, 			spawn,          		{.v = app_finder } },
	
	{ WIN_KEY,                  XK_b,      		togglebar,     			{0} },
	{ WIN_KEY,      			XK_e, 			spawn,          		{.v = editorcmd } },
	{ WIN_KEY,      			XK_t, 			spawn,          		{.v = filecmd } },
	//{ WIN_KEY,      			XK_d, 			spawn,          		{.v = fileterminal } },
	
	//{ WIN_KEY,      			XK_KP_Enter, 	spawn,          		{.v = termcmd } },
	{ WIN_KEY,      			XK_Return, 		spawn,          		{.v = termcmd } },
	{ WIN_KEY,      			XK_w, 			spawn,          		{.v = webcmd } },
	
	{ WIN_KEY,      			XK_m, 			spawn,          		{.v = monitors } },
	
	
	{ WIN_KEY,      			XK_o, 			spawn,          		{.v = office } },	
	{ WIN_KEY,      			XK_p, 			spawn,          		{.v = app_pdf } },
	{ WIN_KEY,					XK_q, 			killclient,     		{0} },
	
	

	{ MODKEY,					XK_comma,  		cyclelayout,    		{.i = -1 } },
	{ MODKEY,           		XK_space, 		cyclelayout,    		{.i = +1 } },
	
	
	
/* OLDS*/
	/* modifier                     key        		function        	argument */
	{ MODKEY,                       XK_p,      		spawn,          	{.v = dmenucmd } },
	{ MODKEY|ShiftMask,      		XK_Return, 		spawn,          	{.v = termcmd } },
	
	{ MODKEY,                       XK_j,      		focusstack,     	{.i = +1 } },
	{ MODKEY,                       XK_k,      		focusstack,     	{.i = -1 } },
	{ MODKEY,                       XK_i,     		incnmaster,    		{.i = +1 } },
	{ MODKEY,                       XK_d,      		incnmaster,     	{.i = -1 } },
	{ MODKEY,                       XK_h,      		setmfact,       	{.f = -0.05} },
	{ MODKEY,                       XK_l,      		setmfact,       	{.f = +0.05} },
	{ MODKEY,                       XK_Return, 		zoom,           	{0} },
	{ MODKEY,                       XK_Tab,    		view,           	{0} },
	{ MODKEY|ShiftMask,      		XK_c,      		killclient,     	{0} },
	{ MODKEY,                       XK_t,      		setlayout,     		{.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      		setlayout,      	{.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      		setlayout,      	{.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  		setlayout,      	{0} },
	{ MODKEY|ShiftMask,      		XK_space,  		togglefloating, 	{0} },
	{ MODKEY,                       XK_0,      		view,           	{.ui = ~0 } },
	{ MODKEY|ShiftMask,      		XK_0,      		tag,            	{.ui = ~0 } },
	{ MODKEY,                       XK_comma,  		focusmon,       	{.i = -1 } },
	{ MODKEY,                       XK_period, 		focusmon,       	{.i = +1 } },
	{ MODKEY|ShiftMask,      		XK_comma,  		tagmon,         	{.i = -1 } },
	{ MODKEY|ShiftMask,     		XK_period, 		tagmon,         	{.i = +1 } },
	TAGKEYS(                        XK_1,                     			0)
	TAGKEYS(                        XK_2,                      			1)
	TAGKEYS(                        XK_3,                      			2)
	TAGKEYS(                        XK_4,                      			3)
	TAGKEYS(                        XK_5,                      			4)
	TAGKEYS(                        XK_6,                      			5)
	TAGKEYS(                        XK_7,                      			6)
	TAGKEYS(                        XK_8,                      			7)
	TAGKEYS(                        XK_9,                      			8)
	{ MODKEY|ShiftMask,     		XK_q,      		quit,           	{0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
/* Clicar na Barra de tarefas e SystemTray 
 Rato esquerdo = Button1
 Rato centro = Button2
 Rato direito = Button3
 scroll cima= button4
 scroll baixo = button5
*/
/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin 
ClkTagBar= bar:indicadores dos workspaces
ClkLtSymbol=
ClkStatusText=   bar:Zona onde mostra o CPU, RAM, DATA, HORAS
ClkWinTitle=  bar: titulo da janela
ClkClientWin= Janelas 
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
	{ ClkStatusText,        0,              Button1,        spawn,          {.v = taskmanager } },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = filecmd } },
	{ ClkStatusText,        0,              Button3,        spawn,          {.v = calendar } },
	{ ClkStatusText,        0,              Button5,        spawn,          {.v = Audiodown } },
	{ ClkStatusText,        0,              Button4,        spawn,          {.v = Audioup } },

	{ ClkStatusText,        WIN_KEY,        Button5,        spawn,          {.v = light_dec } },
	{ ClkStatusText,        WIN_KEY,        Button4,        spawn,          {.v = light_inc } },




// Nas janelas: 
/* click                	event mask      button         function        argument */
	{ ClkClientWin,         WIN_KEY,        Button1,       movemouse,      {0} },
	{ ClkClientWin,         WIN_KEY,        Button2,       togglefloating, {0} }, // FLOATING TO TILE
	{ ClkClientWin,         WIN_KEY,        Button3,       resizemouse,    {0} },
	{ ClkClientWin,	  		WIN_KEY,	   	Button4,       focusstack,     {.i = -1  }  }, 


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


{ 0, XF86XK_AudioMute,		spawn,		SHCMD("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle; kill -44 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioRaiseVolume,	spawn,		SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%+; kill -44 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioLowerVolume,	spawn,		SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-; kill -44 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioPrev,		spawn,		{.v = (const char*[]){ "mpc", "prev", NULL } } },
	{ 0, XF86XK_AudioNext,		spawn,		{.v = (const char*[]){ "mpc",  "next", NULL } } },
	{ 0, XF86XK_AudioPause,		spawn,		{.v = (const char*[]){ "mpc", "pause", NULL } } },
	{ 0, XF86XK_AudioPlay,		spawn,		{.v = (const char*[]){ "mpc", "play", NULL } } },
	{ 0, XF86XK_AudioStop,		spawn,		{.v = (const char*[]){ "mpc", "stop", NULL } } },
	{ 0, XF86XK_AudioRewind,	spawn,		{.v = (const char*[]){ "mpc", "seek", "-10", NULL } } },
	{ 0, XF86XK_AudioForward,	spawn,		{.v = (const char*[]){ "mpc", "seek", "+10", NULL } } },
	{ 0, XF86XK_AudioMedia,		spawn,		{.v = (const char*[]){ TERMINAL, "-e", "ncmpcpp", NULL } } },
	{ 0, XF86XK_AudioMicMute,	spawn,		SHCMD("pactl set-source-mute @DEFAULT_SOURCE@ toggle") },
	{ 0, XF86XK_PowerOff,		spawn,		{.v = (const char*[]){ "sysact", NULL } } }, 
	{ 0, XF86XK_Calculator,		spawn,		{.v = (const char*[]){ TERMINAL, "-e", "bc", "-l", NULL } } },
	{ 0, XF86XK_Sleep,		spawn,		{.v = (const char*[]){ "sudo", "-A", "zzz", NULL } } },
	{ 0, XF86XK_WWW,		spawn,		{.v = (const char*[]){ BROWSER, NULL } } },
	{ 0, XF86XK_DOS,		spawn,		{.v = termcmd } },
	{ 0, XF86XK_ScreenSaver,	spawn,		SHCMD("slock & xset dpms force off; mpc pause; pauseallmpv") },
	{ 0, XF86XK_TaskPane,		spawn,		{.v = (const char*[]){ TERMINAL, "-e", "htop", NULL } } },
	{ 0, XF86XK_Mail,		spawn,		SHCMD(TERMINAL " -e neomutt ; pkill -RTMIN+12 dwmblocks") },
	{ 0, XF86XK_MyComputer,		spawn,		{.v = (const char*[]){ TERMINAL, "-e",  "lfub",  "/", NULL } } },
	{ 0, XF86XK_Battery,		spawn,		SHCMD("") }, 
	{ 0, XF86XK_Launch1,		spawn,		{.v = (const char*[]){ "xset", "dpms", "force", "off", NULL } } },
	{ 0, XF86XK_TouchpadToggle,	spawn,		SHCMD("(synclient | grep 'TouchpadOff.*1' && synclient TouchpadOff=0) || synclient TouchpadOff=1") },
	{ 0, XF86XK_TouchpadOff,	spawn,		{.v = (const char*[]){ "synclient", "TouchpadOff=1", NULL } } },
	{ 0, XF86XK_TouchpadOn,		spawn,		{.v = (const char*[]){ "synclient", "TouchpadOff=0", NULL } } },
	{ 0, XF86XK_MonBrightnessUp,	spawn,		{.v = (const char*[]){ "xbacklight", "-inc", "15", NULL } } },
	{ 0, XF86XK_MonBrightnessDown,	spawn,		{.v = (const char*[]){ "xbacklight", "-dec", "15", NULL } } },



*/
