Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA28357
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Feb 2000 20:57:39 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id B526C13
	for <parisc-linux@thepuffingroup.com>; Thu, 24 Feb 2000 21:58:45 -0500 (EST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id SAA04374 for parisc-linux@thepuffingroup.com; Thu, 24 Feb 2000 18:59:49 -0800 (PST)
Date: Thu, 24 Feb 2000 18:59:49 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200002250259.SAA04374@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] code 28 trap
List-ID: <linux-parisc.vger.kernel.org>


Hi folks,
I'm getting a "Code 28" interrupt on my c3000.
I've appended the full console output. 

IOAQ points to ip_rcv+156.
GR02 points to net_bh+620

0xc01ca024 <ip_rcv+156>:        ldw 0(sr0,r4),r25

and GR4 == c7e8702e.
GR4 is aligned on 2byte, not 4 byte which the ldw wants.

I've reproduced the problem in another chunk of code:
0xc01fa82c <ic_bootp_recv+76>:  ldw 0(sr0,r4),r25

In this case: gr4 == c7f7e82e and gr2 == c01ce708 (net_bh+576)


If this code runs on alpha/sparc/mips, I'd think the alignment issues
would have been fixed pretty quickly. I don't think the problem is in
ip_rcv, ic_bootp_recv, or net_bh. I'm also nervous that both cases
died while using gr4.

I did "make clean && make Image" and got the same result.

Could this be a "CONSOLE_XXX" problem?
Other ideas?

thanks,
grant



Firmware Version 3.4

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-1999, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      400 MHz    Active                 Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:              536870912 bytes
  Good memory required:           44978176 bytes

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  LAN.15.8.80.76.3.254
  Console path:         GRAPHICS(2)
  Keyboard path:        USB

CPU 0
WARNING:  Processor self-tests have been disabled because FASTBOOT is
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
WARNING:  Memory has been initialized but not tested because FASTBOOT is
          enabled.  To test memory, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


----- Main Menu -------------------------------------------------------------

      Command                           Description
      -------                           -----------
      BOot [PRI|ALT|<path>]             Boot from specified path
      PAth [PRI|ALT|CON|KEY [<path>]]   Display or modify a path
      SEArch [DIsplay|[[IPL] [<path>]]] Search for boot devices

      COnfiguration [<command>]         Access Configuration menu/commands
      INformation [<command>]           Access Information menu/commands
      SERvice [<command>]               Access Service menu/commands

      DIsplay                           Redisplay the current menu
      HElp [<menu>|<command>]           Display help for menu or command
      RESET                             Restart the system
-----
Main Menu: Enter command > bo alt
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 001083-360089

System IP Address 15.8.80.75
Server IP Address 15.8.80.76

Boot IO Dependent Code (IODC) revision 2


HARD Booted.

------------------------------------------------------------------------------

PARISC/Linux Bootstrap Version 0.6 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Wed Feb 23 16:49:02 PST 2000 by grundler@rock

Official memory starts at 0000E000
Reading parameters...done.

Loading PA-RISC/Linux Kernel...
SOM-Kernel:
aux_header_location: 00000080
som       : 01000080
exec_dfile: 00172000
exec_dsize: 000FB000
exec_dmem : C0215000
exec_tfile: 0005D000
exec_tsize: 00114008
exec_tmem : C0100000
exec_bsize: 3FCF0030
exec_entry: C0100000
Code at 0x00100000, size=0x00114008
Data at 0x00215000, size=0x000FB000
BSS  at 0x00310000.
exec_entry: C0100000

Transferring control to kernel. (At entry point 0x00100000)
The Kernel has started...
Free memory starts at: 0xc0372000
PALO command line: 'vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.80.76'
FP CCR was 0x0, will be set to 0xc0
model   00005bb0 00000481 00000000 00000002 77cd9463 100000f0 00000008 000000b2 000000b2
vers    00000200
cpuid   00000224
CPUID vers 17 rev 4
Model: AllegroHigh W  with 512 MB RAM (Using 128 MB).
CPU(s): 1 x PA8500 at 400.000000 MHz
Searching for devices in PDC firmware... a newer box...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000, versions 0x582, 0x0, 0xb, 0x0, 0x10
2. Elroy PCI Bridge (13) at 0xfed30000, versions 0x782, 0x0, 0xa, 0x0, 0x0
3. Elroy PCI Bridge (13) at 0xfed32000, versions 0x782, 0x0, 0xa, 0x0, 0x0
4. Elroy PCI Bridge (13) at 0xfed38000, versions 0x782, 0x0, 0xa, 0x0, 0x0
5. Elroy PCI Bridge (13) at 0xfed3c000, versions 0x782, 0x0, 0xa, 0x0, 0x0
6. AllegroHigh W  (0) at 0xfffa0000, versions 0x5bb, 0x0, 0x4, 0x0, 0x81
7. AllegroHigh Memory (1) at 0xfed10200, versions 0x86, 0x0, 0x9, 0x0, 0x0
That's a total of 7 devices.
Linux version 2.3.42 (grundler@rock) (gcc version 2.95.2 19991024 (release)) #156 Thu Feb 24 17:08:33 PST 2000
init_bootmem 882 32768
init_bootmem complete
free_bootmem 00373000 07c8d000
d_conf b1802000
pagetable_init
set_pte c1100000 002fb309
miscoloured (c0144570)
set_pte c1100004 002f4309
miscoloured (c0144588)
On node 0 totalpages: 00008000
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
trap_init
Calibrating delay loop... 758.58 BogoMIPS
Memory: 124208k available
kmem_test() - start
kmem_free: Bad front redzone (objp=c7ffe004, name=test-cachep)
kmem_free: Bad rear redzone (objp=c7ffe004, name=test-cachep)
kmem_test() - finished
c7ff0000 c7ff8000 c7fee000 c7ffc000
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
lba version TR2.1 (0x2) found at 0xfed30000
lba_fixup_bus(0xc7fb9540) bus 0 sysdata 0xc7feb0a0
request_irq(258, c0133518, 0x0, iosapic, c7fb8180)
request_irq(259, c0133518, 0x0, iosapic, c7fb81a0)
request_irq(260, c0133518, 0x0, iosapic, c7fb8140)
request_irq(261, c0133518, 0x0, iosapic, c7fb8140)
request_irq(262, c0133518, 0x0, iosapic, c7fb8140)
request_irq(263, c0133518, 0x0, iosapic, c7fb8160)
request_irq(264, c0133518, 0x0, iosapic, c7fb8160)
lba version TR2.1 (0x2) found at 0xfed32000
lba_fixup_bus(0xc7fb95e0) bus 1 sysdata 0xc7feb160
request_irq(265, c0133518, 0x0, iosapic, c7fb83c0)
request_irq(266, c0133518, 0x0, iosapic, c7fb83a0)
request_irq(267, c0133518, 0x0, iosapic, c7fb8380)
lba version TR2.1 (0x2) found at 0xfed38000
lba_fixup_bus(0xc7fb9680) bus 2 sysdata 0xc7feb220
request_irq(268, c0133518, 0x0, iosapic, c7fb85e0)
lba_fixup_bus(0xc7fb9720) bus 3 sysdata 0xc7feb220
request_irq(269, c0133518, 0x0, iosapic, c7fb85c0)
request_irq(270, c0133518, 0x0, iosapic, c7fb85c0)
request_irq(271, c0133518, 0x0, iosapic, c7fb85c0)
request_irq(272, c0133518, 0x0, iosapic, c7fb85c0)
lba version TR2.1 (0x2) found at 0xfed3c000
lba: iosapic_register says not used
Warning : device (13, 0x782, 0x0, 0xa, 0x0) NOT claimed by lba TR2.1
IOA at 0xfed00000
IOS_DIST_BASE   : 000000ff fee00001
IOS_DIST_MASK   : 000000ff ffff0000
IOS_DIST_ROUTE  : 34000000 00000000

IOS_DIRECT_BASE : 000000ff fee00a00
IOS_DIRECT_MASK : 000000ff ffff0000
IOS_DIRECT_ROUTE: 00000000 00000000
lba: lba_bios_init
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
pty: 256 Unix98 ptys configured
eepro100.c:v1.09j 7/27/99 Donald Becker http://cesdis.gsfc.nasa.gov/linux/drivers/eepro100.html
eth0: OEM i82557/i82558 10/100 Ethernet at 0x12100, 08:00:09:DB:18:48, IRQ 769.
  Board assembly 657177-001, Physical connectors present: RJ45
  Primary interface chip DP83840 PHY #1.
  DP83840 specific setup, setting register 23 to 8462.
  General self-test: passed.
  Serial sub-system self-test: passed.
  Internal registers self-test: passed.
  ROM checksum self-test: passed (0xd6a8ca49).
  Receiver lock-up workaround activated.
eepro100.c:v1.09j 7/27/99 Donald Becker http://cesdis.gsfc.nasa.gov/linux/drivers/eepro100.html
Found Digital DS21143 Tulip at PCI I/O address 0x1000.
tulip.c:v0.91g-hppa 7/16/99 becker@cesdis.gsfc.nasa.gov
eth1: Digital DS21143 Tulip rev 48 at 0x1000, 00:10:83:36:00:89, IRQ 514.
eth1:  MII transceiver #1 config 1000 status 782d advertising 01e1.
Found Digital DS21140 Tulip at PCI I/O address 0x38300.
eth2: Digital DS21140 Tulip rev 34 at 0x38300, 00:00:D1:1A:31:BF, IRQ 1024.
eth2:  EEPROM default media type Autosense.
eth2:  MII interface PHY 0, setup/reset sequences 1/1 long, capabilities 78 00.
eth2:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
eth2:  Advertising 01e1 on PHY 0 (0).
eth2: Using media type MII, CSR12 is 00.
eth2:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth2:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth2:  Advertising 01e1 (to advertise is 01e1).
Found Digital DS21140 Tulip at PCI I/O address 0x38200.
eth3: Digital DS21140 Tulip rev 34 at 0x38200, 00:00:D1:1A:32:22, IRQ 1024.
eth3:  EEPROM default media type Autosense.
eth3:  MII interface PHY 0, setup/reset sequences 1/1 long, capabilities 78 00.
eth3:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
eth3:  Advertising 01e1 on PHY 0 (0).
eth3: Using media type MII, CSR12 is 00.
eth3:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth3:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth3:  Advertising 01e1 (to advertise is 01e1).
Found Digital DS21140 Tulip at PCI I/O address 0x38100.
eth4: Digital DS21140 Tulip rev 34 at 0x38100, 00:00:D1:1A:31:B9, IRQ 1024.
eth4:  EEPROM default media type Autosense.
eth4:  MII interface PHY 0, setup/reset sequences 1/1 long, capabilities 78 00.
eth4:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
eth4:  Advertising 01e1 on PHY 0 (0).
eth4: Using media type MII, CSR12 is 00.
eth4:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth4:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth4:  Advertising 01e1 (to advertise is 01e1).
Found Digital DS21140 Tulip at PCI I/O address 0x38000.
eth5: Digital DS21140 Tulip rev 34 at 0x38000, 00:00:D1:1A:31:C4, IRQ 1024.
eth5:  EEPROM default media type Autosense.
eth5:  MII interface PHY 0, setup/reset sequences 1/1 long, capabilities 78 00.
eth5:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
eth5:  Advertising 01e1 on PHY 0 (0).
eth5: Using media type MII, CSR12 is 00.
eth5:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth5:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth5:  Advertising 01e1 (to advertise is 01e1).
request_irq(769, c01bc8f0, 0x4000000, eth0, c7fb2800)
request_irq(514, c01c2398, 0x4000000, eth1, c7fed800)
eth1: tulip_open() irq 514.
eth1: No media description table, assuming MII transceiver, CSR12 c6.
eth1: Using MII transceiver 1, status 782d.
eth1: interrupt  csr5=0xf0610004 new csr5=0xf0600000.
eth1: interrupt  csr5=0xf0600000 new csr5=0xf0600000.
eth1: exiting interrupt, csr5=0xf0600000.
eth1: Done tulip_open(), CSR0 ffa08000, CSR5 f0660000 CSR6 b20e2002.
eth1: interrupt  csr5=0xf0670004 new csr5=0xf0660000.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth1: interrupt  csr5=0xf0670004 new csr5=0xf0660000.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
request_irq(1024, c01c2398, 0x4000000, eth2, c7fed600)
eth2: tulip_open() irq 1024.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 0 00077600.
eth1: In tulip_rx(), entry 0 00760700.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth2:  Advertising 01e1 on PHY 0 (1).
eth2: Using media type MII, CSR12 is 00.
eth2: Done tulip_open(), CSR0 ffa08000, CSR5 fc670004 CSR6 320e2002.
request_irq(1024, c01c2398, 0x4000000, eth3, c7fed400)
eth3: tulip_open() irq 1024.
eth3:  Advertising 01e1 on PHY 0 (1).
eth3: Using media type MII, CSR12 is 00.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 1 20074000.
eth1: In tulip_rx(), entry 1 00400720.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth3: Done tulip_open(), CSR0 ffa08000, CSR5 fc670004 CSR6 320e2002.
request_irq(1024, c01c2398, 0x4000000, eth4, c7fed200)
eth4: tulip_open() irq 1024.
eth4:  Advertising 01e1 on PHY 0 (1).
eth4: Using media type MII, CSR12 is 00.
eth4: Done tulip_open(), CSR0 ffa08000, CSR5 fc670004 CSR6 320e2002.
request_irq(1024, c01c2398, 0x4000000, eth5, c7fed000)
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 2 20077200.
eth1: In tulip_rx(), entry 2 00720720.
eth1: In tulip_rx(), entry 3 00760700.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 4 00000080.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth5: tulip_open() irq 1024.
eth5:  Advertising 01e1 on PHY 0 (1).
eth5: Using media type MII, CSR12 is 00.
eth5: Done tulip_open(), CSR0 ffa08000, CSR5 fc670004 CSR6 320e2002.
Sending BOOTP requests...<7>eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 4 20079a01.
eth1: In tulip_rx(), entry 4 019a0720.
eth1: In tulip_rx(), entry 5 00400720.
eth1: In tulip_rx(), entry 6 00400720.
eth1: In tulip_rx(), entry 7 00400720.
eth1: In tulip_rx(), entry 8 00760700.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 9 00000080.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 9 20074000.
eth1: In tulip_rx(), entry 9 00400720.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth1: interrupt  csr5=0xf0670004 new csr5=0xf0660000.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 10 20035a01.
eth1: In tulip_rx(), entry 10 015a0320.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 11 20079a01.
eth1: In tulip_rx(), entry 11 019a0720.
eth1: In tulip_rx(), entry 12 00400720.
eth1: In tulip_rx(), entry 13 02320320.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 14 00000080.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 14 20079a01.
eth1: In tulip_rx(), entry 14 019a0720.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 15 20079a01.
eth1: In tulip_rx(), entry 15 019a0720.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
.<7>eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 16 20079a01.
eth1: In tulip_rx(), entry 16 019a0720.
eth1: In tulip_rx(), entry 17 00400720.
eth1: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 18 00000080.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.
eth1: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth1: exiting interrupt, csr5=0xf0660000.

Dumping Stack from c7fbc000 to c7fbcb80:
c000 00000000 00000140 00000000 00000000 c02fe1f8 00000001 00000000 ffffffff
c020 00000000 00000014 00000000 00000000 c02156ec 00000000 00000000 c02fc028
c040 c7fa403c c7fa4000 c0218000 00000000 00000000 00000000 00000000 00000000
c060 00000000 00000000 00000001 00000000 00000000 00000000 00000000 c0218000
c080 c0218000 c7fa0000 00000000 00000000 00000000 c036fc24 c7fbc098 c7fbc098
c0a0 c7fbc0a0 c0149c8c c7fbc648 00000000 00000000 00000000 00000000 00000000
c0c0 00000000 00000000 00000000 00000000 00000000 c7fbc000 c014f100 00000000
c0e0 000000b3 00000000 00000000 00000023 00000000 000000d6 00000000 00000000
c100 00000000 00000000 00000000 00000000 80000000 00000000 00000000 00000000
c120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1a0 00000000 00000000 00000000 00000000 00000000 00000000 fffffeff fffffeff
c1c0 ffffffff 00000000 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
c1e0 00800000 ffffffff 00000000 ffffffff ffffffff ffffffff 00000800 00000800
c200 00000400 00000400 ffffffff ffffffff ffffffff ffffffff 00007377 61707065
c220 72000000 00000000 00000000 00000000 00000000 00000000 00000000 c1320f24
c240 f0400004 00000000 ffffffff 00000000 c7ffecc0 c0102f1c f0071898 c7ff0000
c260 c7ff8000 c014b4d0 c014b508 c02ff800 c1320f24 00000000 f0400004 00000000
c280 0004000a 0000003c 0000003e 0000000b c02fe000 00000001 c0313677 c0313677
c2a0 00000000 c012e438 00000023 00000000 0000003c 00000024 c02fe250 f00008c4
c2c0 f000017c f0000174 000000ff 002185c0 0000000d c02f3000 c00003a8 c0313677
c2e0 00000003 00000000 c0214000 00000000 c7fbc3c0 c0136438 c014b4d0 00000000
c300 00000000 00000000 0021c000 c021503c c021504c c02151e8 00000000 00000000
c320 00000000 00000000 00000000 c7fbc328 00000000 00000000 00000000 00000000
c340 00000001 00000000 c7fbc348 c7fbc348 c7fbc350 c0149c8c c7fbc358 00000000
c360 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c380 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c3a0 00000000 00000000 00000000 c0136448 00000000 00000000 00000000 00000000
c3c0 f0071898 c7ff0000 c7fbc000 00000000 c02156ec c0218000 c0218500 00000000
c3e0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c400 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c420 00000000 00000000 00000000 c012e45c 00000000 00000000 00000000 00000000
c440 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c460 00000000 00000000 00000000 c012e3fc 00000000 00000000 00000000 00000000
c480 c0218000 c0218500 00000000 00000000 c00003a8 c02fe244 c02fe244 c0122e9c
c4a0 00000000 00000000 00000000 c017f8ac 00000000 00000000 00000000 00000000
c4c0 c0218500 00000000 00000000 c01cc288 f0000a20 c012eecc f0071898 c7ff0000
c4e0 c7fbc000 00000000 c01c9ee0 c01a9258 c0218500 00000000 00000000 00000000
c500 f0071898 c7ff0000 c7fbc000 00000000 c02156ec c0218000 c0218500 c030f0d8
c520 c7ff0000 c7fbc000 00000000 c01ba0f4 c0218000 c0218500 00000000 00000000
c540 c0218000 c0218500 c02156ec c0218000 c0218500 c7ffec20 c0125858 c0128858
c560 c031368e 00000000 c01d006c c01d019c 00000064 0000003c 0000003b c02fe250
c580 c01ceb88 c030b408 c0123fa0 00363000 ffffffff c7ffec20 c036c000 c01ceb88
c5a0 c0363000 c0218500 ffffffff c01facf4 c036c000 c030bb08 00000000 c014b4d0
c5c0 f0400004 00000000 00000249 00000000 c012eecc c02fe000 c01cdbc8 00000001
c5e0 ffffffff c030bc08 c036c000 c01ceb88 c01ceb88 00000001 c0369af0 c0369978
c600 c01ceb88 00008124 03381011 00090057 00000001 00000000 fee08008 c01298f8
c620 00000000 f0000a20 c012eecc c01fab90 159f9abb 461eda97 ffffffff c030bc08
c640 f0400004 00000000 ffffffff 00000000 f0000a20 c0129800 c030e800 000000cc
c660 c030e800 00000001 c030e800 0000000a c02fe800 00000000 c7fbc658 c7fbc658
c680 00000001 c030e800 00000000 c7f3b480 ffffffff ffffffff c01298f9 00000000
c6a0 00000000 00000000 c014b4d0 c014b4d0 00000000 00000000 00000000 00000000
c6c0 0004000b 0004000a c014b4d0 00000000 00000001 00000004 c0313653 c0313655
c6e0 c0313654 00000000 c02fe000 0000000b 0000003e 0000003c 00000001 c02fe250
c700 f00008c4 f000017c f0000174 00000004 07fbc740 00003037 c02f3000 c00003a8
c720 c0313655 00000003 00000000 c0214000 00000000 c0310d00 c7fbc800 c014b4d0
c740 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c760 00000000 00000000 c014b4f8 c014b4fc 00000000 00000000 00000000 0000001f
c780 2b75c000 c7fed000 c036c000 c7f2b000 00000000 00000000 00000000 00000000
c7a0 00000000 00000000 00000000 c01c2378 00000000 00000000 00000000 00000000
c7c0 00012102 f000017c f00008c4 f0400004 00000000 ffffffff 00000000 c010f000
c7e0 c010f000 00000000 c0132208 c01374f8 a5c32800 0000000b c7fff2e8 c7fff2e0
c800 c02fe000 00000000 c0313654 c0313655 c0313653 00000004 00000001 00000000
c820 000000cc c030e800 c0129800 f0000a20 00000000 ffffffff 00000000 f0400004
c840 f00008c4 f000017c f0000174 00000001 00002cc0 00002d00 000000b4 00000001
c860 00000800 00000040 00000000 c012fc10 c7f16900 000000ff c7fbc940 c0205278
c880 00000002 c02f3348 20200000 20000000 00000002 00000102 00000000 00000000
c8a0 00000000 00000000 c012e794 c012e7d4 00000000 0aa92bcd 61202862 0000001f
c8c0 08000240 c6cc0274 b154768d ecee93d5 07d7f11b 8a4c0bc5 b839eca1 821a6616
c8e0 f8aa9072 78e5d0b8 c012faf4 c012fb2c beb24cca 63ace72f 90ae05ac ac07cd1e
c900 c02fe000 c02fe000 00000000 8b00f47c fe5c509e a4b0d0f7 7ed2ded4 36a2a674
c920 fcb21c1f 513e095b c014fe50 c014fe50 5b422e53 00000010 ffffffff 00000000
c940 c02fe250 00000001 0000003c 0000003e 0000000b c7fbc6c0 c02f3324 00000102
c960 c7fbc6c0 c036b000 c036c000 c0370dd4 00000001 c02f3324 00000102 c7fbc6c0
c980 0000000b c7fbc6c0 c02f3324 00000102 c7fbc6c0 c036b000 c036c000 c0370db8
c9a0 00000000 fed30840 c01ce708 c01ce708 0000002d c02fe23c c7fbca80 c014b4d0
c9c0 c0369800 00000800 c030ebb4 c7fa9474 c7fa9400 c030d55c c0369800 c0369800
c9e0 00000806 c030db14 c7f17074 c01cbee4 00000000 00000000 00000000 00000002
ca00 00000800 c030ebb4 c7fa9474 c7fa9400 c030d55c f0660000 c7fed900 c0121994
ca20 00000000 00000000 c012faf4 c01f13c8 00000039 00000000 00000000 00000000
ca40 0006ff0b c030e800 c01ce708 c030e800 c7f7e82e c7fb2800 c030ebb4 c7f17000
ca60 c0369800 c0369800 c02fe800 c030f000 000000d6 c0369c6c c0123800 c0369cac
ca80 c7fbc6c0 f000017c f0000174 0000001b 0000010a 00000000 c01fa7e0 00000000
caa0 c030ebb4 c7fb2800 c7f17000 c0214000 c7f17000 00000007 c7fbcb80 c01ce708
cac0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
cae0 00000000 00000000 c01fa82c c01fa830 00000000 c0123800 c0369c6c 00000012
cb00 48990000 00000000 c7f7e82e c7fed800 c7fed800 c7f2aac0 00000000 00000000
cb20 ffffffff ffffffff c014b4d0 c012e7d4 c7fbc800 c02f3324 00000301 00000000
cb40 00000002 0030f580 00000000 0030f4f8 0000000a c02fe000 00000001 c0313679
cb60 c0313679 c0313656 c012faf4 c01376b8 c0313653 c0393800 00000102 c7fbc8c0

Unexpected Interruption!: Code=28 regs=c7fbca40 (Addr=00000000)

PSW  : 0006ff0b  GR 1 : c030e800  GR 2 : c01ce708  GR 3 : c030e800  
GR 4 : c7f7e82e  GR 5 : c7fb2800  GR 6 : c030ebb4  GR 7 : c7f17000  
GR 8 : c0369800  GR 9 : c0369800  GR10 : c02fe800  GR11 : c030f000  
GR12 : 000000d6  GR13 : c0369c6c  GR14 : c0123800  GR15 : c0369cac  
GR16 : c7fbc6c0  GR17 : f000017c  GR18 : f0000174  GR19 : 0000001b  
GR20 : 0000010a  GR21 : 00000000  GR22 : c01fa7e0  GR23 : 00000000  
GR24 : c030ebb4  GR25 : c7fb2800  GR26 : c7f17000  GR27 : c0214000  
GR28 : c7f17000  GR29 : 00000007  GR30 : c7fbcb80  GR31 : c01ce708  
SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000  
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000  

IASQ : 00000000 00000000 IAOQ : c01fa82c c01fa830
 IIR : 48990000 ISR : 00000000 IOR : c7f7e82e





Some gdb output
---------------
Dump of assembler code for function ic_bootp_recv:
0xc01fa7e0 <ic_bootp_recv>:     stw rp,-14(sr0,sp)
0xc01fa7e4 <ic_bootp_recv+4>:   addil fa800,dp
0xc01fa7e8 <ic_bootp_recv+8>:   stwm r8,80(sr0,sp)
0xc01fa7ec <ic_bootp_recv+12>:  stw r7,-7c(sr0,sp)
0xc01fa7f0 <ic_bootp_recv+16>:  copy r26,r7
0xc01fa7f4 <ic_bootp_recv+20>:  stw r5,-74(sr0,sp)
0xc01fa7f8 <ic_bootp_recv+24>:  copy r25,r5
0xc01fa7fc <ic_bootp_recv+28>:  stw r3,-6c(sr0,sp)
0xc01fa800 <ic_bootp_recv+32>:  copy r1,r3
0xc01fa804 <ic_bootp_recv+36>:  stw r6,-78(sr0,sp)
0xc01fa808 <ic_bootp_recv+40>:  stw r4,-70(sr0,sp)
0xc01fa80c <ic_bootp_recv+44>:  ldw 3a4(sr0,r3),r19
0xc01fa810 <ic_bootp_recv+48>:  comibf,= 0,r19,0xc01fa9a4 <ic_bootp_recv+452>
0xc01fa814 <ic_bootp_recv+52>:  ldw 24(sr0,r7),r4
0xc01fa818 <ic_bootp_recv+56>:  ldb 6b(sr0,r7),r19
0xc01fa81c <ic_bootp_recv+60>:  comib,=,n 3,r19,0xc01fa9a4 <ic_bootp_recv+452>
0xc01fa820 <ic_bootp_recv+64>:  ldw 60(sr0,r7),r20
0xc01fa824 <ic_bootp_recv+68>:  ldi 1b,r19
0xc01fa828 <ic_bootp_recv+72>:  
    combf,<<,n r19,r20,0xc01fa9a4 <ic_bootp_recv+452>
0xc01fa82c <ic_bootp_recv+76>:  ldw 0(sr0,r4),r25
0xc01fa830 <ic_bootp_recv+80>:  ldil 45000000,r20
...

gr4 = c7f7e82e
gr2 = c01ce708 which is net_bh+576
