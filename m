Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from parallel.hpc.unsw.edu.au (parallel.hpc.unsw.edu.au [129.94.176.241])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC4EF482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Apr 2002 22:53:58 -0600 (MDT)
From: Duraid Madina <Duraid@unsw.edu.au>
Message-Id: <200204100453.g3A4rWV04513@parallel.hpc.unsw.edu.au>
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 10 Apr 2002 14:53:32 +1000 (EST)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="%--multipart-mixed-boundary-1.4418.1018414412--%"
Subject: [parisc-linux] shiny new rp2430 (A400) won't boot :-(
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--%--multipart-mixed-boundary-1.4418.1018414412--%
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all,

	My nice new rp2430 (looks like an A400, but has a PA-8700 at 650MHz
inside, not sure if this is the only difference..) arrived this morning. I
hooked up an external (Sun) SCSI CDROM drive, an internal Fujitsu SCA-2
disk, and an RS232 console (well, FreeBSD 486 machine ;)

	Unfortunately, it doesn't boot! The kernel seems to load okay and
probe around a bit, but as soon as it gets into the midst of SCSI things,
the box either locks (I've only seen this happen once) or, generates a
(firmware, I presume) 'SYSTEM ALERT' message, which doesn't mean a whole lot
to me.

	For the record, as soon as I power on this system, the 'Attention'
and 'Fault' lights flash, but I have no idea if this is normal, or if not,
why they're flashing.

	A transcript of the boot session is attached. I hope someone can
help me out here!

	Many thanks in advance,

	Duraid

--%--multipart-mixed-boundary-1.4418.1018414412--%
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Description: C program text
Content-Disposition: attachment; filename="bootlog.txt"

/* this is the bootlog of an HP rp2430 (HP part #A6889A) attempting to boot
linux (pa-linux 0.9.3) from an external CDROM drive. As you'll see, it fails 
right about where I'd expect SCSI devices to be probed. Hmmm.

This system is 'out of the box', apart from the external CDROM drive (an old
Sun one) and the internal Fujitsu SCA disk which were added.

If you can help or have any idea what's going on, please let me know,
I'm duraid@unsw.edu.au - thanks! */

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dallas# cu -s 9600 -l /dev/cuaa0
Connected.

********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         FLASH     ON         ON
LED State: Unexpected Reboot. Running non-OS code. Non-critical error
detected.
Check Chassis and Console Logs for error messages.

platform                  config                     626F
processor                 test                       1142
processor                 test                       1100
processor                 test                       1100
processor                 test                       1100
processor                 test                       1100
processor                 test                       1100
PDH                       config                     322F
PDH                       test                       3149
PDH                       test                       3160
platform                  test                       616A
processor                 test                       1146
processor                 INIT                       1701
processor                 test                       1110
processor                 test                       1111
processor                 test                       1112
processor                 test                       1113
processor                 test                       1114
processor                 test                       1115
processor                 test                       1116
processor                 test                       1117
processor                 test                       1118
processor                 test                       1119
processor                 test                       111A
processor                 test                       111B
processor                 test                       111C
processor                 test                       111D
processor cache           test                       2111
processor cache           test                       2112
processor cache           test                       2113
processor cache           test                       2121
processor cache           test                       2122
processor cache           test                       2122
processor                 test                       1151
processor                 INIT                       1701
processor                 test                       1110
processor                 test                       1142
processor                 test                       1142
PDH                       test                       3158
PDH                       test                       3157
PDH                       test                       316E
PDH                       test                       316E
PDH                       test                       316E
memory                    config                     7210
memory                    INIT                       7702
memory                    INIT                       771D
memory                    test                       7150
memory                    config                     7213
memory                    config                     7213
memory                    config                     7214
memory                    config                     7213
memory                    config                     7213
memory                    config                     7213
memory                    config                     7213
memory                    config                     7213
memory                    config                     7213
memory                    config                     7213
memory                    config                     7213
memory                    config                     7215
memory                    config                     7216
memory                    config                     72A0
memory                    test                       71A1
memory                    test                       71A2
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A3
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A6
memory                    config                     7217
memory                    config                     7218
memory                    config                     72A0
memory                    test                       71A1
memory                    test                       71A2
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A3
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A6
memory                    config                     7210
I/O                       INIT                       8701
I/O                       test                       8118
I/O                       test                       8118
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
memory                    config                     7240
memory                    INIT                       7702
memory                    config                     7241
memory                    config                     7243
memory                    config                     72A0
memory                    test                       71A1
memory                    test                       71A2
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A3
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    INIT                       7745
memory                    config                     7240
I/O                       config                     8204
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       config                     8204
processor                 test                       1120
processor                 test                       1133
processor                 test                       1134
processor                 test                       1135
processor                 test                       1136
processor                 test                       1137
processor                 test                       1138
processor                 test                       1152
processor                 test                       1139
processor                 test                       113A
processor                 test                       113B
processor                 test                       113C
processor                 test                       113D
processor                 test                       113E
processor                 INIT                       1701
processor                 test                       1120
processor                 test                       1142
processor                 test                       113B
platform                  test                       612A
I/O                       config                     8238

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************

Firmware Version  42.00

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2001, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst
Data
  ---------  --------   ---------------------  -----------------
------------
      0      650  MHz   Active                 Functional         750 KB 1.5
MB

  Central Bus Speed (in MHz)  :        120  
  Available Memory            :     131072  KB
  Good Memory Required        :      25820  KB

   Primary boot path:    0/0/1/1.15          
   Alternate boot path:  0/0/2/1.15          
   Console path:         0/0/4/1.643         
   Keyboard path:        0/0/4/1.0           


Processor is booting from first available device.

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
Main Menu: Enter command or menu > IN

---- Information Menu
--------------------------------------------------------

     Command                           Description
     -------                           -----------
     ALL                               Display all system information
     BootINfo                          Display boot-related information
     CAche                             Display cache information
     ChipRevisions                     Display revisions of major VLSI
     COprocessor                       Display coprocessor information
     FRU                               Display FRU information
     FwrVersion                        Display firmware version
     IO                                Display I/O interface information
     LanAddress                        Display Core LAN station address
     MEmory                            Display memory information
     PRocessor                         Display processor information
     WArnings                          Display selftest warning messages

     BOot [PRI|ALT|<path>]             Boot from specified path
     DIsplay                           Redisplay the current menu
     HElp [<command>]                  Display help for specified command
     RESET                             Restart the system
     MAin                              Return to Main Menu
----
Information Menu: Enter command > ALL

   Model: hp server rp2430 (model string 9000/800/A400-6X)

PROCESSOR INFORMATION

                       HVERSION  SVERSION              Processor
  Processor   Speed     Model    Model/Op  CVERSION      State
  ---------  --------  --------  --------  --------  -------------
      0      650  MHz   0x05e1    0x0491     2.  3   Active               

  Central Bus Speed (in MHz)  :        120  
  Software ID (dec)           :  859917860  
  Software ID (hex)           : 0x33414e24
  Software Capability         : 0x01f0


COPROCESSOR INFORMATION

                    Coprocessor   Coprocessor        Coprocessor
       Processor       Model        Revision            State
      -----------   -----------   -----------     -----------------
           0        0x00000013             1        Functional   

CACHE INFORMATION

       Processor    Instruction Cache Size    Data Cache Size
      -----------   -----------------------   ---------------
           0                750 KB                  1.5 MB

MEMORY INFORMATION


  MEMORY STATUS TABLE (MB) (Current Boot Status) 

Slot 01  128M  Active     
Slot 02   -               
Slot 03   -               
Slot 04   -               

Slot 05   -               
Slot 06   -               
Slot 07   -               
Slot 08   -               

Subtotal 128M             

   TOTAL =   128 MB
           ---------


                     Memory Installation Guidelines
                     ------------------------------

- DIMMs must be loaded in ascending slot order: 1, 2, 3, 4, 5, 6, 7, 8 

   Active, Installed Memory          :        128  MB of SDRAM
   Deallocated Pages                 :          0  Pages
                                       -----------
   Available Memory                  :        128  MB

   Good Memory Required by OS        :         26  MB

         Memory
   HVERSION  SVERSION
   -------- ----------
    0x09b0  0x00000900  

I/O MODULE INFORMATION

                        Path   Slot                          IODC  
Type                    (dec)  Number    HVERSION  SVERSION  Vers  
----                    -----  ------    --------  --------  ----  
System bus adapter      0                0x5820    0xb10     0x0   
Local bus adapter       0/0    4         0x7820    0xa00     0x0     
Local bus adapter       0/2    1         0x7820    0xa00     0x0     
Local bus adapter       0/4    2         0x7820    0xa00     0x0     
Local bus adapter       0/6    3         0x7820    0xa00     0x0     

PCI DEVICE INFORMATION
                                Path              Vendor  Device  Bus  Slot
Description                     (dec)               Id      Id     #    #
-----------                     -----              ----    ----   ---  ---
Ethernet cntlr                  0/0/0/0           0x1011  0x19    0
Built_In
SCSI bus cntlr                  0/0/1/0           0x1000  0xb     0
Built_In
SCSI bus cntlr                  0/0/1/1           0x1000  0xb     0
Built_In
SCSI bus cntlr                  0/0/2/0           0x1000  0xf     0
Built_In
SCSI bus cntlr                  0/0/2/1           0x1000  0xf     0
Built_In
System peripheral               0/0/4/0           0x103c  0x128d  0
Built_In
Comp. ser cntlr                 0/0/4/1           0x103c  0x1048  0
Built_In
System peripheral               0/0/4/2           0x0     0x0     0
Built_In

BOOT INFORMATION

   Processor           Boot ID
   ---------           -------
       0                  1  

   Autoboot:             ON
   Autosearch:           ON
   Autostart:            ON
   Fastboot:             OFF

   Primary boot path:    intscsia.15         
                         0/0/1/1.15          
                         0/0/01/01.f    (hex)
   Alternate boot path:  intscsib.15         
                         0/0/2/1.15          
                         0/0/02/01.f    (hex)
   Console path:         0/0/4/1.643         
                         0/0/04/01.283  (hex)
   Keyboard path:        0/0/4/1.0           
                         0/0/04/01.0    (hex)

   LAN Station Address:  00306e-2601de

   Wed Apr  10 04:29:21 GMT 2002    (20:02:04:10:04:29:21)

FIRMWARE INFORMATION

   Firmware Version:          42.09

        Module              Revision
        ------              --------
        System Board        A24210
        PA 8700 CPU Module  2.3

FRU INFORMATION

FRU Name:            HAR_SYS_BD 
Part Number:           A6889-60001 
Serial Number:           40CC0GR0HG 
Physical Location:     00ffff0001ffff69
Engineering Date Code: 4210 
Art Work Revision:     A2 
Scan Revision:           
FRU Specific Info:                      

FRU Name:            CRE_PCI_BD 
Part Number:           A5570-60003 
Serial Number:           40CC0ETRAT 
Physical Location:     00ffff0002ffff69
Engineering Date Code: 4026 
Art Work Revision:     A3 
Scan Revision:           
FRU Specific Info:                      

FRU Name:            HAR_GSP_BD 
Part Number:           A6889-60002 
Serial Number:           40CC0GS0TC 
Physical Location:     000000ffff06ff85
Engineering Date Code: 4204 
Art Work Revision:     A2 
Scan Revision:           
FRU Specific Info:                      

FRU Name:              DIMM_128 
Part Number:           A5572-60001 
Serial Number:         A56E03388166 
Physical Location:     0000ff000001ff74
Engineering Date Code: 4123 
Art Work Revision:     A4 
Scan Revision:           
FRU Specific Info:                      

Information Menu: Enter command > MA

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
Main Menu: Enter command or menu > SEA

Searching for potential boot device(s)
This may take several minutes.

To discontinue search, press any key (termination may not be immediate).


   Path#  Device Path (dec)  Device Path (mnem)  Device Type
   -----  -----------------  ------------------  -----------
   P0     0/0/1/1.15         intscsia.15         Random access media       
   P1     0/0/2/0.6          extscsib.6          Random access media       


Main Menu: Enter command or menu > BO P1
Interact with IPL (Y, N, or Cancel)?> Y

Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 0.96 root@palinux Fri Nov  2 16:31:18 MST 2001

Boot image contains:
    0/vmlinux32 3122078 bytes @ 0x4cf000
    0/vmlinux64 3990942 bytes @ 0x7c9800
    0/ramdisk 1946807 bytes @ 0xb98000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently  used by firmware (serial).
Current command line:
0/vmlinux root=/dev/ram initrd=0/ramdisk console=ttyS0 TERM=vt102
 0: 0/vmlinux
 1: root=/dev/ram
 2: initrd=0/ramdisk
 3: console=ttyS0
 4: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: 'root=/dev/ram console=ttyS0 TERM=vt102'
Selected kernel: /vmlinux from partition 0
Selected ramdisk: /ramdisk from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing
64-bit kernel
ELF64 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 2063232 mediaptr 0x1000
Segment 1 load 002f8000 size 1099104 mediaptr 0x1f9000
Segment 2 load 00408000 size 16384 mediaptr 0x306000
Segment 3 load 00410000 size 32768 mediaptr 0x30a000
Loading ramdisk 1946807 bytes @ 07e14000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.9-64 (root@paer) (gcc version 3.0) #1 Fri Nov 30 20:18:56
MST 2001
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model   00005e10 00000491 00000000 00000001 33414e24 100000f0 00000008
000000b2 000000b2
vers    00000203
cpuid   00000268
CPUID   vers 19 rev 8
model   9000/800/A400-6X
Total Memory: 128 Mb
initrd: 17e14000-17fef4b7
initrd: reserving 07e14000-07fef4b7 (mem_max 08000000)
pagetable_init
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/ram console=ttyS0 TERM=vt102
Console: colour dummy device 160x64
Calibrating delay loop... 1297.61 BogoMIPS
Memory: 121328k available
Dentry-cache hash table entries: 16384 (order: 6, 262144 bytes)
Inode-cache hash table entries: 8192 (order: 5, 131072 bytes)
Mount-cache hash table entries: 2048 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 4096 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 6, 262144 bytes)
Searching for devices...
Found devices:
1. unknown device (0) at 0xfffffffffffa0000 [-96], versions 0x5e1, 0x0, 0x4
2. Astro BC Runway Port (12) at 0xfffffffffed00000 [0], versions 0x582, 0x0,
0xb
3. Elroy PCI Bridge (13) at 0xfffffffffed30000 [0/0], versions 0x782, 0x0,
0xa
4. Elroy PCI Bridge (13) at 0xfffffffffed34000 [0/2], versions 0x782, 0x0,
0xa
5. Elroy PCI Bridge (13) at 0xfffffffffed38000 [0/4], versions 0x782, 0x0,
0xa
6. Elroy PCI Bridge (13) at 0xfffffffffed3c000 [0/6], versions 0x782, 0x0,
0xa
7. Crescendo Memory (1) at 0xfffffffffed08000 [8], versions 0x9b, 0x0, 0x9
CPU(s): 1 x PA8600 (PCX-W+) at 650.000000 MHz
SBA found Astro 2.1 at 0xfffffffffed00000
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba range[2] : ignoring GMMIO (0xfffffff804000000)
  got res[100:1ff] for resource 0 of Symbios Logic Inc. (formerly NCR)
53c896
  got res[200:2ff] for resource 0 of Symbios Logic Inc. (formerly NCR)
53c896 (#2)
  got res[300:3ff] for resource 0 of Symbios Logic Inc. (formerly NCR)
53c875
  got res[400:4ff] for resource 0 of Symbios Logic Inc. (formerly NCR)
53c875 (#2)
  got res[80:ff] for resource 0 of Digital Equipment Corporation DECchip
21142/43
  got res[40:7f] for resource 1 of PCI device 103c:1048 (Hewlett-Packard
Company)
  got res[fffffffff8080000:fffffffff80bffff] for resource 6 of Digital
Equipment Corporation DECchip 21142/43
  got res[fffffffff8002000:fffffffff8003fff] for resource 3 of Symbios Logic
Inc. (formerly NCR) 53c896
  got res[fffffffff8004000:fffffffff8005fff] for resource 3 of Symbios Logic
Inc. (formerly NCR) 53c896 (#2)
  got res[fffffffff8001000:fffffffff8001fff] for resource 2 of Symbios Logic
Inc. (formerly NCR) 53c875 (#2)
  got res[fffffffff8006000:fffffffff80063ff] for resource 1 of Digital
Equipment Corporation DECchip 21142/43
  got res[fffffffff8007000:fffffffff80073ff] for resource 1 of Symbios Logic
Inc. (formerly NCR) 53c896
  got res[fffffffff8008000:fffffffff80083ff] for resource 1 of Symbios Logic
Inc. (formerly NCR) 53c896 (#2)
  got res[fffffffff8009000:fffffffff80090ff] for resource 1 of Symbios Logic
Inc. (formerly NCR) 53c875 (#2)
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba range[2] : ignoring GMMIO (0xfffffff904000000)
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
lba range[2] : ignoring GMMIO (0xfffffffb04000000)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Performance monitoring counters enabled for unknown device
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
Redundant entry in serial pci_table.  Please send the output of
lspci -vv, this message (4156,4168,4156,4171)
and the manufacturer and name of serial board or modem board
to serial-pci-info@lists.sourceforge.net.
ttyS00 at port 0x0040 (irq = 132) is a 16550A
request_module[parport_lowlevel]: Root fs not mounted
lp: driver loaded but no devices found
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre6 (July 2, 2001)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 7809 advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0x80, 00:30:6E:26:01:DE, IRQ 128.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 2, function 1
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: setting PCI_COMMAND_INVALIDATE (fix-up)
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 1, function 1
sym53c8xx: setting PCI_COMMAND_INVALIDATE (fix-up)
sym53c8xx: 53c896 detected 
sym53c875-0: rev 0x37 on pci bus 0 device 2 function 0 irq 130
sym53c875-0: ID 7, Fast-20, Parity Checking

************* SYSTEM ALERT **************
SYSTEM NAME: uninitialized
DATE: 04/10/2002 TIME: 04:31:41
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

0x0000007000FF6292 000000F0 F0000000 - type  0 = Data Field Unused
0x5800087000FF6292 00006603 0A041F29 - type 11 = Timestamp 04/10/2002
04:31:41
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:A
*****************************************

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

P.S. I believe that *once* (assuming I wasn't dreaming) the above firmware
'SYSTEM ALERT' message didn't appear - instead, Linux, having gotten to the
same point (sym53c875...) simply hung. I made a point of waiting quite some
time (thinking perhaps the hard drive was taking its sweet time powering up)
so I'm pretty sure it really was 'hung.'

P.P.S. When I turn my system on, the 'Power' and 'Remote' LEDs glow solid,
but the 'Run', 'Attention' and 'Fault' lights also flash, until the 'SYSTEM
ALERT' appears, at which point the 'Run' light goes dark. Any ideas?


--%--multipart-mixed-boundary-1.4418.1018414412--%--
