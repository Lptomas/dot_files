/* ######################################################################################
   IMPORTANTE: Editar SEMPRE este ficheiro (config.def.h) e NÃO o config.h
   O config.h é gerado automaticamente durante a compilação.

   COMPILAR:cd ~/.config/dwm/ && rm -f config.h && sudo make clean install   

   APLICAR UM PATCH:
       patch -p1 < /path/to/patch.diff
       rm -f config.h
       sudo make clean install

   PATCHES INSTALADOS:
       dwm-systray-20210418-67d76bd.diff           -> System tray na barra
       dwm-bar-height-spacing-6.3.diff             -> Controlo da altura da barra
       dwm-scratchpads-20200414-728d397b.diff       -> Janelas flutuantes persistentes (scratchpads)
       dwm-actualfullscreen-20211013-cb3f58a.diff   -> Fullscreen real (não só monocle)
       dwm-gridmode-5.8.2.diff                      -> Layout em grelha (grid)
       dwm-pertag-20200914-61bb8b2.diff             -> Cada tag/workspace guarda o seu próprio layout
       dwm-cyclelayouts-20180524-6.2.diff           -> Ciclar entre layouts com um atalho
       dwm-attachbottom-6.3.diff                    -> Novas janelas abrem no fundo da stack
       dwm-cool-autostart-6.2.diff                  -> Executa script de arranque ao iniciar o DWM
                                                       Ficheiro: ~/.config/dwm/dwm_cool_autostart.sh

   UTILITÁRIOS ÚTEIS:
       xprop       -> Ver propriedades de janelas (class, instance, title) para as Rules
       xkill       -> Matar uma janela clicando nela com o rato
       xev         -> Ver eventos de teclado/rato (para descobrir nomes de teclas)
       xmodmap -pk -> Listar todos os keycodes
       showkey -a  -> Ver keycodes no terminal

######################################################################################*/


/* ============================================================
   APARÊNCIA
   ============================================================ */

static const unsigned int borderpx       = 1;   /* Espessura da borda das janelas em pixels */
static const unsigned int snap           = 25;  /* Distância em pixels para "snap" ao encostar janelas à borda */

/* --- System Tray --- */
static const unsigned int systraypinning    = 0; /* 0 = systray segue o monitor selecionado; >0 = fixa no monitor N */
static const unsigned int systrayonleft     = 0; /* 0 = systray à direita do status text; >0 = à esquerda */
static const unsigned int systrayspacing    = 1; /* Espaço em pixels entre ícones do systray */
static const int systraypinningfailfirst    = 1; /* 1 = se pinning falhar, mostra no 1º monitor; 0 = mostra no último */
static const int showsystray                = 1; /* 0 = esconde o systray */

/* --- Barra --- */
static const int showbar   = 1; /* 0 = esconde a barra */
static const int topbar    = 1; /* 0 = barra em baixo; 1 = barra em cima */
static const int user_bh   = 2; /* Espaço extra (padding) à volta da fonte na barra. 2 = valor padrão */

/* --- Fontes --- */
static const char *fonts[] = {
    "hack:size=12",                                          /* Fonte principal */
    "Symbols Nerd Font:antialias=true:autohint=true"         /* Fonte para ícones/símbolos Nerd Font */
};
static const char dmenufont[] = "hack:size=12";             /* Fonte usada no dmenu */

/* --- Cores --- */
static const char col_gray1[]      = "#4d4d4d";
static const char col_gray2[]      = "#666666";
static const char col_gray3[]      = "#bbbbbb";
static const char col_gray4[]      = "#eeeeee";
static const char col_gray5[]      = "#060606";  /* Quase preto */
static const char col_cyan[]       = "#005577";
static const char col_green[]      = "#07AE06";  /* Verde principal */
static const char col_dark_green[] = "#153715";  /* Verde escuro (fundo do elemento ativo) */
static const char col_red[]        = "#ff0000";
static const char col_black[]      = "#000000";

/*
   Esquema de cores:
   SchemeNorm = elementos NÃO ativos (workspaces não selecionados, slstatus)
   SchemeSel  = elementos ATIVOS (workspace em foco, título da janela ativa)

   { cor_texto, cor_fundo, cor_borda_janela }
*/
static const char *colors[][3] = {
    [SchemeNorm] = { col_green, col_black,      col_gray5      }, /* Texto verde, fundo preto, borda quase preta */
    [SchemeSel]  = { col_green, col_dark_green, col_green      }, /* Texto verde, fundo verde escuro, borda verde */
};


/* ============================================================
   SCRATCHPADS  (patch: dwm-scratchpads)
   Janelas flutuantes persistentes — escondem-se mas não fecham.
   Útil para terminal rápido, gestor de ficheiros, htop, etc.

   Requie
     - Alacritty: usar "--class <nome>" para definir o instance
     - st:        usar "-n <nome>"
   ============================================================ */

typedef struct {
    const char *name;
    const void *cmd;
} Sp;

/* Definição dos comandos de cada scratchpad */

/* Terminal rápido — 120 colunas x 30 linhas */
const char *spcmd1[] = {
    "alacritty", "--class", "spterm",
    "-o", "window.dimensions.columns=120",
    "-o", "window.dimensions.lines=30",
    NULL
};

/* Gestor de ficheiros lf — 160x45 */
/* Void Linux: usa ~/.config/lf/lfub */
const char *spcmd2[] = {
    "alacritty", "--class", "spfm",
    "-o", "window.dimensions.columns=160",
    "-o", "window.dimensions.lines=45",
    "-e", "sh", "-c", "~/.config/lf/lfub",
    NULL
};
/* Arch Linux (alternativa comentada):
const char *spcmd2[] = {
    "alacritty", "--class", "spfm",
    "-o", "window.dimensions.columns=160",
    "-o", "window.dimensions.lines=45",
    "-e", "sh", "-c", "~/.local/bin/lfub",
    NULL
}; */

const char *spcmd3[] = { "thunar", NULL };                          /* Gestor de ficheiros gráfico */
const char *spcmd4[] = { "firefox", "--class", "firefox", NULL };   /* Firefox (não funciona bem como scratchpad) */
const char *spcmd5[] = { "code", NULL };                            /* VS Code */

/* Monitor de sistema htop — 130x35 */
const char *spcmd6[] = {
    "alacritty", "--class", "sphtop",
    "-o", "window.dimensions.columns=130",
    "-o", "window.dimensions.lines=35",
    "-e", "htop",
    NULL
};

/* Tabela de scratchpads: { "nome/instance", comando } */
static Sp scratchpads[] = {
    { "spterm",   spcmd1 },  /* índice 0 -> WIN + s */
    { "spranger", spcmd2 },  /* índice 1 -> WIN + d */
    { "thunar",   spcmd3 },  /* índice 2 -> WIN + c */
    { "firefox",  spcmd4 },  /* índice 3 -> (sem atalho, não funciona) */
    { "code",     spcmd5 },  /* índice 4 -> WIN + z */
    { "sphtop",   spcmd6 },  /* índice 5 -> WIN + h */
};


/* ============================================================
   AUTOSTART  (patch: dwm-cool-autostart)
   Executa um script ao arrancar o DWM.
   Toda a configuração de arranque está em:
       ~/.config/dwm/dwm_cool_autostart.sh
   ============================================================ */

static const char *const autostart[] = {
    "sh", "-c", "~/.config/dwm/dwm_cool_autostart.sh",
    NULL /* obrigatório para terminar o array */
};


/* ============================================================
   TAGS (Workspaces)
   Usa ícones Nerd Font. Referência Unicode: https://www.unicode.org/charts/
   ============================================================ */

static const char *tags[] = {
    "",        /* Tag 1: Browser      (WIN+1) */
    "",        /* Tag 2: Code         (WIN+2) */
    "3",        /* Tag 3: Ficheiros    (WIN+3) */
    "󰈙",        /* Tag 4: Office       (WIN+4) */
    "5",        /* Tag 5: PDF          (WIN+5) */
    "󰊖",        /* Tag 6: Jogos        (WIN+6) */
    "7",        /* Tag 7: Áudio/BT     (WIN+7) */
    "󰢹",        /* Tag 8: Remoto       (WIN+8) */
};


/* ============================================================
   RULES — Regras de atribuição automática de janelas pelas TAG
   Descobrir propriedades: executar "xprop" e clicar na janela
       WM_CLASS(STRING) = instance, class
       WM_NAME(STRING)  = title

   tags mask:   0       = tag atual
                1 << N  = tag N+1 (ex: 1<<0=tag1, 1<<2=tag3)
                ~0      = todas as tags

   isfloating:  0 = tiled  |  1 = floating
   monitor:    -1 = monitor atual  |  0 = primário  |  1 = secundário
   ============================================================ */

static const Rule rules[] = {

    /* --- Scratchpads --- */
    /* class    instance    title    tags mask    isfloating    monitor */
    { NULL,     "spterm",   NULL,    SPTAG(0),    1,            -1 },
    { NULL,     "spfm",     NULL,    SPTAG(1),    1,            -1 },
    { NULL,     "thunar",   NULL,    SPTAG(2),    0,            -1 },
    { NULL,     "firefox",  NULL,    SPTAG(3),    0,            -1 },
    { NULL,     "code",     NULL,    SPTAG(4),    0,            -1 },
    { NULL,     "sphtop",   NULL,    SPTAG(5),    1,            -1 },

    /* --- Janelas Flutuantes Globais (qualquer tag) --- */
    /* class                        instance            title    tags    float    monitor */
    { "Galculator",                 NULL,               NULL,    0,      1,       -1 },
    { NULL,                         "xfce4-appfinder",  NULL,    0,      1,       -1 },
    { "Arandr",                     NULL,               NULL,    0,      1,       -1 },
    { "Xfce4-terminal",             NULL,               NULL,    0,      1,       -1 },
    { "Arcolinux-welcome-app.py",   NULL,               NULL,    0,      1,       -1 },
    { "Arcolinux-calamares-tool.py",NULL,               NULL,    0,      1,       -1 },
    { "resistor_decoder",           NULL,               NULL,    0,      1,       -1 },
    { "pixeltomatrix.exe",          NULL,               NULL,    0,      1,       -1 },
    { "pavucontrol",                NULL,               NULL,    0,      1,       -1 },
    { "float_windows",              NULL,               NULL,    0,      1,       -1 },

    /* --- Firefox Picture-in-Picture ---
       WM_CLASS = "Toolkit", "firefox"
       WM_NAME  = "Picture-in-Picture" ou "Vídeo em janela flutuante" (PT) */
    /* class      instance    title    tags mask    float    monitor */
    { NULL, "Toolkit", "Picture-in-Picture",          0, 1, -1 },
    { NULL, "Toolkit", "Vídeo em janela flutuante",   0, 1, -1 },

    /* --- Gimp (tag 1, tiled) --- */
    /* class      instance    title    tags mask    float    monitor */
    { "Gimp", NULL, NULL, 1, 0, -1 },

    /* ── Tag 1: Browser ── */
    /* class      instance    title    tags mask    float    monitor */
    { "firefox",  NULL,       NULL,    1,           0,       -1 },

    /* ── Tag 2: Editor de Código ── */
    /* class      instance    title    tags mask    float    monitor */
    { NULL,   "code", NULL,   1 << 1,  0,  -1 },
    { "code",  NULL,  NULL,   1 << 1,  0,  -1 },

    /* ── Tag 3: Gestor de Ficheiros ── */
    /* class      instance    title    tags mask    float    monitor */
    { "thunar", NULL, NULL,   1 << 2,  0,  -1 },
    { "Thunar", NULL, NULL,   1 << 2,  0,  -1 },
    { "Nemo",   NULL, NULL,   1 << 2,  0,  -1 },
    { "lf",     NULL, NULL,   1 << 2,  0,  -1 },

    /* ── Tag 4: Office ── */
    /* class      instance    title    tags mask    float    monitor */
    { NULL,               "libreoffice", NULL,          1 << 3, 0, -1 },
    { "libreoffice",      "libreoffice", NULL,          1 << 3, 0, -1 },
    { "libreoffice-writer", NULL,        NULL,          1 << 3, 0, -1 },
    { NULL,               NULL,          "libreoffice", 1 << 3, 0, -1 }, /* Void Linux */

    /* ── Tag 5: PDF ── */
    /* class      instance    title    tags mask    float    monitor */
    { NULL, "evince", NULL,   1 << 4,  0,  -1 },

    /* ── Tag 6: Jogos ── */
    /* class      instance    title    tags mask    float    monitor */
    { "Steam",          NULL,           NULL,             1 << 5, 0, -1 },
    { NULL,             "Steam",        NULL,             1 << 5, 0, -1 },
    { "steamwebhelper", NULL,           NULL,             1 << 5, 0, -1 },
    { NULL,             "steamwebhelper",NULL,            1 << 5, 0, -1 },
    { NULL,             NULL,           "steamwebhelper", 1 << 5, 0, -1 },
    { "Special Offers", NULL,           NULL,             1 << 5, 0, -1 },
    { NULL,             "Special Offers",NULL,            1 << 5, 0, -1 },
    { NULL,             NULL,           "Special Offers", 1 << 5, 0, -1 },
    { NULL,             NULL,           "Steam",          1 << 5, 0, -1 },
    { "Lutris",         NULL,           NULL,             1 << 5, 0, -1 },
    { "chromium",       NULL,           NULL,             1 << 5, 0, -1 },
    { "steam_proton",   NULL,           NULL,             1 << 5, 0, -1 },

    /* ── Tag 7: Áudio & Bluetooth — fixo no monitor 0 (primário) ── */
    { NULL, NULL, "Bluetooth",               1 << 6, 0, 0 },
    { NULL, NULL, "Controlo de Volume",      1 << 6, 0, 0 },
    { NULL, NULL, "JBL E65BTNC",             1 << 6, 0, 0 },
    { NULL, NULL, "Flipbuds Lite",           1 << 6, 0, 0 },
    { NULL, NULL, "Xiaomi Buds 3",           1 << 6, 0, 0 },
    { NULL, NULL, "blueman-applet",          1 << 6, 0, 0 },
    { NULL, NULL, "Dispositivos Bluetooth",  1 << 6, 0, 0 },

    /* ── Tag 8: Acesso Remoto ── */
    { "TeamViewer", NULL, NULL,                          1 << 7, 0, -1 },
    { NULL, NULL, "133 - Srv EPLAN — TeamViewer",        1 << 7, 0, -1 },
    { NULL, NULL, "Luis-Nuc — TeamViewer",               1 << 7, 0, -1 },
};


/* ============================================================
   LAYOUTS
   ============================================================ */

static const float mfact        = 0.55; /* Proporção da área master [0.05..0.95] */
static const int   nmaster      = 1;    /* Número de janelas na área master */
static const int   resizehints  = 1;    /* 1 means respect size hints in tiled resizals */
static const int   lockfullscreen = 1;  /* 1 will force focus on the fullscreen window */

#include "grid.c"

static const Layout layouts[] = {
    /* símbolo    função de arranjo */
    { "[]=",  tile    },  /* 0: Tiled — padrão (master + stack) */
    { "[M]",  monocle },  /* 1: Monocle — janela ativa ocupa tudo */
    { "HHH",  grid    },  /* 2: Grid — grelha igual para todas as janelas */
    { "><>",  NULL    },  /* 3: Floating — sem arranjo automático */
    { NULL,   NULL    },  /* terminador (necessário para cyclelayouts) */
};


/* ============================================================
   MODIFICADORES E MACROS
   ============================================================ */

#define WIN_KEY  Mod4Mask   /* Tecla Super (Windows) */
#define MODKEY   Mod1Mask   /* Alt Esquerdo */

/* Macro para definir os 4 atalhos de cada tag:
   WIN+N          -> vai para a tag N
   WIN+Ctrl+N     -> mostra/esconde a tag N em conjunto com a atual
   WIN+Shift+N    -> move a janela para a tag N
   WIN+Ctrl+Shift+N -> adiciona/remove a janela da tag N */
#define TAGKEYS(KEY, TAG) \
    { WIN_KEY,                       KEY, view,       {.ui = 1 << TAG} }, \
    { WIN_KEY|ControlMask,           KEY, toggleview,  {.ui = 1 << TAG} }, \
    { WIN_KEY|ShiftMask,             KEY, tag,         {.ui = 1 << TAG} }, \
    { WIN_KEY|ControlMask|ShiftMask, KEY, toggletag,   {.ui = 1 << TAG} },

/* Macro para lançar comandos shell */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }


/* ============================================================
   COMANDOS  (variáveis para uso nos atalhos)
   ============================================================ */

/* dmenu — barra de lançamento de aplicações 
 (#RGB, #RRGGBB, and color names are supported).*/
static char dmenumon[2] = "0";
static const char *dmenucmd[] = {
    "dmenu_run", "-i",
    "-m",  dmenumon,
    "-fn", dmenufont,   /* defines the font */
    "-nb", col_black,   /* fundo normal: preto */
    "-nf", col_green,   /* texto normal: verde */
    "-sb", col_green,   /* fundo selecionado: verde */
    "-sf", col_gray5,   /* texto selecionado: quase preto */
    NULL
};
/* Teste direto no terminal:
   dmenu_run -m "0" -fn "hack:size=11" -nb "#000000" -nf "#07AE06" -sb "#07AE06" -sf "#060606"
   dmenu_run -m dmenumon -fn "monospace:size=12" -nb "#4d4d4d" -nf "#07AE06" -sb "#07AE06" -sf "#060606"
   dmenu_run -m "0" -fn "hack:size=11" -nb "#000000" -nf "#07AE06" -sb "#07AE06" -sf "#060606
   
   
   */

/* Áudio (PipeWire/PulseAudio via pactl) 
static const char *Audioup[]   = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%", NULL };
static const char *Audiodown[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%", NULL };
*/
/* Brilho do ecrã (light) 
static const char *light_inc[] = { "xlight", "-A", "5", NULL };
static const char *light_dec[] = { "xlight", "-U", "5", NULL };
*/

/* =======================================================================================================================
   ATALHOS DE TECLADO
  ======================================================================================================================= */



/* ============================================================
   CHEATSHEET — WIN+F1
   Abre terminal com lista de atalhos navegável (q = fechar)
   ============================================================ */
#define CHEATSHEET \
"===== RATO =====\n" \
"-- nas Janelas \n" \
"WIN+Rato_Esq     : Move janela e passa para Float\n" \
"WIN+Rato_Dir     : Resize janela e passa para Float\n" \
"WIN+ScroolCLICK  : Janela para TILED \n" \
"-- no SystemTRAY \n" \
"WIN+Rato_Esq     : Abre HTOP\n" \
"WIN+Rato_Dir     : Abre calendario\n" \
"WIN+ScroolCLICK  : Abre thunar\n" \
"WIN+ScroolUP     : Ecra principal brilho UP \n" \
"WIN+ScroolDOWN   : Ecra principal brilho DW \n" \
"ALT+ScroolUP     : Ecra HMI-x-Y brilho UP \n" \
"ALT+ScroolDOWN   : Ecra HMI-x-Y brilho DW \n" \
"===== SCRATCHPADS =====\n" \
"WIN+s           : Terminal rápido\n" \
"WIN+d           : Gestor ficheiros lf\n" \
"WIN+c           : Thunar\n" \
"WIN+z           : VS Code\n" \
"WIN+h           : htop\n" \
"\n===== JANELAS =====\n" \
"WIN+Esc         : Fecha janela\n" \
"WIN+f           : Fullscreen\n" \
"WIN+b           : Mostra/esconde barra\n" \
"WIN+t           : Floating <-> Tiled\n" \
"ALT+j/k         : Foco janela seguinte/anterior\n" \
"ALT+Enter       : Promove janela a master\n" \
"ALT+h/l         : Redimensiona area master\n" \
"ALT+i/d         : Aumenta/diminui janelas no master\n" \
"ALT+Shift+c     : Fecha janela\n" \
"\n===== TAGS =====\n" \
"WIN+1..8        : Vai para tag N\n" \
"WIN+Ctrl+1..8   : Mostra tag N em simultaneo\n" \
"WIN+Shift+1..8  : Move janela para tag N\n" \
"WIN+Tab         : Tag anteriormente vista\n" \
"ALT+0           : Mostra todas as tags\n" \
"\n===== MONITORES =====\n" \
"WIN+\\           : Foca monitor seguinte (rato segue)\n" \
"ALT+Shift+,     : Move janela para monitor anterior\n" \
"ALT+Shift+.     : Move janela para monitor seguinte\n" \
"\n===== APLICACOES =====\n" \
"WIN+Enter       : Terminal (alacritty)\n" \
"WIN+a           : dmenu favoritos\n" \
"WIN+Shift+a     : xfce4-appfinder\n" \
"WIN+v           : lf no terminal\n" \
"WIN+t           : Thunar\n" \
"WIN+m           : ARandR (monitores)\n" \
"\n===== MULTIMÉDIA =====\n" \
"FN+F2/F3        : Brilho ecra -/+\n" \
"FN+F5           : Mute\n" \
"FN+F6/F7        : Volume +/-\n" \
"WIN+F1          : Este cheatsheet\n" \
"\n===== LAYOUTS =====\n" \
"ALT+,/.         : Cicla layouts\n" \
"ALT+t           : Layout Tiled  []=\n" \
"ALT+f           : Layout Monocle [M]\n" \
"ALT+m           : Layout Grid   HHH\n" \
"ALT+Space       : Alterna layout anterior\n" \
"\n===== DWM =====\n" \
"ALT+Shift+q     : Reinicia DWM\n" \
"FIM\n" \










#include <X11/XF86keysym.h>  /* Para teclas multimédia: XF86XK_* */

static const Key keys[] = {

   // { WIN_KEY, XK_F1, spawn, SHCMD("firefox ~/.config/dwm/cheatsheet.html") },

    /* ──────────────────────────────────────────────
       TECLAS DE FUNÇÃO / MULTIMÉDIA  (Laptop HP Aero)
       ────────────────────────────────────────────── */
    /* modifier    tecla                          função    argumento */
    //{ WIN_KEY, XK_F1,                   spawn, SHCMD("xset dpms force off")                           }, /* FN+F1  : Desligar ecrã */
   { WIN_KEY, XK_F1, spawn, SHCMD("alacritty -e sh -c 'printf \"%b\" \"" CHEATSHEET "\" | less -K'") },  // O less permite navegar com as setas e fechar com q. Se quiseres que feche automaticamente ao carregar qualquer tecla, substitui less por less -K.
    { 0,       XF86XK_MonBrightnessDown, spawn, SHCMD("light -U 5")                                   }, /* FN+F2  : Baixar brilho */
    { 0,       XF86XK_MonBrightnessUp,  spawn, SHCMD("light -A 5")                                    }, /* FN+F3  : Aumentar brilho */
    /* FN+F4 : backlight teclado (sem atalho configurado) */
    { 0,       XF86XK_AudioMute,        spawn, SHCMD("pactl set-sink-mute @DEFAULT_SINK@ toggle")     }, /* FN+F5  : Mute */
    { 0,       XF86XK_AudioRaiseVolume, spawn, SHCMD("pactl set-sink-volume @DEFAULT_SINK@ +5%")      }, /* FN+F6  : Volume + */
    { 0,       XF86XK_AudioLowerVolume, spawn, SHCMD("pactl set-sink-volume @DEFAULT_SINK@ -5%")      }, /* FN+F7  : Volume - */
    { 0,       XF86XK_AudioPrev,        spawn, SHCMD("xset dpms force off")                           }, /* FN+F8  : (reatribuir?) */
    { 0,       XF86XK_AudioPlay,        spawn, SHCMD("xset dpms force off")                           }, /* FN+F9  : (reatribuir?) */
    { 0,       XF86XK_AudioNext,        spawn, SHCMD("xset dpms force off")                           }, /* FN+F10 : (reatribuir?) */
    { WIN_KEY, XK_p,                    spawn, SHCMD("xset dpms force off")                           }, /* FN+F11 : Monitor/Touchpad (reatribuir?) */
    { 0,       XK_Insert,               spawn, SHCMD("xset dpms force off")                           }, /* FN+F12 : (reatribuir?) */
    { WIN_KEY, XK_Print,                spawn, SHCMD("flameshot gui")                                 }, /* Print Screen : Captura com seleção */
    { 0,       XK_Print,                spawn, SHCMD("flameshot full -p ~/Imagens/Screenshots/")      }, /* Print Screen (sem mod): Captura total */
    { 0,       XF86XK_PowerOff,         spawn, SHCMD("xset dpms force off")                           }, /* Botão Power: desligar ecrã (NÃO funciona) */


    /* ──────────────────────────────────────────────
       SCRATCHPADS  (WIN + tecla)
       ────────────────────────────────────────────── */
    /* modifier    tecla    função           argumento (índice em scratchpads[]) */
    { WIN_KEY, XK_s,  togglescratch, {.ui = 0} },  /* Terminal rápido (alacritty) */
    { WIN_KEY, XK_d,  togglescratch, {.ui = 1} },  /* Gestor de ficheiros lf */
    { WIN_KEY, XK_c,  togglescratch, {.ui = 2} },  /* Thunar */
    /* WIN+w : firefox scratchpad — não funciona, desativado */
    { WIN_KEY, XK_z,  togglescratch, {.ui = 4} },  /* VS Code */
    { WIN_KEY, XK_h,  togglescratch, {.ui = 5} },  /* htop */


    /* ──────────────────────────────────────────────
       GESTÃO DE JANELAS — DWM
       ────────────────────────────────────────────── */

    /* Fechar / Matar janelas */
    { MODKEY,           XK_F4,     spawn,     SHCMD("xdotool getwindowfocus windowkill") }, /* ALT+F4     : Fecha janela com foco (suave) */
    { MODKEY,           XK_F5,     spawn,     SHCMD("xkill")                             }, /* ALT+F5     : Seleciona janela com rato para matar */
    { WIN_KEY,          XK_Escape, killclient,{0}                                        }, /* WIN+Esc    : Fecha a janela com foco */
    { MODKEY|ShiftMask, XK_c,      killclient,{0}                                        }, /* ALT+Shift+C: Fecha a janela com foco (atalho clássico DWM) */

    /* Foco na stack */
    { MODKEY,      XK_j,   focusstack, {.i = +1} }, /* ALT+J   : Foco para a janela seguinte na stack */
    { MODKEY,      XK_k,   focusstack, {.i = -1} }, /* ALT+K   : Foco para a janela anterior na stack */
    { MODKEY,      XK_Tab, focusstack, {.i = +1} }, /* ALT+Tab : Igual ao ALT+J (ciclar janelas) */

    /* Área master */
    { MODKEY,      XK_i,      incnmaster, {.i = +1}   }, /* ALT+I : Aumenta nº de janelas na área master */
    { MODKEY,      XK_d,      incnmaster, {.i = -1}   }, /* ALT+D : Diminui nº de janelas na área master */
    { MODKEY,      XK_h,      setmfact,   {.f = -0.05}}, /* ALT+H : Encolhe área master em 5% */
    { MODKEY,      XK_l,      setmfact,   {.f = +0.05}}, /* ALT+L : Expande área master em 5% */
    { MODKEY,      XK_Return, zoom,       {0}          }, /* ALT+Enter : Promove janela com foco a master */

    /* Floating */
    { WIN_KEY,          XK_t,     togglefloating, {0} }, /* WIN+T       : Alterna floating/tiled da janela */
    { MODKEY|ShiftMask, XK_space, togglefloating, {0} }, /* ALT+Shift+Sp: Alterna floating/tiled da janela */

    /* Fullscreen real (patch actualfullscreen) */
    { WIN_KEY, XK_f, togglefullscr, {0} }, /* WIN+F : Fullscreen real */

    /* Barra */
    { WIN_KEY, XK_b, togglebar, {0} }, /* WIN+B : Mostra/esconde a barra */

    /* Tags */
    { WIN_KEY,          XK_Tab, view, {0}        }, /* WIN+Tab      : Alterna para a tag anteriormente vista */
    { MODKEY,           XK_0,   view, {.ui = ~0} }, /* ALT+0        : Mostra todas as tags ao mesmo tempo */
    { MODKEY|ShiftMask, XK_0,   tag,  {.ui = ~0} }, /* ALT+Shift+0  : Move janela para todas as tags */


    /* ──────────────────────────────────────────────
       LAYOUTS
       ────────────────────────────────────────────── */
    { MODKEY,      XK_comma,  cyclelayout, {.i = -1}         }, /* ALT+,  : Layout anterior (patch cyclelayouts) */
    { MODKEY,      XK_period, cyclelayout, {.i = +1}         }, /* ALT+.  : Layout seguinte (patch cyclelayouts) */
    { MODKEY,      XK_t,      setlayout,   {.v = &layouts[0]}}, /* ALT+T  : Layout Tiled    []=  */
    { MODKEY,      XK_f,      setlayout,   {.v = &layouts[1]}}, /* ALT+F  : Layout Monocle  [M] */
    { MODKEY,      XK_m,      setlayout,   {.v = &layouts[2]}}, /* ALT+M  : Layout Grid     HHH */
    { MODKEY,      XK_space,  setlayout,   {0}               }, /* ALT+Sp : Alterna layout atual ↔ anterior */


    /* ──────────────────────────────────────────────
       MÚLTIPLOS MONITORES
       Nota: o rato segue o foco — ver função focusmon() em dwm.c
             onde foi adicionado XWarpPointer().
       Configuração xrandr:
           HDMI (1680x1050) por cima   — pos 120x0
           eDP  (1920x1200) por baixo  — pos 0x1060  (10px de gap evita salto de janelas)
       ────────────────────────────────────────────── */
    /* modifier    tecla           função      argumento */
    { WIN_KEY,          XK_backslash, focusmon, {.i = +1} }, /* WIN+\       : Foca monitor seguinte (rato segue) */
    { MODKEY|ShiftMask, XK_comma,     tagmon,   {.i = -1} }, /* ALT+Shift+, : Move janela para monitor anterior */
    { MODKEY|ShiftMask, XK_period,    tagmon,   {.i = +1} }, /* ALT+Shift+. : Move janela para monitor seguinte */


    /* ──────────────────────────────────────────────
       TAGS / WORKSPACES
       (gerados pela macro TAGKEYS)
       WIN+N           : vai para tag N
       WIN+Ctrl+N      : mostra tag N em simultâneo
       WIN+Shift+N     : move janela para tag N
       WIN+Ctrl+Shift+N: toggle da janela na tag N
       ────────────────────────────────────────────── */
    TAGKEYS(XK_1, 0)  /* Tag 1: Browser  */
    TAGKEYS(XK_2, 1)  /* Tag 2: Código   */
    TAGKEYS(XK_3, 2)  /* Tag 3: Ficheiros*/
    TAGKEYS(XK_4, 3)  /* Tag 4: Office   */
    TAGKEYS(XK_5, 4)  /* Tag 5: PDF      */
    TAGKEYS(XK_6, 5)  /* Tag 6: Jogos    */
    TAGKEYS(XK_7, 6)  /* Tag 7: Áudio/BT */
    TAGKEYS(XK_8, 7)  /* Tag 8: Remoto   */
    TAGKEYS(XK_9, 8)  /* Tag 9: (extra)  */

    /* Reiniciar DWM */
    { MODKEY|ShiftMask, XK_q, quit, {0} }, /* ALT+Shift+Q : Reinicia o DWM */


    /* ──────────────────────────────────────────────
       LANÇAR APLICAÇÕES  (WIN + tecla)
       ────────────────────────────────────────────── */
    /* modifier    tecla       função    comando */
    { WIN_KEY,           XK_Return, spawn, SHCMD("alacritty")                            }, /* WIN+Enter      : Terminal */
    { WIN_KEY,           XK_a,      spawn, SHCMD("sh ~/.config/dwm/dmenu_favoritos.sh")  }, /* WIN+A          : dmenu favoritos (script personalizado) */
    { WIN_KEY|ShiftMask, XK_a,      spawn, SHCMD("xfce4-appfinder")                      }, /* WIN+Shift+A    : Lançador de aplicações XFCE */
    { WIN_KEY,           XK_v,      spawn, SHCMD("alacritty -e sh ~/.local/bin/lfub")    }, /* WIN+V          : Gestor de ficheiros lf no terminal */
    { WIN_KEY,           XK_t,      spawn, SHCMD("thunar")                               }, /* WIN+T          : Thunar (ficheiros gráfico) */
    { WIN_KEY,           XK_o,      spawn, SHCMD("libreoffice : evince")                 }, /* WIN+O          : LibreOffice ou Evince */
    { WIN_KEY,           XK_m,      spawn, SHCMD("arandr")                               }, /* WIN+M          : ARandR (configuração de monitores) */
};


/* ============================================================
   BOTÕES DO RATO
   Estrutura: { zona_clique, modificador, botão, função, argumento }

   Botões:
     Button1 = esquerdo   Button2 = meio    Button3 = direito
     Button4 = scroll ↑   Button5 = scroll ↓

   Zonas:
     ClkTagBar    = indicadores de workspaces na barra
     ClkLtSymbol  = símbolo do layout na barra
     ClkWinTitle  = título da janela na barra
     ClkStatusText= área de status (slstatus/dwmblocks)
     ClkClientWin = área das janelas
     ClkRootWin   = desktop (sem janelas)
   ============================================================ */

/* Brilho HDMI via xrandr */
static const char *hdmi_bright_up[]   = { "sh", "-c", "xrandr --output HDMI-A-0 --brightness $(echo $(xrandr --verbose | grep -A 10 HDMI-A-0 | grep Brightness | awk '{print $2}') + 0.1 | bc)", NULL };
static const char *hdmi_bright_down[] = { "sh", "-c", "xrandr --output HDMI-A-0 --brightness $(echo $(xrandr --verbose | grep -A 10 HDMI-A-0 | grep Brightness | awk '{print $2}') - 0.1 | bc)", NULL };



static const Button buttons[] = {

      /* ── Símbolo do Layout (ClkLtSymbol) ── */
      /* click          mod    botão    função        argumento */
      { ClkLtSymbol, 0, Button1, setlayout,   {.v = &layouts[2]} }, /* Clique esq  : Layout Grid */
      { ClkLtSymbol, 0, Button3, setlayout,   {0}                }, /* Clique dir  : Alterna layout anterior */
      { ClkLtSymbol, 0, Button4, cyclelayout, {.i = -1}          }, /* Scroll ↑    : Layout anterior */
      { ClkLtSymbol, 0, Button5, cyclelayout, {.i = +1}          }, /* Scroll ↓    : Layout seguinte */

      /* ── Título da Janela (ClkWinTitle) ── */
      { ClkWinTitle, 0, Button1, zoom,       {0}   }, /* Clique esq  : Promove janela a master */
      { ClkWinTitle, 0, Button4, focusstack, {.i = -1} }, /* Scroll ↑    : Janela anterior na stack */
      { ClkWinTitle, 0, Button5, focusstack, {.i = +1} }, /* Scroll ↓    : Janela seguinte na stack */

      /* ── Área de Status / System Tray (ClkStatusText) ── */
      { ClkStatusText, 0,       Button1, spawn, SHCMD("alacritty -e htop")                           }, /* Clique esq      : htop */
      { ClkStatusText, 0,       Button2, spawn, SHCMD("thunar")                                      }, /* Clique meio     : Thunar */
      { ClkStatusText, 0,       Button3, spawn, SHCMD("gsimplecal")                                  }, /* Clique dir      : Calendário */
      { ClkStatusText, 0,       Button4, spawn, SHCMD("pactl set-sink-volume @DEFAULT_SINK@ +5%")    }, /* Scroll ↑        : Volume + */
      { ClkStatusText, 0,       Button5, spawn, SHCMD("pactl set-sink-volume @DEFAULT_SINK@ -5%")    }, /* Scroll ↓        : Volume - */
      { ClkStatusText, WIN_KEY, Button4, spawn, SHCMD("light -A 5")                                  }, /* WIN + Scroll ↑  : Brilho + */
      { ClkStatusText, WIN_KEY, Button5, spawn, SHCMD("light -U 5")                                  }, /* WIN + Scroll ↓  : Brilho - */




   { ClkStatusText, MODKEY, Button4, spawn, {.v = hdmi_bright_up  } }, /* MODKEY + Scroll ↑ : Brilho HDMI + */
   { ClkStatusText, MODKEY, Button5, spawn, {.v = hdmi_bright_down} }, /* MODKEY + Scroll ↓ : Brilho HDMI - */

      //{ ClkStatusText, MODKEY,  Button4, spawn, SHCMD("xrandr --output HDMI-A-0 --brightness $(echo \"$(xrandr --verbose | grep -A 10 \"HDMI-A-0\" | grep \"Brightness\" | awk '{print $2}') - 0.1\" | bc)") },
     // { ClkStatusText, MODKEY,  Button5, spawn, SHCMD("xrandr --output HDMI-A-0 --brightness $(echo \"$(xrandr --verbose | grep -A 10 \"HDMI-A-0\" | grep \"Brightness\" | awk '{print $2}') + 0.1\" | bc)") },                               }, /* WIN + Scroll ↓  : Brilho - */

/*
CURRENT=$(xrandr --verbose | grep -A 10 "HDMI-A-0" | grep "Brightness" | awk '{print $2}')
NEW=$(echo "$CURRENT + 0.1" | bc)
xrandr --output HDMI-A-0 --brightness $(echo "$(xrandr --verbose | grep -A 10 "HDMI-A-0" | grep "Brightness" | awk '{print $2}') + 0.1" | bc)

*/
	

    /* ── Janelas (ClkClientWin) ── */
    { ClkClientWin, WIN_KEY, Button1, movemouse,     {0} }, /* WIN + Arrasto esq  : Mover janela floating */
    { ClkClientWin, WIN_KEY, Button2, togglefloating,{0} }, /* WIN + Clique meio  : Alterna floating/tiled */
    { ClkClientWin, WIN_KEY, Button3, resizemouse,   {0} }, /* WIN + Arrasto dir  : Redimensionar janela floating */
    { ClkClientWin, WIN_KEY, Button4, focusstack,    {.i = -1} }, /* WIN + Scroll ↑: Janela anterior na stack */

    /* ── Indicadores de Workspaces / Tags (ClkTagBar) ── */
    { ClkTagBar, 0,       Button1, view,      {0} }, /* Clique esq       : Vai para a tag */
    { ClkTagBar, 0,       Button3, toggleview,{0} }, /* Clique dir       : Mostra tag em simultâneo */
    { ClkTagBar, WIN_KEY, Button1, tag,       {0} }, /* WIN + Clique esq : Move janela para a tag */
    { ClkTagBar, WIN_KEY, Button3, toggletag, {0} }, /* WIN + Clique dir : Toggle da janela na tag */
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
