Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA19727
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 03:32:59 -0700
Message-ID: <1A8904C3797ED411AC2E0008C7E6F88117C6A0@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Cc: "'thuis'" <digihans@wishmail.net>
Date: Fri, 8 Dec 2000 11:34:37 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] FW: hp_boot.log
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I had the impression that the C110 was supported, however when booting from
cd (from palinux.05.iso) i got following results:
Although i think the cd is ok, it might be a good idea to provide the
md5sums as well.....

TIA,

Hans

> Firmware Version  1.3
> 
> Duplex Console IO Dependent Code (IODC) revision 0
> 
> --------------------------------------------------------------------------
> ----
>    (c) Copyright 1990-1996, Hewlett-Packard Company, All rights reserved
> --------------------------------------------------------------------------
> ----
> 
>   Processor   Speed            State           CoProcessor State  Cache
> Size
>   ---------  --------   ---------------------  -----------------
> ----------
> 
>       0      120  Mhz   Active                 Functional          256 KB
> 
>   Central Bus Speed (in mhz)  :        120  
>   Available Memory (bytes)    :  536866816  
>   Good Memory Required (bytes):   48549888  
> 
> 
>    Primary boot path:    core.FWSCSI.6.0
>    Alternate boot path:  core.SCSI.6.0
>    Console path:         GRAPHICS3
>    Keyboard path:        core.PS2
> 
> CPU 0
>   WARNING:  Memory has been initialized, but not tested as a result of
>             FASTBOOT being enabled.  To test memory, disable FASTBOOT
>             and reboot system
> 
> 
> Processor is booting from first available device.
> 
> To discontinue, press any key within 10 seconds.
> 
> Boot terminated.
> 
> 
> ------- Main Menu
> -------------------------------------------------------------
> 
>         Command                         Description
>         -------                         -----------
> 
>         BOot [PRI|ALT|<path>]           Boot from specified path
>         PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path
>         SEArch [DIsplay|IPL] [<path>]   Search for boot devices
> 
>         COnfiguration menu              Displays or sets boot values
>         INformation menu                Displays hardware information
>         SERvice menu                    Displays service commands
> 
>         DIsplay                         Redisplay the current menu
>         HElp [<menu>|<command>]         Display help for menu or command
>         RESET                           Restart the system
> -------
> Main Menu: Enter command or menu > sea
> 
> Searching for potential boot device(s)
> This may take several minutes.
> 
> To discontinue search, press any key (termination may not be immediate).
> 
> 
>    Path Number      Device Path                   Device Type
> --------------------------------------------------------------------------
> -
>    P0               core.FWSCSI.6.0               SEAGATE ST32272WD
> 
>    P1               core.FWSCSI.5.0               SEAGATE ST34572WD
> 
>    P2               core.SCSI.2.0                 TOSHIBA CD-ROM XM-5701TA
> 
> 
> 
> Main Menu: Enter command or menu > boot p2
> Interact with IPL (Y or N)?> n
> 
> Booting... 
> Boot IO Dependent Code (IODC) revision 0
> 
> 
> HARD Booted.
> palo ipl bame@noam Tue Oct 31 14:18:02 MST 2000
> 0/vmlinux 2140145 bytes @ 0x6f9800
> 0/palo-cmdline '0/vmlinux ROOT=/ TERM=LINUX root=/dev/scd0'
> Kernel: partition 0 file /vmlinux
> ELF32 executable
> 
> Entry 00100150 first 00100000 n 4
> Segment 0 load 00100000 size 1460344 mediaptr 0x1000
> Segment 1 load 00266000 size 179048 mediaptr 0x166000
> Segment 2 load 00294000 size 109876 mediaptr 0x192000
> Segment 3 load 002b0000 size 8192 mediaptr 0x1ad000
> branching to kernel entry point 0x00100150
> Set default PSW W bit to 0
> PDC Console Initialized
> The 32-bit Kernel has started...
> Enabled FP coprocessor
> Free memory starts at: 0xc02da000
> (0x504d6c,0x504d6c,0x0,0x0)
> PALO command line: 'ROOT=/ TERM=LINUX root=/dev/scd0'
> PALO initrd 0-0
> model   000058e0 00000481 00000000 00000002 777b7670 100000f1 00000004
> 0000008a 0000008a
> vers    0000000d
> cpuid   0000016d
> CPUID vers 11 rev 13
> Searching for devices in PDC firmware... processor hpa 0xfffa0000
> a newer box...
> Found devices:
> 1. Raven T' GSC Core Graphics (10) at 0xf4000000, versions 0x32, 0x0,
> 0x85, 0x0, 0x0
> 2. SkyHawk 100/120 FW-SCSI (4) at 0xf3f8c000, versions 0x1f, 0x0, 0x89,
> 0x0, 0x80
> 3. U2-IOA BC GSC+ Port (7) at 0xf3fbf000, versions 0x501, 0x1, 0xc, 0x0,
> 0x0
> 4. Raven T' Core BA (11) at 0xffd00000, versions 0x32, 0x0, 0x81, 0x0, 0x0
> 5. Raven T' Lasi Core RS-232 (10) at 0xffd05000, versions 0x32, 0x0, 0x8c,
> 0x0, 0x0
> 6. Raven T' Core SCSI (10) at 0xffd06000, versions 0x32, 0x0, 0x82, 0x0,
> 0x0
> 7. Raven T' Core LAN (802.3) (10) at 0xffd07000, versions 0x32, 0x0, 0x8a,
> 0x0, 0x0
> 8. Raven T' Core Centronics (10) at 0xffd02000, versions 0x32, 0x0, 0x74,
> 0x0, 0x0
> 9. Raven T' Core PC Floppy (10) at 0xffd0a000, versions 0x32, 0x0, 0x83,
> 0x0, 0x0
> 10. Raven T' Audio (10) at 0xffd04000, versions 0x32, 0x0, 0x7b, 0x0, 0x0
> 11. Raven T' Core PC Keyboard (10) at 0xffd08000, versions 0x32, 0x0,
> 0x84, 0x0, 0x0
> 12. Raven T' Core PC Keyboard (10) at 0xffd08100, versions 0x32, 0x0,
> 0x84, 0x0, 0x0
> 13. Raven T' Wax BA (11) at 0xffe00000, versions 0x1e, 0x0, 0x8e, 0x0, 0x0
> 14. Raven T' Wax EISA BA (11) at 0xfc000000, versions 0x1e, 0x0, 0x90,
> 0x0, 0x0
> 15. Raven T' Wax RS-232 (10) at 0xffe02000, versions 0x1e, 0x0, 0x8c, 0x0,
> 0x80
> 16. Raven T' Wax HIL (10) at 0xffe01000, versions 0x1e, 0x0, 0x73, 0x0,
> 0x0
> That's a total of 16 devices.
> No CPUs reported by firmware - probing...
> Found CPU at fffa0000
> CPU(s): 1 x PA7200 (PCX-T') at 120.000000 MHz
> Linux version 2.4.0-test6 (pjlahaie@elenuial.thepuffingroup.com) (gcc
> version 2.96 20000925 (experimental)) #32 Mon Nov 6 10:20:58 EST 2000
> free_bootmem(0x2de000, 0x1fd22000)
> initrd: 00000000-00000000
> pagetable_init
> On node 0 totalpages: 131072
> zone(0): 65536 pages.
> zone(1): 65536 pages.
> zone(2): 0 pages.
> Kernel command line: ROOT=/ TERM=LINUX root=/dev/scd0
> trap_init
> Calibrating delay loop... 119.60 BogoMIPS
> Memory: 511600k available
> Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
> Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
> Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
> Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
> POSIX conformance testing by UNIFIX
> Lasi version 0 at 0xffd00000 found.
> 
> Dumping Stack from dfff0000 to dfff0a80:
> 0000 00000000 00000040 00000000 00000000 c027a46c 00000000 00000000
> ffffffff
> 0020 00000004 00000000 00000000 00000000 00000000 00000000 ffffffff
> c027a384
> 0040 c027a384 c02b0000 c02b0000 c028060c 00000000 00000000 00000000
> 00000000
> 0060 00000000 00000000 00000001 00000000 00000000 00000000 00000000
> c02b0000
> 0080 c02b0000 00000000 00000000 00000000 00000000 c02c9ab8 00000000
> dfff009c
> 00a0 dfff009c dfff00a4 c011a6e4 00000000 00000000 00000000 00000000
> 00000000
> 00c0 00000000 00000000 00000000 00000000 00000000 00000000 dfff0000
> c011d4a8
> 00e0 00000000 00000001 00000000 00000000 00000042 00000000 00000043
> 00000000
> 0100 00000000 00000000 00000000 00000000 00000000 80000000 00000000
> 00000000
> 0120 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> 0140 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> 0160 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> 0180 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> 01a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> fffffeff
> 01c0 00000000 ffffffff 00000000 c027afb4 ffffffff ffffffff ffffffff
> ffffffff
> 01e0 ffffffff ffffffff 00800000 05000000 00000000 ffffffff ffffffff
> ffffffff
> 0200 00002000 00002000 00000400 00000400 ffffffff ffffffff ffffffff
> ffffffff
> 0220 00007377 61707065 72000000 00000000 00000000 00000000 00000000
> 00000000
> 0240 00000000 00000000 00020000 c0267054 c0267054 c013d1e8 00040000
> dfffeba0
> 0260 c02238c4 c0236708 c02d9800 00504d6c 00000000 c011bb88 c0267000
> 00020000
> 0280 c0267054 c0267000 0000003e c027a000 00000001 c02b61eb 00000004
> c02b61c7
> 02a0 00000023 c02b61eb 00000000 00000000 c0100290 0000003e 00000000
> 00000024
> 02c0 0000000b c027a4ac c027a000 f00000ac f00000a4 000000ff ffd05800
> ffd05800
> 02e0 ffd05800 00000060 ffffffff ffd05800 002b50c0 c0266000 00000000
> 00000000
> 0300 c02b08c0 00000000 000b0800 00000000 0450060a efdbdf3f 00000000
> fa7fcda2
> 0320 fffffffe 4374efc9 00000000 00000000 00000000 00000000 fffffffe
> 92b2dbaf
> 0340 ffffffff fde3de77 fffffffe 75fb7f5b fffffffe fa9f5fff fffffffe
> ff73bb77
> 0360 00000000 00000000 fffffffe 92f6ec6f fffffffe dffdffab fffffffe
> 5d5bdfaf
> 0380 fffffffe fbe3ebf7 fffffffe 6d735faa fffffffe 4ef1bffb fffffffe
> 17229d7e
> 03a0 fffffffe e5fddfaf d3f3aede a6d6f5fb f7dfdfff ffefffdd 7bd82bfe
> fccf39df
> 03c0 afeffdee d7978797 a3fbedff 7fe5de95 8ffbbefd fddbfffb bfdeffd7
> 78f75f3b
> 03e0 6fbcff3b 70eff7c9 e8ffbfbe faeeff9e eff9c5bf f743cfbf 77fcf7be
> bbffc2e9
> 0400 7d6ffdff fbbef7ef 00000000 00000000 dfff0500 c0103c38 00000000
> 00000000
> 0420 00000000 00000000 00000000 00000000 c011bb78 c011bb7c 7bd82bfe
> fccf39df
> 0440 00281000 00000000 c0280040 c0280064 00000000 c0280204 00000000
> 00000000
> 0460 00000000 00000000 00000000 dfff0468 00000000 00000000 00000000
> 00000000
> 0480 00000000 00000000 ef492a6b dee4e185 bdbf7659 7b0859e1 f610b3c2
> ec57d2d7
> 04a0 d8d910fd b1c494a9 63ff9c01 c7ff3802 8f88c557 1f673ffd 3ece7ffa
> 7d9cfff4
> 04c0 fb39ffe8 f6054a83 ec7c2055 d88ef5f9 b16b5ea1 62a00811 c5401022
> 8af69517
> 04e0 159b9f7d 2b373efa 566e7df4 c0103c48 59cf4283 b39e8506 674bbf5f
> ce977ebe
> 0500 dfff0000 c028060c 00000000 eb189434 d6479d3b acf98f25 5985ab19
> b30b5632
> 0520 66601937 ccc0326e 99f6d18f c01002a4 67362c9a ce6c5934 9cae073b
> 392abb25
> 0540 7255764a e4aaec94 c9236c7b 92306da5 c02b06c0 dfff0000 c028060c
> 00000000
> 0560 c02b0000 8317166c 0658998b 0cb13316 1962662c 32c4cc58 658998b0
> cb133160
> 0580 9650d793 2cd71a75 59ae34ea b35c69d4 66ce66fb cd9ccdf6 9b4f2ebf
> 36e8e82d
> 05a0 6dd1d05a dba3a0b4 b731f43b c0295054 dc2aba4a b823c1c7 703136dd
> e0626dba
> 05c0 c02b0000 8112691d 02526769 04a4ced2 09499da4 12933b48 dfffd140
> 4a4ced20
> 05e0 9499da40 294501d3 528a03a6 c02a5f74 4a5ebbcb 94bd7796 290c5a7f
> 5218b4fe
> 0600 c02d9800 00504d6c c025636c c0266000 c02c8000 00000000 c028d748
> 029f9556
> 0620 053f2aac 0a7e5558 14fcaab0 c02a67c8 53f2aac0 a7e55580 4fbc1e53
> 9f783ca6
> 0640 c02cc000 c0266000 c02c8000 00000000 c028d748 dfffec20 a347a7e1
> 46f9fa91
> 0660 8df3f522 1b915f17 3722be2e c0153e78 dc8af8b8 b9634423 72b03d15
> e5607a2a
> 0680 dffef8ac dffef860 c02c8000 00000000 00000000 c027a6cc dffef7e0
> 00000000
> 06a0 93ee3a7e 27aac1af 4f55835e c0109e74 3d20b82b 7a417056 f482e0ac
> e973740b
> 06c0 d2905d45 a5560fd9 fffa0000 00000002 00000022 dffef160 00000003
> c02ae994
> 06e0 c02c8d00 622fbaff c45f75fe c01536e0 11e6080d 23cc101a 47982034
> 8f304068
> 0700 dffef82c 0000416d c0230d0c dfffb1e0 ffd00000 00000000 c0256ba8
> c0256bb0
> 0720 13dcc342 27b98684 4f730d08 c02a6948 3dba8173 7b7502e6 f6ea05cc
> eda2becb
> 0740 c02c8d00 00000000 dfffb1e0 c02ae994 dfffb1e0 00000000 00000001
> 0000004d
> 0760 00000000 000000bf c0295794 c01dc40c 00504d6c c02c8800 c026c000
> c02c8d00
> 0780 c02ae994 dfffb1e0 c025f904 dfffb1e0 00000012 000081a4 c0256bd0
> 00000000
> 07a0 13f40217 27e8042e 4fd0085c c01dd02c 3f369423 7e6d2846 fcda508c
> f9c2144b
> 07c0 c02c8800 c026c000 c027a000 dfffb1e0 dfffa200 dfffb1e0 dfffb1e0
> c02b61ee
> 07e0 00000000 00000001 c027a000 0000003e 0000003c 00000027 0000000b
> c027a4ac
> 0800 c027a000 f00000ac f00000a4 000000ff ffd05800 ffd05800 ffd05800
> 00000060
> 0820 ffffffff ffd05800 002b50c0 c011e9bc 00000000 00000000 dfff0a00
> 00000000
> 0840 0004000b c0221800 c011e9f8 dfffa220 dfffa200 c0256a3c 00000014
> ffd00000
> 0860 00504d6c c02d9800 c0295794 000000bf 00000000 0000004d 00000001
> 00000000
> 0880 f00010f4 f00000ac f00000a4 ffdfffff dfffa218 ffd00013 ffd00000
> 0000000b
> 08a0 ffffffff dfffa220 dfffa200 c0266000 1749bb45 00000040 dfff0a80
> c012dfc0
> 08c0 000b0800 00000000 0450060a efdbdf3f 00000000 fa7fcda2 fffffffe
> 4374efc9
> 08e0 00000000 00000000 00000000 00000000 fffffffe 92b2dbaf ffffffff
> fde3de77
> 0900 fffffffe 75fb7f5b fffffffe fa9f5fff fffffffe ff73bb77 00000000
> 00000000
> 0920 fffffffe 92f6ec6f fffffffe dffdffab fffffffe 5d5bdfaf fffffffe
> fbe3ebf7
> 0940 fffffffe 6d735faa fffffffe 4ef1bffb fffffffe 17229d7e fffffffe
> e5fddfaf
> 0960 d3f3aede a6d6f5fb f7dfdfff ffefffdd 7bd82bfe fccf39df afeffdee
> d7978797
> 0980 a3fbedff 7fe5de95 8ffbbefd fddbfffb bfdeffd7 78f75f3b 6fbcff3b
> 70eff7c9
> 09a0 e8ffbfbe faeeff9e eff9c5bf f743cfbf 77fcf7be bbffc2e9 7d6ffdff
> fbbef7ef
> 09c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> 09e0 00000000 00000000 c011e710 c011e714 233e60d9 467cc1b2 8cf98364
> 1985b39b
> 0a00 00000000 0000003e c027a000 00000001 00000002 0f881093 00000000
> 1749bb49
> 0a20 c02b61ee 00000000 09045a94 1208b528 24116a50 4822d4a0 9045a940
> 20fde7d3
> 0a40 41fbcfa6 83f79f4c 07998bcb 0f331796 1e662f2c 3ccc5e58 7998bcb0
> f3317960
> 0a60 e6144793 cc5e3a75 98cac1b9 c0104c60 63c66c42 c78cd884 8f6f045b
> 1ea8bde5
> 
> Kernel Fault: Code=15 regs=dfff0840 (Addr=1749bb49)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001011
> r0-3     00000000 c0221800 c011e9f8 dfffa220
> r4-7     dfffa200 c0256a3c 00000014 ffd00000
> r8-11    00504d6c c02d9800 c0295794 000000bf
> r12-15   00000000 0000004d 00000001 00000000
> r16-19   f00010f4 f00000ac f00000a4 ffdfffff
> r20-23   dfffa218 ffd00013 ffd00000 0000000b
> r24-27   ffffffff dfffa220 dfffa200 c0266000
> r28-31   1749bb45 00000040 dfff0a80 c012dfc0
> sr0-4    00000000 00000000 00000000 00000000
> sr4-8    00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: c011e710 c011e714
>  IIR: 0f881093    ISR: 00000000  IOR: 1749bb49
> ORIG_R28: 0000003e
