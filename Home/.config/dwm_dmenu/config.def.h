/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */


// mesmas cores do dmwn_run
static const char col_cyan[]        = "#005577";
static const char col_green[]       = "#07AE06";
static const char col_dark_green[]  = "#153715"; //
static const char col_red[]       	= "#ff0000";
static const char col_black[]       = "#000000";


static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {	"hack:size=12" };
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
					/*   fg         bg    */       
	[SchemeNorm] = { col_green, col_black },
	[SchemeSel] = { col_black, col_green  },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";










/*

static const char dmenufont[]       = "hack:size=12";
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


	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel] = { "#eeeeee", "#005577" },
	[SchemeOut] = { "#000000", "#00ffff" },

*/