Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 317394856
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 18 Jan 2004 16:20:07 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Date: Sun, 18 Jan 2004 20:59:34 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Message-Id: <200401182059.34270.deller@gmx.de>
Subject: [parisc-linux] 32bit parisc kernel 2.6.1 and pcmcia
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

rdi:~# uname -a
Linux rdi 2.6.1-pa7 #252 Sun Jan 18 20:09:08 CET 2004 parisc GNU/Linux

rdi:~# lsmod
Module                  Size  Used by
serial_cs               8392  1

dmesg: (This is my RDI Precisionbook B160L laptop)
Found devices:
1. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096 }
2. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000 }
3. Dino PCI Bridge at 0xfff80000 [8/0] { 13, 0x3, 0x680, 0x0000a },  additional addresses: 0xf0800000
4. Merlin+ 132 Dino RS-232 at 0xfff83000 [8/0/63] { 10, 0x0, 0x022, 0x0008c }
5. Merlin 160 Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x03d, 0x00081 },  additional addresses: 0xffd0c000 0xffc00000
6. Merlin 160 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x03d, 0x00074 },  additional addresses: 0xffd01000 0xffd03000
7. Merlin 160 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03d, 0x0007b }
8. Merlin 160 Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x03d, 0x0008c }
9. Merlin 160 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x03d, 0x00082 }
10. Merlin 160 Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x03d, 0x0008a }
11. Merlin 160 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x03d, 0x00084 }
12. Merlin 160 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x03d, 0x00084 }
13. Merlin 160 Core PC Floppy at 0xffd0a000 [8/16/10] { 10, 0x0, 0x03d, 0x00083 }
14. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085 },  additional addresses: 0xf0011000
15. Merlin L2 160 (9000/778/B160L) at 0xfffbe000 [62] { 0, 0x0, 0x502, 0x00004 }
16. Memory at 0xfffbf000 [63] { 1, 0x0, 0x067, 0x00009 }
CPU(s): 1 x PA7300LC (PCX-L2) at 160.000000 MHz
Lasi version 0 at 0xffd00000 found.
Dino parisc8:0 version 3.1 found at 0xfff80000
PCI: Bus 1, cardbus bridge: 0000:00:02.0
PCI: Bus 5, cardbus bridge: 0000:00:02.1


..now inserting my TDK ISDN/serial modem PCMCIA card....

kernel messages:
Dino fff80000: stuck interrupt 4
cs IO ports 0x0-0x7 allocated in parent Dino I/O Port

rdi:~# cat /proc/interrupts
           CPU00
 32:     252074      PARISC-CPU  timer
 33:      28596      PARISC-CPU  lasi
 34:         39      PARISC-CPU  Dino parisc8:0
 82:          0            Lasi  harmony
 86:       8089            Lasi  parisc8:16:5
 87:      20507            Lasi  i82596
 88:          0            Lasi  parport0
 98:        100  Dino parisc8:0  yenta
 99:          0  Dino parisc8:0  yenta

rdi:~# cardctl info
PRODID_1=""
PRODID_2=""
PRODID_3=""
PRODID_4=""
MANFID=0000,0000
FUNCID=255
PRODID_1="TDK"
PRODID_2="Global Pro ISDN V.90"
PRODID_3="C7500010"
PRODID_4=""
MANFID=0105,410a
FUNCID=2

Any ideas why I get the above "Dino fff80000: stuck interrupt 4" message ?
It seems further interrupts are not delivered to serial_cs....

Thanks,
Helge
