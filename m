Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA02539
	for <parisc-linux@puffin.external.hp.com>; Thu, 27 Jan 2000 10:47:23 -0700
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <200001271650.IAA24885@chrome.rose.hp.com>
Subject: Re: [parisc-linux] 715/33 and HIL driver
To: ulrich_strelow@yahoo.com (Ulrich Strelow)
Date: Thu, 27 Jan 2000 8:50:04 PST
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20000127112427.11602.qmail@web507.mail.yahoo.com>; from "Ulrich Strelow" at Jan 27, 100 3:24 am
List-ID: <linux-parisc.vger.kernel.org>

I have never seen the shellpromt on my D320, but I am
getting the same thing as you.

| I have seen the shellprompt on my 715/33 using the CVS
| version 20000125 and defconfig (and removing the debug
| printk's from sched.c + system.h). But activating
| CONFIG_HIL leads to the following boot messages:
| 
| pagetable_init
| kernel BUG at bootmem.c:163!
| kernel BUG at bootmem.c:203!

This happened after I did an rm .config; make oldconfig dep clean Image.
Before that I was getting to the switch_to endless loop, but no prompt.

Here is what I get:

|Console: switching to IODC console
|The Kernel has started...
|Free memory starts at: 0xc02e2a9c
|FP CCR was 0xc0, will be set to 0xc0
|model   00005120 00000481 00000000 00000000 7768de7f 100000f0 00000004 000000ba 000000ba
|vers    00000008
|cpuid   000001e8
|CPUID vers 15 rev 8
|Model: UL L2 132 (803/D220,D320) with 32 MB RAM.
|CPU(s): 1 x PA7300LC at 132.000000 MHz
|Searching for devices in PDC firmware... a newer box...
|Found devices:
|1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0, 0x0, 0x0, 0x0
|2. Phantom PseudoBC GSC+ Port (7) at 0xffc01000, versions 0x505, 0x0, 0x0, 0x0, 0x0
|3. Bluefish Add-on FW-SCSI (4) at 0xfff84000, versions 0x13, 0x1, 0x89, 0x0, 0x80
|4. UL L2 132 (803/D220,D320) (0) at 0xfffbe000, versions 0x512, 0x0, 0x4, 0x0, 0x81
|5. UL L2 132 memory (1) at 0xfffbf000, versions 0x7f, 0x0, 0x9, 0x0, 0x0
|6. UL 550 Lasi Core BA (11) at 0xffd00000, versions 0x2f, 0x0, 0x81, 0x0, 0x0
|7. UL 550 Lasi Core RS-232 (10) at 0xffd05000, versions 0x2f, 0x0, 0x8c, 0x0, 0x0
|8. UL 550 Core SCSI (10) at 0xffd06000, versions 0x2f, 0x0, 0x82, 0x0, 0x0
|9. UL 350 Core LAN (802.3) (10) at 0xffd07000, versions 0x2f, 0x0, 0x8a, 0x0, 0x0
|10. UL 550 Core Centronics (10) at 0xffd02000, versions 0x2f, 0x0, 0x74, 0x0, 0x0
|11. UL 550 Core PC Keyboard (10) at 0xffd08000, versions 0x2f, 0x0, 0x84, 0x0, 0x0
|12. UL 550 Core PC Keyboard (10) at 0xffd08100, versions 0x2f, 0x0, 0x84, 0x0, 0x0
|13. UL 550 Core Wax BA (11) at 0xffe00000, versions 0x31, 0x0, 0x8e, 0x0, 0x0
|14. UL 550 Wax EISA BA (11) at 0xfc000000, versions 0x31, 0x0, 0x90, 0x0, 0x0
|15. UL 550 Wax Core RS-232 (10) at 0xffe02000, versions 0x31, 0x0, 0x8c, 0x0, 0x0
|That's a total of 15 devices.
|Linux version 2.3.29 (kirkb@chrome) (gcc version egcs-2.91.60 19981201 (egcs-1.1.1 release)) #80 Thu Jan 27
|08:20:20 PST 2000
|init_bootmem 739 8192
|free_bootmem 002e2e9c 01d1d164
|d_conf 41402000
|initrd: c01c9000-c026b800
|command_line: /stand/vmlinux HOME=/ TERM=LINUX console=tty
|
|pagetable_init
|kernel BUG at bootmem.c:166!
|kernel BUG at bootmem.c:206!
|kernel BUG at bootmem.c:206!
|kernel BUG at bootmem.c:206!
|
|PSW  : 000cff0a  GR 1 : c01b8000  GR 2 : c0151810  GR 3 : 00002007
|GR 4 : 00002007  GR 5 : c1ff7000  GR 6 : c010e000  GR 7 : c010e000
|GR 8 : 00000010  GR 9 : c0277000  GR10 : 00010000  GR11 : 00010000
|GR12 : ffffffff  GR13 : 00000000  GR14 : 000000fd  GR15 : f0100000
|GR16 : f0000a98  GR17 : f0000094  GR18 : 00000020  GR19 : c2000000
|GR20 : 00000000  GR21 : 005001ff  GR22 : c02e3000  GR23 : 0000000a
|GR24 : 00006ffe  GR25 : 00000000  GR26 : c1ff7000  GR27 : c01c2000
|GR28 : 0000001d  GR29 : c02837c0  GR30 : c01c4780  GR31 : c013de40
|SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000
|SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000
|IAOQ : c01b8174 c01b816c
|IIR  : 0e791222
|
|bad address c2000000 (code 15)
|Kernel panic: bad address
|
|In swapper task - not syncing
|

In looking at the code, what is barfing is the last call to
__alloc_bootmem() at the end of pagetable_init() in
arch/parisc/mm/init.c. This is the call which I believe is 
supposed to allocate page zero and in prep to clear it out.

Here is what I have defined in my include/linux/autoconf.h

#define AUTOCONF_INCLUDED
#define CONFIG_EXPERIMENTAL 1
#define CONFIG_PA7100 1
#define CONFIG_PA7300 1
#define CONFIG_PA_1x 1
#define CONFIG_PA_11 1
#define CONFIG_GSC 1
#define CONFIG_GSC_LASI 1
#define CONFIG_NET 1
#define CONFIG_SYSVIPC 1
#define CONFIG_SYSCTL 1
#define CONFIG_BINFMT_SOM 1
#define CONFIG_BLK_DEV_RAM 1
#define CONFIG_BLK_DEV_INITRD 1
#define CONFIG_PARIDE_PARPORT_MODULE 1
#define CONFIG_NETDEVICES 1
#define CONFIG_VT 1
#define CONFIG_VT_CONSOLE 1
#define CONFIG_GSC_PS2 1
#define CONFIG_SERIAL 1
#define CONFIG_SERIAL_EXTENDED 1
#define CONFIG_UNIX98_PTYS 1
#define CONFIG_UNIX98_PTY_COUNT (256)
#define CONFIG_ISO9660_FS 1
#define CONFIG_PROC_FS 1
#define CONFIG_EXT2_FS 1
#define CONFIG_MSDOS_PARTITION 1
#define CONFIG_PDC_CONSOLE 1
#define CONFIG_IODC_CONSOLE 1
#define CONFIG_MAGIC_SYSRQ 1

KMB
--
+============================================================+
|       Kirk Bresniker    	(916) 748-2393		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
