Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA21036
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 12:20:47 -0700
Date: Mon, 15 Jan 2001 13:22:14 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100 
In-Reply-To: <Pine.LNX.4.21.0101151144470.23087-100000@maestro.symsys.com>
Message-ID: <Pine.LNX.4.21.0101151256070.23322-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


Okay, I grabbed the cross-compiler and various sources and managed to
build a booting image.  Woohoo!  I also tried the lifimage you just posted
to the FTP site.  Both kernels died at GSC detection because it didn't
know the address f5fbf000.  I made this little change to ccio-dma.c:

--- arch/parisc/kernel/ccio-dma.c.orig  Mon Jan 15 12:40:05 2001
+++ arch/parisc/kernel/ccio-dma.c       Mon Jan 15 13:05:01 2001
@@ -1174,6 +1174,7 @@
 ** that can't be detected by PA/EISA/PCI bus walks.
 */
        switch((long) d->hpa) {
+       case 0xf5fbf000L:       /* C1O0 (wild guess!) */
        case 0xf7fbf000L:       /* C110 IOA0 LBC (aka GSC port) */
        case 0xf3fbf000L:       /* C110 IOA0 LBC (aka GSC port) */
                /* ccio_hpa same as C200 IOA0 */                                

It got past that point but crashed later.  Full boot log follows. I'm
looking at excluding the GSC stuff to see if the problem goes
away.  Updates at 11.

- Greg


Firmware Version  1.2

Duplex Console IO Dependent Code (IODC) revision 0

------------------------------------------------------------------------------
   (c) Copyright 1990-1996, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------

      0      100  Mhz   Active                 Functional          256 KB

  Central Bus Speed (in mhz)  :        100  
  Available Memory (bytes)    :  134217728  
  Good Memory Required (bytes):   26447872  


   Primary boot path:    core.FWSCSI.6.0
   Alternate boot path:  core.SCSI.2.0
   Console path:         GRAPHICS3
   Keyboard path:        core.PS2


Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

Boot terminated.


------- Main Menu -------------------------------------------------------------

        Command                         Description
        -------                         -----------

        BOot [PRI|ALT|<path>]           Boot from specified path
        PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path
        SEArch [DIsplay|IPL] [<path>]   Search for boot devices

        COnfiguration menu              Displays or sets boot values
        INformation menu                Displays hardware information
        SERvice menu                    Displays service commands

        DIsplay                         Redisplay the current menu
        HElp [<menu>|<command>]         Display help for menu or command
        RESET                           Restart the system
-------
Main Menu: Enter command or menu > boot lan
Interact with IPL (Y or N)?> n

Booting... 
Network Station Address 080009-e8832b

Boot IO Dependent Code (IODC) revision 0


HARD Booted.
palo ipl root@ingram Mon Jan 15 12:24:52 CST 2001
0/vmlinux 2138962 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=10.10.10.2 console=ttyS0'
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100160 first 00100000 n 5
Segment 0 load 00100000 size 1431536 mediaptr 0x1000
Segment 1 load 0025e000 size 173080 mediaptr 0x15f000
Segment 2 load 0028c000 size 117492 mediaptr 0x18a000
Segment 3 load 002ac000 size 8192 mediaptr 0x1a7000
Segment 4 load 002d7144 size 496 mediaptr 0x1a9144
branching to kernel entry point 0x00100160
Set default PSW W bit to 0
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02d8000
start_parisc(0x504d70,0x504d70,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=10.10.10.2 console=ttyS0'
PALO initrd 0-0
model   00005920 00000481 00000000 00000002 782482ee 100000f0 00000004 0000008a 0000008a
vers    0000000d
cpuid   0000016d
CPUID   vers 11 rev 13
model   9000/777/C100
led_init: CPU_HVERSION 592
led_init: chassis info: model 2, lcd_width=0, cmd_delay=40, ret0=8, ret1=8
LED display at f0190000 registered
Searching for devices in PDC firmware... processor hpa 0xfffa0000
a newer box...
Found devices:
1. Coral SGC Graphics (10) at 0xf6000000, versions 0x4, 0x0, 0x77, 0x0, 0x0
2. SkyHawk 100/120 FW-SCSI (4) at 0xf5f8c000, versions 0x1f, 0x0, 0x89, 0x0, 0x80
3. U2-IOA BC GSC+ Port (7) at 0xf5fbf000, versions 0x501, 0x1, 0xc, 0x0, 0x0
4. Raven T' Core BA (11) at 0xffd00000, versions 0x32, 0x0, 0x81, 0x0, 0x0
5. Raven T' Lasi Core RS-232 (10) at 0xffd05000, versions 0x32, 0x0, 0x8c, 0x0, 0x0
6. Raven T' Core SCSI (10) at 0xffd06000, versions 0x32, 0x0, 0x82, 0x0, 0x0
7. Raven T' Core LAN (802.3) (10) at 0xffd07000, versions 0x32, 0x0, 0x8a, 0x0, 0x0
8. Raven T' Core Centronics (10) at 0xffd02000, versions 0x32, 0x0, 0x74, 0x0, 0x0
9. Raven T' Core PC Floppy (10) at 0xffd0a000, versions 0x32, 0x0, 0x83, 0x0, 0x0
10. Raven T' Audio (10) at 0xffd04000, versions 0x32, 0x0, 0x7b, 0x0, 0x0
11. Raven T' Core PC Keyboard (10) at 0xffd08000, versions 0x32, 0x0, 0x84, 0x0, 0x0
12. Raven T' Core PC Keyboard (10) at 0xffd08100, versions 0x32, 0x0, 0x84, 0x0, 0x0
13. Raven T' Wax BA (11) at 0xffe00000, versions 0x1e, 0x0, 0x8e, 0x0, 0x0
14. Raven T' Wax EISA BA (11) at 0xfc000000, versions 0x1e, 0x0, 0x90, 0x0, 0x0
15. Raven T' Wax RS-232 (10) at 0xffe02000, versions 0x1e, 0x0, 0x8c, 0x0, 0x80
16. Raven T' Wax HIL (10) at 0xffe01000, versions 0x1e, 0x0, 0x73, 0x0, 0x0
That's a total of 16 devices.
No CPUs reported by firmware - probing...
Found CPU at fffa0000
CPU(s): 1 x PA7200 (PCX-T') at 100.000000 MHz
Linux version 2.4.0-test10 (root@ingram) (gcc version 2.96 20000925 (experimental)) #15 Mon Jan 15 12:40:31 CST 2001
free_bootmem(0x2d9000, 0x7d27000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=10.10.10.2 console=ttyS0
trap_init
Calibrating delay loop... 99.74 BogoMIPS
Memory: 125840k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
Found i82596 at 0xffd07000, IRQ 87
early initialization of device eth0 is deferred
Initializing Lasi PS/2-keyboard port at 0xffd08000...
Support for Lasi PS/2-psaux not yet available !
ccio found U2 GSC+ BC at 0xf5fbf000
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
Lasi PS/2 transmit buffer timeout
Lasi PS/2 transmit buffer timeout
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth0: 82596 at 0xffd07000, 08 00 09 E8 83 2B IRQ 87.
82596.c $Revision: 1.14 $
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled

Dumping Stack from c7f9c000 to c7f9ca80:
c000 00000000 00000040 00000000 00000000 c027346c 00000001 00000000 ffffffff
c020 00000000 00000000 00000000 00000000 00000000 00000000 ffffffff c0273384
c040 c0273384 00000034 c7f7c000 c02ac000 c027860c 00000000 00000000 00000000
c060 00000000 00000000 00000000 00000001 00000000 00000000 00000000 00000000
c080 00000000 c02ac000 c02ac000 c7f70000 00000000 00000000 c7f70098 c02ac098
c0a0 00000000 c02c7978 00000000 c7f9c0ac c7f9c0ac c7f9c908 00000000 00000000
c0c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c0e0 c7f9c000 c011c0fc 00000000 00000019 00000000 00000000 00000025 00000000
c100 0000003e 00000000 00000000 00000000 00000000 00000000 00000000 80000000
c120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1c0 00000000 fffffeff 00000000 ffffffff 00000000 c027401c ffffffff ffffffff
c1e0 ffffffff ffffffff ffffffff ffffffff 00800000 05000000 00000000 ffffffff
c200 ffffffff ffffffff 00000800 00000800 00000400 00000400 ffffffff ffffffff
c220 ffffffff ffffffff ffffffff ffffffff 00007377 61707065 72000000 00000000
c240 00000000 00000000 00000000 00000000 00000000 00000000 00008000 21998304
c260 21998304 c013e478 00010000 c7ffeba0 c0225e0c c0236370 000000f0 00504d70
c280 00000000 c011a85c c02c6000 00008000 21998304 c02c6000 00000000 0004000a
c2a0 c02734a0 0000000b 00000024 0000003c 0000003e c0273000 00000001 00000000
c2c0 c01002a0 c02b2b4b 00000000 c02b2b6f 0000000b c02734a0 c0273000 f00000ac
c2e0 f00000a4 000000ff ffd05800 ffd05800 ffd05800 00000060 ffffffff ffd05800
c300 002b2540 c025e000 00000000 00000000 c02ac8c0 00000000 000b0800 00000000
c320 0000001f 00000000 0000001f 00000000 0000001f 00000000 00000000 00000000
c340 00000000 00000000 00000000 00000000 00000000 00000000 00000010 00000020
c360 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000 45e69c6a 25b7ea20
c380 41800000 00000000 00000010 00000010 00000000 00000000 00000040 00000080
c3a0 00000100 00000200 00000400 00000800 7fffffff 7fffffff 41000000 00000000
c3c0 7fffffff 7fffffff 40800000 00000000 41000000 00000000 40300000 00000000
c3e0 40200000 00000000 40200000 00000000 41800000 7fffffff 40000000 00000000
c400 40000000 00000000 40800000 00000000 41000000 00000000 00000000 00000000
c420 c7f9c800 c0105cf4 00000000 00000000 00000000 00000000 00000000 00000000
c440 c011a84c c011a850 40800000 00000000 00279000 00000000 c0278040 c0278064
c460 00000000 c0278204 00000000 00000000 00000000 c7f9c470 00000000 00000000
c480 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c4a0 cf7928b3 9ef25167 3de4a2cf 7bbff0cc f70954ca ee12a995 dc25532b b84aa657
c4c0 70954caf e15c2c0c c2b85819 8570b033 0ae16067 15b4759c 2b1e5e6a 564a0986
c4e0 ace2a65e 59c54cbd b3fc2c28 c0105c48 cf8605f0 9f0c0be1 3e1817c3 7c469ad4
c500 c02ac000 00000000 c02ac640 c7dc07d7 8fb80faf 1f701f5f 3e968bec 7d5ba28a
c520 fac1f046 f583e08d eb07c11b c01002b4 ac1f046f 583e08df b00aa4ec 601549d9
c540 c05c26e0 80b84dc1 01709b83 02978254 c7f9c000 c027860c c02ac000 00000000
c560 c02ac640 aea9ca4e 5d53949d bad19c68 75a338d1 eb30c4f0 d66189e1 acc313c3
c580 59862787 b37afa5c 66f5f4b9 cd9d5c20 9b3ab841 36757083 6c9c5454 d94e1dfa
c5a0 b29c3bf5 653877eb ca065a84 c028d128 28196a13 50446174 a0fe77ba 41fcef75
c5c0 c027c000 00000001 0e4b1bb0 1ce08232 00000060 ffffffff 00000021 c0252c78
c5e0 99146cbb 3228d977 642707bc c028d06c 90717455 20e2e8ab 41b36404 83107d5a
c600 f00000a4 f00000ac f00010f4 00000000 00000001 0000004d 00000000 000000c5
c620 c028d8e0 000000f0 c02c7800 c02ca000 c025e000 c02c6000 c02a8af4 c02a8ab4
c640 c02a8af4 c02a8ab0 00000000 00000000 0000004d 00000000 000000c5 c028d8e0
c660 000000f0 c02c7800 c02ca000 c0294b6c c02c6000 c02a8af4 c02a8a94 c02c6000
c680 c02c2c8c c02c2d48 c027f4d0 00000040 c02421d8 c0241dcc c0241e80 c02421dc
c6a0 00000000 00000000 c02ca000 c0294ec8 c02c6000 00010800 c7f9c608 c02734a0
c6c0 c02c2d48 c02c2c8c 00005000 c027c6d0 00000001 c7ffeea0 c0242000 c0242000
c6e0 fffffffc c02c2d48 c0191ab0 c0190558 c027c61c 10000080 c02c2c8c c02c2d48
c700 c027f4d0 00000040 c0241f38 c0281c94 c0242000 00000000 c02c2c8c c02c2c8c
c720 c02c6000 c02c1fc4 c01e3e7c c011ace4 c0281dc0 c0281c64 c7f9c900 00000000
c740 c02c7844 00000000 c027f5a0 c02c7840 00000000 0000003c 0000003e c0273000
c760 00000001 c02b2ba3 00000004 c0155604 00000054 c02b2ba3 0000000b c02734a0
c780 c7f97eec 00008124 f00000a4 000000ff ffd05800 ffd05800 ffd05800 00000060
c7a0 ffffffff ffd05800 002b2540 c0294dc8 00000000 00000000 c7f9c980 00000000
c7c0 000b0800 00000000 0000001f 00000000 0000001f 00000000 0000001f 00000000
c7e0 00000000 00000000 00000000 c018e784 00000000 00000000 00000000 00000000
c800 00000010 00000020 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000
c820 45e69c6a 25b7ea20 41800000 00000000 00000010 00000010 00000000 00000000
c840 0006000b c02b2580 c018e784 c02c2c88 00000013 0000002f c02c3a6c c027f5a0
c860 ffffffff c0273000 c0191ab0 c02c2d48 fffffffc c0242000 c0242000 c02d49e8
c880 c0242000 c0242000 c02c2ccc 00000000 c02c3a6c c02c7000 ffffffff 00000040
c8a0 00000093 00000002 00000000 c025e000 00002580 0000002f c7f9ca80 c0294d90
c8c0 000b0800 00000000 0000001f 00000000 0000001f 00000000 0000001f 00000000
c8e0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c900 00000010 00000020 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000
c920 45e69c6a 25b7ea20 41800000 00000000 00000010 00000010 00000000 00000000
c940 00000040 00000080 00000100 00000200 00000400 00000800 7fffffff 7fffffff
c960 41000000 00000000 7fffffff 7fffffff 40800000 00000000 41000000 00000000
c980 40300000 00000000 40200000 00000000 40200000 00000000 41800000 7fffffff
c9a0 40000000 00000000 40000000 00000000 40800000 00000000 41000000 00000000
c9c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c9e0 00000000 00000000 c010c8fc c010c900 00000010 00000010 00000000 00000000
ca00 00000000 00000000 00000001 00000020 00000017 0e781096 00000000 0000000c
ca20 00000000 00000000 7fffffff c0103504 40800000 00000000 41000000 00000000
ca40 80000000 c02c7800 c7f9c740 00000020 00000000 00000000 41800000 7fffffff
ca60 40000000 00000000 40000000 c0106704 40800000 00000000 41000000 00000000

Data access rights fault in kernel: Code=26 regs=c7f9c840 (Addr=0000000c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001011
r0-3     00000000 c02b2580 c018e784 c02c2c88
r4-7     00000013 0000002f c02c3a6c c027f5a0
r8-11    ffffffff c0273000 c0191ab0 c02c2d48
r12-15   fffffffc c0242000 c0242000 c02d49e8
r16-19   c0242000 c0242000 c02c2ccc 00000000
r20-23   c02c3a6c c02c7000 ffffffff 00000040
r24-27   00000093 00000002 00000000 c025e000
r28-31   00002580 0000002f c7f9ca80 c0294d90
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c010c8fc c010c900
 IIR: 0e781096    ISR: 00000000  IOR: 0000000c
ORIG_R28: 00000000
