Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lune.perinfo.com (AStrasbourg-201-2-1-11.abo.wanadoo.fr [193.251.1.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1E2E4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 01:35:10 -0700 (MST)
From: "Florent Guiliani" <fguiliani@perinfo.com>
To: "'Scott Eggert'" <seggert@tds.net>,
	<parisc-linux@lists.parisc-linux.org>
Cc: "Nicolas Parpandet (E-mail)" <nparpand@perinfo.com>
Subject: RE: [parisc-linux] E25 lock-up during boot.
Date: Mon, 19 Feb 2001 09:34:49 +0100
Message-ID: <000901c09a4e$d317c1d0$6400030a@florent>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <3A8F20D1.20B10E28@tds.net>
List-ID: <linux-parisc.vger.kernel.org>

I have exactly the same problem!

> -----Message d'origine-----
> De : parisc-linux-admin@lists.parisc-linux.org
> [mailto:parisc-linux-admin@lists.parisc-linux.org]De la part de Scott
> Eggert
> Envoyé : dimanche 18 février 2001 02:10
> À : parisc-linux@lists.parisc-linux.org
> Objet : [parisc-linux] E25 lock-up during boot.
>
>
> I am attempting to ge PA installed on a HP9000 E25.  I am
> able to boot from the
> 0.5 CD image, however it locks-up during the boot.  Any ideas?
>
> Here is the boot output:
>
> Main Menu: Enter command or menu > bo 56/52.4
> Interact with IPL (Y or N)?> n
>
> Booting...
> Boot IO Dependent Code (IODC) revision 4
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
> model   00004800 00000481 00000000 00000000 76d05eab 100000f0
> 00000004 00000072
> 00000072
> vers    0000000b
> CPUID vers 0 rev 0
> Searching for devices in PDC firmware... processor hpa 0xfffbe000
> a newer box...
> Found devices:
> 1. Orville UX Core BA (11) at 0xf0100000, versions 0x12, 0x0,
> 0x81, 0x0, 0x0
> 2. Orville Core Lan (802.3) (10) at 0xf0107000, versions
> 0x12, 0x0, 0x8a, 0x0, 0
> x0
> That's a total of 2 devices.
> No CPUs reported by firmware - probing...
> Found CPU at fffbe000
> CPU(s): 1 x PA7100LC (PCX-L) at 48.000000 MHz
> Linux version 2.4.0-test6
> (pjlahaie@elenuial.thepuffingroup.com) (gcc version 2.
> 96 20000925 (experimental)) #32 Mon Nov 6 10:20:58 EST 2000
> free_bootmem(0x2dc000, 0xfd24000)
> initrd: 00000000-00000000
> pagetable_init
> On node 0 totalpages: 65536
> zone(0): 32768 pages.
> zone(1): 32768 pages.
> zone(2): 0 pages.
> Kernel command line: ROOT=/ TERM=LINUX root=/dev/scd0
> trap_init
> Calibrating delay loop... 47.82 BogoMIPS
> Memory: 254336k available
> Dentry-cache hash table entries: 32768 (order: 6, 262144 bytes)
> Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
> Page-cache hash table entries: 65536 (order: 6, 262144 bytes)
> Inode-cache hash table entries: 16384 (order: 5, 131072 bytes)
> POSIX conformance testing by UNIFIX
> Lasi version 0 at 0xf0100000 found.
>
>
>
>
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
