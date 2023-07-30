/* See LICENSE file for copyright and license details. */

/* Restart DWM doens't aply the sltatus correctly    */

/* interval between updates (in ms) */
const unsigned int interval = 1000;

/* text to show if no value can be retrieved */
static const char unknown_str[] = "n/a";

/* maximum output string length  */
#define MAXLEN 2048


static const char dynamic_slstatus[] = "sh ~/.config/dwm_slstatus/dynamic_slstatus.sh" ;


static const struct arg args[] = {
	/* function format          argument */
	
	{ netspeed_rx, 	"D:%s:","wlan0"},
	{ netspeed_tx, 	" U:%s ","wlan0"},		
	{ cpu_perc, 		"%s%%:",	NULL  },
	{ ram_perc, 		"%s%% ",	NULL  },


	{ run_command, 	"%s", 		dynamic_slstatus },

	
};	





/*

Nome da Rede : ifconfig

//static const char vol[]         = "[ `amixer sget Master | tail -n 1 | awk '{print $6;}'` = \"[on]\" ] \
                                   && printf \"`amixer sget Master | tail -n 1 | awk '{print $5;}' | grep -Po '\\[\\K[^%]*'`%%\" \
                                   || printf 'Off'";

//static const char mic[]         = "[ `amixer sget Capture | tail -n 1 | awk '{print $6;}'` = \"[on]\" ] \
                                   && printf \"`amixer sget Capture | tail -n 1 | awk '{print $5;}' | grep -Po '\\[\\K[^%]*'`%%\" \
                                   || printf 'Off'";


//static const char volume[]     = "amixer sget Master | awk -F\"[][]\" '/%/ { print $2 }' | head -n1";

//static const char data_time[] = "%d-%m-%y|%H:%M|" ;	 //"%a %d-%m-%y|%H:%M|" ;

//static const char wire_wirelles[] = "sh ~/.config/dwm/slstatus/wire_wiered.sh" ;

*/


	
	//{ ram_perc, 		"%s%%|",	NULL  },	
	//{ battery_perc, 	"%s%%|",	"BAT0" }, // BAT + ZERO = BAT0 não: BATO
	//{ datetime, 		"%s",		data_time},
	//{ run_command, 	"🎵 %s|", 	volume },
	//{ run_command, 	"%s|", 		wire_wirelles }





	//{ netspeed_rx, 	"▼ %s- ","wlp2s0"},
	//{ netspeed_tx, 	"▲ %s|","wlp2s0"},		
	//{ datetime, "%s",           "%a%b%d %r |" },
	//{ uptime, 		"%s ",		 NULL },
	//{ uptime , 		"%s|",		"-s" },


//{run_command, "%s","amixer sget Master | grep -o -m 1 '\[[[:digit:]]*%\]'" }, 

//{ run_command, "| VOL %s ", "amixer get Master | tail -1 | cut -d\"[\" -f 2 | cut -d\"]\" -f 1" },


	//{ datetime, "%s",           "%F %T" },
	
	/*{ disk_free,"[hdd %sB]  | ",      "/" },*/
	//{ datetime, "%s","%a %b %d %R" } // https://www.cyberciti.biz/faq/unix-date-command-howto-see-set-date-time/
	//{ datetime, "%s","%d-%m-%y %R" } // 1 retira a data com o %S, depois filtra e mostra
	//{ run_command, "[V] %s", "amixer sget Master | tail -1 | awk '{print $5 }' | sed 's@\\(\\[\\|\\]\\)@@g'" },
	
		




/*
 * function            description                     argument (example)
 *
 * battery_perc        battery percentage              battery name (BAT0)
 *                                                     NULL on OpenBSD/FreeBSD
 * battery_state       battery charging state          battery name (BAT0)
 *                                                     NULL on OpenBSD/FreeBSD
 * battery_remaining   battery remaining HH:MM         battery name (BAT0)
 *                                                     NULL on OpenBSD/FreeBSD
 * cpu_perc            cpu usage in percent            NULL
 * cpu_freq            cpu frequency in MHz            NULL
 *
 * disk_free           free disk space in GB           mountpoint path (/)
 * disk_perc           disk usage in percent           mountpoint path (/)
 * disk_total          total disk space in GB          mountpoint path (/")
 * disk_used           used disk space in GB           mountpoint path (/)
 * entropy             available entropy               NULL
 * gid                 GID of current user             NULL
 * hostname            hostname                        NULL
 * ipv4                IPv4 address                    interface name (eth0)
 * ipv6                IPv6 address                    interface name (eth0)
 * kernel_release      `uname -r`                      NULL
 * keyboard_indicators caps/num lock indicators        format string (c?n?)
 *                                                     see keyboard_indicators.c
 * keymap              layout (variant) of current     NULL
 *                     keymap
 * load_avg            load average                    NULL
 * netspeed_rx         receive network speed           interface name (wlan0)
 * netspeed_tx         transfer network speed          interface name (wlan0)
 * num_files           number of files in a directory  path
 *                                                     (/home/foo/Inbox/cur)
 * ram_free            free memory in GB               NULL
 * ram_perc            memory usage in percent         NULL
 * ram_total           total memory size in GB         NULL
 * ram_used            used memory in GB               NULL
 * run_command         custom shell command            command (echo foo)
 * swap_free           free swap in GB                 NULL
 * swap_perc           swap usage in percent           NULL
 * swap_total          total swap size in GB           NULL
 * swap_used           used swap in GB                 NULL
 * temp                temperature in degree celsius   sensor file
 *                                                     (/sys/class/thermal/...)
 *                                                     NULL on OpenBSD
 *                                                     thermal zone on FreeBSD
 *                                                     (tz0, tz1, etc.)
 * uid                 UID of current user             NULL
 * uptime              system uptime                   NULL
 * username            username of current user        NULL
 * vol_perc            OSS/ALSA volume in percent      mixer file (/dev/mixer)
 * wifi_perc           WiFi signal in percent          interface name (wlan0)
 * wifi_essid          WiFi ESSID                      interface name (wlan0)

▲ ▼    

*/

