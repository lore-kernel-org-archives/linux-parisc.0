Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA28928
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 09:28:10 -0600
Sender: mkp@mkp.net
To: parisc-linux@thepuffingroup.com
From: "Martin K. Petersen" <mkp@linuxcare.com>
Date: 26 Oct 2000 11:30:00 -0400
Message-ID: <yq1itqf1uyv.fsf@jaguar.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Boot log from my C160
List-ID: <linux-parisc.vger.kernel.org>


Richard/Grant,

Output from my C160.  Only disk sits off the 720.


Firmware Version  6.1

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      160 MHz    Active                 Functional         512 KB/512 KB

  Central Bus Speed (in MHz) :        120

  Available memory (bytes)    : 536870912
  Good memory required (bytes):   10240000 

  Primary boot path:    PCI4.0.0
  Alternate boot path:  LAN.0.0.0.0.0.0
  Console path:         GRAPHICS(0)
  Keyboard path:        PS2

CPU 0
WARNING:  Self tests have been disabled as a result of FASTBOOT
          being enabled.  To enable self tests, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
WARNING:  Memory has been initialized, but not tested as a result of
          FASTBOOT being enabled.  To test memory, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


Processor is starting auto boot process.

To discontinue, press any key within 10 seconds.

Boot terminated.


------- Main Menu -------------------------------------------------------------

        Command                         Description
        -------                         -----------
        BOot [PRI|ALT|<path>]           Boot from specified path
        PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path
        SEArch [DIsplay|IPL] [<path>]   Search for boot devices

        COnfiguration [<command>]       Access Configuration menu/commands
        INformation [<command>]         Access Information menu/commands
        SERvice [<command>]             Access Service menu/commands

        DIsplay                         Redisplay the current menu
        HElp [<menu>|<command>]         Display help for menu or command
        RESET                           Restart the system
-------
Main Menu: Enter command > bo lanm 
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 0060b0-07e4a5
System IP Address 10.0.0.7
Server IP Address 10.0.0.5

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl mkp@jaguar Thu Oct 26 10:59:16 EDT 2000
0/vmlinux 2118157 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=10.0.0.5 '
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100128 first 00100000 n 4
Segment 0 load 00100000 size 1426012 mediaptr 0x1000
Segment 1 load 0025e000 size 182664 mediaptr 0x15e000
Segment 2 load 0028c000 size 118220 mediaptr 0x18b000
Segment 3 load 002ac000 size 8192 mediaptr 0x1a8000
branching to kernel entry point 0x00100128
Set default PSW W bit to 0
PDC Console Initialized
The Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02dd000
arg0 0x504d40  arg1 0x504d40
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=10.0.0.5 '
PALO initrd 0-0
model   000059b0 00000481 00000000 00000002 778fe270 100000f0 00000008 000000b2 000000b2
vers    00000205
cpuid   000001c9
CPUID vers 14 rev 9
Searching for devices in PDC firmware... processor hpa 0xfffa0000
a newer box...
Found devices:
1. Unknown device (4) at 0xf200c000, versions 0x3b, 0x0, 0x89, 0x0, 0x80
2. Raven U/L2 Core BA (11) at 0xffd00000, versions 0x3b, 0x0, 0x81, 0x0, 0x0
3. Raven U/L2 Core RS-232 (10) at 0xffd05000, versions 0x3b, 0x0, 0x8c, 0x0, 0x0
4. Raven U/L2 Core SCSI (10) at 0xffd06000, versions 0x3b, 0x0, 0x82, 0x0, 0x0
5. Raven U/L2 Core Lan (802.3) (10) at 0xffd07000, versions 0x3b, 0x0, 0x8a, 0x0, 0x0
6. Raven U/L2 Core Centronics (10) at 0xffd02000, versions 0x3b, 0x0, 0x74, 0x0, 0x0
7. Raven U/L2 Core Audio (10) at 0xffd04000, versions 0x3b, 0x4, 0x7b, 0x0, 0x0
8. Raven U/L2 Core PC Keyboard (10) at 0xffd08000, versions 0x3b, 0x0, 0x84, 0x0, 0x0
9. Raven U/L2 Core PC Keyboard (10) at 0xffd08100, versions 0x3b, 0x0, 0x84, 0x0, 0x0
10. Raven Backplane Wax BA (11) at 0xffe00000, versions 0x17, 0x0, 0x8e, 0x0, 0x0
11. Raven Backplane Wax EISA BA (11) at 0xfc000000, versions 0x17, 0x0, 0x90, 0x0, 0x0
12. Raven Backplane Wax HIL (10) at 0xffe01000, versions 0x17, 0x0, 0x73, 0x0, 0x0
13. Raven Backplane RS-232 (10) at 0xffe02000, versions 0x17, 0x0, 0x8c, 0x0, 0x0
14. Gecko GSC Core Graphics (10) at 0xfa000000, versions 0x16, 0x0, 0x85, 0x0, 0x0
15. U2-IOA BC GSC+ Port (7) at 0xf203f000, versions 0x501, 0x1, 0xc, 0x3, 0x0
16. U2-IOA BC GSC+ Port (7) at 0xf103f000, versions 0x501, 0x1, 0xc, 0x3, 0x0
17. Dino PCI Bridge (13) at 0xf2000000, versions 0x680, 0x3, 0xa, 0x0, 0x0
That's a total of 17 devices.
CPU(s): 0 x PA8000 (PCX-U) at 160.000000 MHz
Linux version 2.4.0-test6 (mkp@jaguar) (gcc version 2.96 20000925 (experimental)) #3 Thu Oct 26 11:00:50 EDT 2000
free_bootmem(0x2e1000, 0x1fd1f000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 131072
zone(0): 65536 pages.
zone(1): 65536 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX root=/dev/nfs nfsroot=10.0.0.5 
trap_init
Calibrating delay loop... 319.49 BogoMIPS
Memory: 511588k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
parport0: PC-style at 0xffd02800, irq 536 [PCSPP,TRISTATE]
Found i82596 at 0xffd07000, IRQ 535
early initialization of device eth0 is deferred
Initializing lasi keyboard port at 0xffd08000...
Initializing lasi mouse port at 0xffd08100...
Found HIL at 0xffe01000, IRQ 798
No handler for interrupt 259 !
HIL: timed out, assuming no keyboard present.
Warning : device (10, 0x17, 0x0, 0x73, 0x0) NOT claimed by HIL 712, 715 or similiar
Dino version 3.1 (bridge mode) found at 0xf2000000
ccio found U2 GSC+ BC at 0xf203f000
ccio found U2 GSC+ BC at 0xf103f000
ccio: already initialized one device
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 32768)
Starting kswapd v1.7
pty: 256 Unix98 ptys configured
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 534
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: Good, target data areas are dma coherent
scsi0: test 1 completed ok.
: Zalon vers field is 0x1, IRQ 260
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
ncr53c720-0: restart (scsi reset).
sym53c8xx: at PCI bus 1, device 4, function 0
sym53c8xx: setting PCI_COMMAND_IO PCI_COMMAND_MEMORY...
sym53c8xx: setting PCI_COMMAND_MASTER...(fix-up)
kernel BUG at sym53c8xx.c:719!
sym53c8xx: 53c875E detected 
kernel BUG at sym53c8xx.c:719!
sym53c875E-0: rev 0x26 on pci bus 1 device 4 function 0 irq 1024
sym53c875E-0: NCR clock is 40772KHz
sym53c875E-0: ID 7, Fast-20, Parity Checking
sym53c875E-0: on-chip RAM at 0xf2fff000
sym53c875E-0: restart (scsi reset).
sym53c875E-0: Downloading SCSI SCRIPTS.
scsi0 : LASI/Simple 53c7xx
scsi1 : ncr53c8xx - version 3.3b
scsi2 : sym53c8xx - version 1.6b
scsi : 3 hosts.
scsi0: Unable to abort command for target 0
scsi0: Unable to send Bus Device Reset for target 0
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 02, sstat0 = 20, sstat1 = 00, dstat = 00
scsi0: dsp = 00080020 (script[0x0008]), dsps = 00080080, target = 0
scsi0: Failing command for ID0
scsi0: Unable to abort command for target 0
scsi0: Unable to abort command for target 1
scsi0: Unable to send Bus Device Reset for target 1
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 02, sstat0 = 20, sstat1 = 00, dstat = 00
scsi0: dsp = 00080020 (script[0x0008]), dsps = 00080080, target = 0
scsi0: Failing command for ID0
scsi0: Unable to abort command for target 1
  Vendor: À$ˆ À Bà  Model: À,˜ À, |À,  À) @  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 00
Detected scsi disk sda at scsi0, channel 0, id 1, lun 0
scsi0: Unable to abort command for target 2
scsi0: Unable to send Bus Device Reset for target 2
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 02, sstat0 = 20, sstat1 = 00, dstat = 00
scsi0: dsp = 00081020 (script[0x0408]), dsps = 00081080, target = 0
scsi0: Failing command for ID1

Dumping Stack from dfe04000 to dfe049c0:
4000 00000000 00000040 00000000 00000000 c027346c 00000000 00000000 ffffffff
4020 00000001 00000000 00000000 00000000 00000000 00000000 ffffffff c0273384
4040 c0273384 c02ac000 dfe28000 c027960c 00000000 00000000 00000000 00000000
4060 00000000 00000000 00000005 00000001 00000000 00000001 00000000 dfff0000
4080 dfff0000 00000000 00000000 dfe28000 00000000 c02caec8 00000000 dfe0409c
40a0 dfe0409c dfe040a4 c01196ec 00000000 00000000 00000000 00000000 00000000
40c0 00000000 00000000 00000000 00000000 00000000 00000000 dfe04000 c011c4b0
40e0 00000000 0000000c 00000000 00000000 00000145 00000000 00000151 00000000
4100 00000000 00000000 00000000 00000000 00000000 80000000 00000000 00000000
4120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
41a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 fffffeff
41c0 00000000 ffffffff 00000000 c0273fb4 ffffffff ffffffff ffffffff ffffffff
41e0 ffffffff ffffffff 00800000 05000000 00000000 ffffffff ffffffff ffffffff
4200 00002000 00002000 00000400 00000400 ffffffff ffffffff ffffffff ffffffff
4220 00007363 73695f65 685f3000 00000000 00000000 00000000 00000000 00000000
4240 00000000 00000000 aa8e032d ffa95beb 4efd3eff dfeff75f ff7fffbf ffff7fff
4260 7fdbef3b febf7fff ffff9fff fb5fffff ad6deffd 9fbcdfff ff9ff7ff fefffffe
4280 ffffd7fe ffffffff ffffffff ffdfffff feffebff ff7ffeff 7fffafbf fefe8aff
42a0 effe6fff ffffffef ffeffeff dffe1260 c01c6d00 fff9fff7 00000000 fbf6ffff
42c0 fbefdfff fbbb3e7f ffffffff ffedf7db fffbffff f7e3fefb 7dffffff ef7fffff
42e0 ffef6dff be9dfbff ffffffff efff7fdf 7bfbabbf d3fbbfde fdffffbc ffebffff
4300 7ff4feff ffeddbff 7fdfdf5e fdfeffff 59efffff bffeff7f d7ffbf7f f7ffffff
4320 ff6fdffd dfbdffed fffeff7d ffefffff 7bd77fff fffcb77f f7ffeffb fbefffbf
4340 ffffdfff ddfeeb7e 00000000 00000000 00000000 00000000 00000000 00000000
4360 00000000 00000000 00000000 00000000 c011ab80 c011ab84 c0285000 00000000
4380 00000104 c028533c 00000000 f200c800 4efd3eff dfe14000 0000000d 2b6a2000
43a0 c024798c dfe14038 ffff9fff fb5fffff ad6deffd c029c518 ff9ff7ff fefffffe
43c0 ffffd7fe ffffffff 0004ff0b c0285000 c029c518 dfe14000 0000000b dfff08c8
43e0 dffe1360 c02855e4 dfe14038 00000000 c0247800 c01044a0 00000000 ffffffff
4400 000000fd f0100000 0000003c 0000003e dfe048c0 c0103cf4 c02b21e2 00000004
4420 c02b21c7 0000001a c02b21e2 00000000 dfe14b0c c025e000 00000026 0004e200
4440 0027a000 00000000 c0279040 dfe20040 00000000 dfe03000 00000000 00000000
4460 ffffffff ffffffff 00000000 dfe04468 00000000 00000000 00000000 00000000
4480 00000000 00000000 34bb9e06 3da1043d 69773c0c 7b42087a d2ee7818 f68410f4
44a0 a5aa4562 ed7e94bb 4b223f96 da8b9c25 9632ca7e b5618d19 2c1321ae 6ab5af61
44c0 5826435c d56b5ec2 b03a33ea aaa008d7 6002d286 5536a4fd c005a50c aa6d49fa
44e0 807dff4a 54ac26a7 00fbfe94 c0103c48 0181487a 52c62fcf 030290f4 a58c5f9e
4500 067394ba 4b6e0a6f 00000000 00000000 00000000 dfe04514 dfe04514 dfe0451c
4520 dfe0451c dfe04524 00000000 00000000 00000000 dfe04514 dfe04514 dfe0451c
4540 dfe0451c dfe04524 dfff0940 dfe04000 c027960c 00000000 dfff0000 84d1aa9d
4560 d038b4de 09d5e069 a07169bc 13abc0d2 40e2d378 275781a4 81c5a6f0 4eaf0348
4580 038b4de0 9d5e0690 07602e92 3acab873 0000000f 00000000 c024952c dfe04222
45a0 3b77c1c2 d62376cb 769936d6 c01c6f0c ed44d8fe 581604d9 da89b1fc b02c09b2
45c0 dfe04508 dfe04524 00000000 dfe04000 ffffffff 00000000 0000000a c028d730
45e0 c02db800 c0285000 dfe04524 dfe04508 dfe04524 dfe04000 dffe1260 dfe04524
4600 dfe04508 dfe04524 dfe04000 dffe1260 dfe04524 0c000000 0000000b dffe1260
4620 dfffc800 dd4745f5 d4eb92be c01c6938 a9a1902e 7586c821 5343205c eb0d9042
4640 00000001 00000000 dfe04000 dfe04508 00000000 00000000 00000000 00000000
4660 00000000 00000000 00000000 c01c60ac 00000000 00000000 00000000 00000000
4680 0000000b c0273000 00000000 00000000 00000017 dfe04758 00000000 c024c92c
46a0 dfe0469c dfe046a4 00000000 c01d1850 00001de0 dfe04688 c01c5ab8 dfe0469c
46c0 00002000 00001000 00002001 dfffcc00 0000ffff 00000000 dfffce00 dffe1260
46e0 dfffce00 00002000 00001000 00002001 dfffcc00 0000ffff 00000000 dfffce00
4700 dffe1260 dfffce00 00000000 00081080 00000060 00000001 00000000 c024c908
4720 ffff9fff fb5fffff ad6deffd c01d1738 ff9ff7ff fefffffe ffffd7fe ffffffff
4740 dfffcc00 00001002 dfe0471c 00000020 f000168c f0100000 000000fd dffe1260
4760 00001002 00000000 00000020 c024c800 00080000 dffe1260 dffe12e0 00000002
4780 0004000a c0120800 c01c5534 dfffcc00 00001000 00000002 dffe12e0 dffe1260
47a0 00080000 c024c800 00000020 00000000 00001002 dffe1260 000000fd f0100000
47c0 f000168c f000020c f0000204 c01c8d1c c01c89f0 0000000a c01c5520 00000060
47e0 c02734a0 c02734a0 dfffcc68 c025e000 00000001 00000000 dfe049c0 c01d1738
4800 aa8e032d ffa95beb 4efd3eff dfeff75f ff7fffbf ffff7fff 7fdbef3b febf7fff
4820 ffff9fff fb5fffff ad6deffd 9fbcdfff ff9ff7ff fefffffe ffffd7fe ffffffff
4840 ffffffff ffdfffff feffebff ff7ffeff 7fffafbf fefe8aff effe6fff ffffffef
4860 ffeffeff effffffd 5bff6ddf fff9fff7 ffdfffff fbf6ffff fbefdfff fbbb3e7f
4880 ffffffff ffedf7db fffbffff f7e3fefb 7dffffff ef7fffff ffef6dff be9dfbff
48a0 ffffffff efff7fdf 7bfbabbf d3fbbfde fdffffbc ffebffff 7ff4feff ffeddbff
48c0 7fdfdf5e fdfeffff 59efffff bffeff7f d7ffbf7f f7ffffff ff6fdffd dfbdffed
48e0 fffeff7d ffefffff 7bd77fff fffcb77f f7ffeffb fbefffbf ffffdfff ddfeeb7e
4900 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4920 00000000 00000000 c0120a4c c0120a50 713683e8 2a1ea43c e26d07d0 543d4878
4940 00000000 00000000 00000001 00000100 0000001d 0e931288 00000000 c01c89f4
4960 0000000a dffe12e0 dfffca00 c0107d08 3b0d8274 132a565e 761b04e8 2654acbc
4980 80000000 c02ca800 dfe04680 00000100 00000000 00002000 000003e8 00001000
49a0 00002000 00001002 dffe1260 c01046e0 f0100000 f000168c f000020c f0000204

Data access rights fault in kernel: Code=26 regs=dfe04780 (Addr=c01c89f4)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001010
r0-3     00000000 c0120800 c01c5534 dfffcc00
r4-7     00001000 00000002 dffe12e0 dffe1260
r8-11    00080000 c024c800 00000020 00000000
r12-15   00001002 dffe1260 000000fd f0100000
r16-19   f000168c f000020c f0000204 c01c8d1c
r20-23   c01c89f0 0000000a c01c5520 00000060
r24-27   c02734a0 c02734a0 dfffcc68 c025e000
r28-31   00000001 00000000 dfe049c0 c01d1738
sr0-4    00000000 00000000 00000000 00000000
sr4-8    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c0120a4c c0120a50
 IIR: 0e931288    ISR: 00000000  IOR: c01c89f4
ORIG_R28: 00000000

-- 
Martin K. Petersen, Principal Linux Consultant, Linuxcare, Inc.
mkp@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
