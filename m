From: Meelis Roos <mroos@linux.ee>
Subject: Re: parsic: strange boot crash on a500
Date: Mon, 28 Nov 2016 01:45:47 +0200 (EET)
Message-ID: <alpine.LRH.2.20.1611280013540.19497@math.ut.ee>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee> <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de> <alpine.LRH.2.20.1611272329430.19497@math.ut.ee> <3aa51712-b586-aefc-8e1f-b81b97c0729a@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3aa51712-b586-aefc-8e1f-b81b97c0729a@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Cloned git://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git 
> > and built and installed it.
> > 
> >>    You should build palo 1.96, and then *install* it into
> >>    your palo boot partition:  run "palo -v" once.
> > 
> > palo version 1.96 http://www.parisc-linux.org - Sun Nov 27 21:27:38 EET 2016
> > Partition Start(MB) End(MB) Id Type
> > 1               1      32   f0 Palo
> > 2              33     224   83 ext2
> > 3             225   31696   83 ext2
> > 4           31697   34732   83 ext2
> > F0 partition start sector 32 length 65504
> > do_ra(1, 4, -1, -1, '2/vmlinux root=/dev/sda3 console=ttyS0', 3, -1, 16384, 33538048)
> > check_bootloader 215
> > checksum(0x331d8, 45056) = 0x00000000
> > ipl: addr 16384 size 45056 entry 0x0
> >  ko 0x0 ksz 0 knsz 0 k64o 0x0 k64sz 0 k64nsz 0 rdo 0 rdsz 0
> > <2/vmlinux root=/dev/sda3 console=ttyS0>
> > check_bootloader 670
> > checksum(0x281d0, 45056) = 0x00000000
> > ipl: addr 16384 size 45056 entry 0x0
> >  ko 0x0 ksz 0 knsz 0 k64o 0x0 k64sz 0 k64nsz 0 rdo 0 rdsz 0
> > <2/vmlinux root=/dev/sda3 console=ttyS0>
> 
> Good.
> 
> >> 3. Pull and build Linus' latest git tree to get latest parisc fixes
> > 
> > Built.
> 
> Ok.
> I assume you copied it to /boot/vmlinux then ?

Yes, as I always do.

> >> 4. boot again, palo should report version 1.96 and it should start your new kernel.
> > 
> > Unfortunately, still the same. 
> > Is iplboot precompiled? It shows 08 Oct.
> 
> Yes, it's precompiled (needed if palo is built on other architectures).
> You can compile it yourself with "make iplboot".
> But the precompiled version works for me, so I don't think it's related to your boot problem.
> 
> > Trying Primary Boot Path
> > ------------------------
> > Booting... 
> > Boot IO Dependent Code (IODC) revision 1
> > 
> > 
> > HARD Booted.
> > palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 +0100
> 
> Good.
>  
> > Partition Start(MB) End(MB) Id Type
> > 1               1      32   f0 Palo
> > 2              33     224   83 ext2
> > 3             225   31696   83 ext2
> > 4           31697   34732   83 ext2
> > 
> > PALO(F0) partition contains:
> > 
> > Command line for kernel: 'root=/dev/sda3 console=ttyS0 
> > palo_kernel=2/vmlinux'
> > Selected kernel: /vmlinux from partition 2
> 
> I'm missing here the information of the various sections
> in the vmlinux file which the boot loader usually prints
> here.

Well, I did not leave anything out AFAIK?

> 
> Can you please check (e.g. readelf/objdump) your vmlinux file?
> I assume partition 2 is your /boot partition, in which case it's /boot/vmlinux.

To discontinue, press any key within 10 seconds.

Boot terminated.


---- Main Menu 
---------------------------------------------------------------

     Command                           Description
     -------                           -----------
     BOot [PRI|ALT|<path>]             Boot from specified path
     PAth [PRI|ALT] [<path>]           Display or modify a path
     SEArch [DIsplay|IPL] [<path>]     Search for boot devices

     COnfiguration menu                Displays or sets boot values
     INformation menu                  Displays hardware information
     SERvice menu                      Displays service commands

     DIsplay                           Redisplay the current menu
     HElp [<menu>|<command>]           Display help for menu or command
     RESET                             Restart the system
----
Main Menu: Enter command or menu > bo
Interact with IPL (Y, N, or Cancel)?> y

Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 
+0100

Partition Start(MB) End(MB) Id Type
1               1      32   f0 Palo
2              33     224   83 ext2
3             225   31696   83 ext2
4           31697   34732   83 ext2

PALO(F0) partition contains:
Current command line:
2/vmlinux root=/dev/sda3 console=ttyS0
 0: 2/vmlinux
 1: root=/dev/sda3
 2: console=ttyS0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
'x'    reset and reboot machine
? b

Command line for kernel: 'root=/dev/sda3 console=ttyS0 
palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2

************* SYSTEM ALERT **************
SYSTEM NAME: a500-m
DATE: 11/27/2016 TIME: 21:34:57
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         FLASH     ON         ON
LED State: Unexpected Reboot. Running non-OS code. Non-critical error 
detected.
Check Chassis and Console Logs for error messages.

0x0000007000FF6292 00000000 00000000 - type  0 = Data Field Unused
0x5800087000FF6292 0000740A 1B152239 - type 11 = Timestamp 11/27/2016 
21:34:57
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry

=====================================================================================
When I boot 4.8.0, I do get some more ouptut:

Main Menu: Enter command or menu > bo
Interact with IPL (Y, N, or Cancel)?> y

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 
+0100

Partition Start(MB) End(MB) Id Type
1               1      32   f0 Palo
2              33     224   83 ext2
3             225   31696   83 ext2
4           31697   34732   83 ext2

PALO(F0) partition contains:
Current command line:
2/vmlinux root=/dev/sda3 console=ttyS0
 0: 2/vmlinux
 1: root=/dev/sda3
 2: console=ttyS0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
'x'    reset and reboot machine
? 0
2/vmlinux-4.8.0
Current command line:
2/vmlinux-4.8.0 root=/dev/sda3 console=ttyS0
 0: 2/vmlinux-4.8.0
 1: root=/dev/sda3
 2: console=ttyS0
<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
'x'    reset and reboot machine
? b

Command line for kernel: 'root=/dev/sda3 console=ttyS0 
palo_kernel=2/vmlinux-4.8.0'
Selected kernel: /vmlinux-4.8.0 from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 133632 mediaptr 0x1000
Segment 1 load 00121000 size 22176 mediaptr 0x22000
Segment 2 load 00200000 size 5748800 mediaptr 0x28000
Segment 3 load 00800000 size 1011968 mediaptr 0x5a4000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 4.8.0 (mroos@a500) (gcc version 5.4.0 (Gentoo 5.4.0 p1.0) ) #99 Wed Oct 5 20:36:13 EEST 2016

...

-- 
Meelis Roos (mroos@linux.ee)
