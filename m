Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id DAAA04977
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 06:44:52 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id B744AB00C; Wed, 10 Oct 2001 13:45:26 +0100 (BST)
Date: Wed, 10 Oct 2001 13:45:26 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011010134526.F11105@linuxcare.com>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Oct 10, 2001 at 07:24:41AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 10, 2001 at 07:24:41AM +0100, Matthew Wilcox wrote:
> 
> Anyone want to review a patch that makes EISA work?  I've only

Looks reasonable to me, but doesn't make any difference so far as
EISA 53c710 cards in my 715/75 are concerned.  There seem to be two
basic problems...

Interrupts - I can see from the 53c710 registers that it is generating
an interrupt, but it doesn't seem to be enabled through to the processor.
I didn't know which irq to request, so I guessed it might be one of the
ASP ones (which I think cover 64 to 95), and did a request_irq for all
32 of them.  Didn't help.

Bus mastering - the 53c710 is attempting to fetch and execute scripts
from memory, but from what I can tell, it is picking up invalid data.
Basically the chips script pointer has moved on one instruction and it
is trying to generate an Illegal Instruction Detected interrupt, and
the dsps register, which I think is used in script fetching, contains
0xffffffff.

atm I am using eisa_in32() to check the card signature, but then
using readb and friends on (EISA_BASE + port) to access the card.
The driver only supports memory mapped chip access on parisc, and
as it is using memory mapped access for the on-board 53c700, it
makes sense to do that for EISA cards as well.  I identify the
card from a 32 bit signature at base+0xc80, which is apparently
correct on Compaq cards, at least - dunno if that is standard.
I'm pretty confident that I am accessing the chips registers ok.

I had to hack the scsi driver a bit to change the parity generation/
checking options, otherwise the chip just sat there saying its external
abort signal was true.  The chip supports the idea of passing parity
through from scsi bus to host bus, but I've no idea what features
might be implemented on my HP cards.  I tried a Compaq card as well,
which behaved the same except (a) I didn't need to do the parity hack,
and (b) it wasn't reported in the devices list on kernel boot.  With
an HP card in, it is listed as 'unknown device at 0xfc001000'.

Although the new code reports the EISA adaptor as Mongoose, that
address has already been reported as "Scorpio Sr. EISA BA".

Richard


              (c) Copyright Hewlett-Packard Company, 1991, 1992, 1993           
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, 91, 92    
                                                                                
ROM: 9000/715/75                                                                
                                                                                
PDC ROM rev. 1.1                                                                
IODC ROM rev. 1.0                                                               
96 MB of memory have been configured.                                           
                                                                                
Warning: one or more EISA cards could not be configured.                        
Autoselect and search will ignore unconfigured cards.                           
                                                                                
                                                                                
Searching for Potential Boot Devices.                                           
To terminate search, press and hold the ESCAPE key.                             
                                                                                
Device Selection      Device Path              Device Type                      
----------------------------------------------------------------------------    
                                                                                
P0                    scsi.6.0                 MICROP  2112                     
P1                    scsi.5.0                 SEAGATE ST32430N                 
P2                    scsi.3.0                 HP      HP35470A                 
P3                    lan.0002b3-218a14.0.0    moose                            
                                                                                
                                                                                
                                                                                
b)    Boot from specified device                                                
s)    Search for bootable devices                                               
a)    Enter Boot Administration mode                                            
x)    Exit and continue boot sequence                                           
?)    Help                                                                      
                                                                                
Select from menu: b p3                                                          
                                                                                
Trying lan.0002b3-218a14.0.0                                                    
Boot path initialized.                                                          
Attempting to load IPL.                                                         
                                                                                
                                                                                
Hard booted.                                                                    
palo ipl 0.94 richard@beast Wed Oct 10 12:18:57 BST 2001                        
0/vmlinux32 3120379 bytes @ 0x7800                                              
                                                                                
Command line: 'HOME=/ TERM=linux root=/dev/sda1  console=ttyS0'                 
                                                                                
Kernel: partition 0 file /vmlinux                                               
Warning: kernel name doesn't end with 32 or 64... Guessing 32                   
ELF32 executable                                                                
Entry 00100000 first 00100000 n 6                                               
Segment 0 load 00100000 size 1611616 mediaptr 0x1000                            
Segment 1 load 0028a000 size 287736 mediaptr 0x18b000                           
Segment 2 load 002d4000 size 377904 mediaptr 0x1d2000                           
Segment 3 load 00334000 size 8192 mediaptr 0x22f000                             
Segment 4 load 00338000 size 32768 mediaptr 0x231000                            
Segment 5 load 00376770 size 82896 mediaptr 0x239770                            
branching to kernel entry point 0x00100000                                      
Linux version 2.4.9-pa45 (richard@beast) (gcc version 3.0.2 20010829 (prerelease
)) #16 Wed Oct 10 14:13:11 BST 2001                                             
FP[0] enabled: Rev 1 Model 9                                                    
The 32-bit Kernel has started...                                                
Determining PDC firmware type: Snake.                                           
model   00003160 00000481 00000000 00000000 782de278 ffffffff 00000004 0000000a 
0000000a                                                                        
vers    00000013                                                                
CPUID   vers 0 rev 0                                                            
model   9000/715                                                                
Total Memory: 96 Mb                                                             
pagetable_init                                                                  
On node 0 totalpages: 24576                                                     
zone(0): 24576 pages.                                                           
zone(1): 0 pages.                                                               
zone(2): 0 pages.                                                               
Kernel command line: HOME=/ TERM=linux root=/dev/sda1  console=ttyS0            
Error reading tod clock                                                         
Console: colour dummy device 160x64                                             
Calibrating delay loop... 74.75 BogoMIPS                                        
Memory: 93980k available                                                        
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)                 
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)                    
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)                    
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)                   
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)                   
Searching for devices...                                                        
Found devices:                                                                  
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0, 0x77        
2. Scorpio Sr. Core BA (11) at 0xf082f000, versions 0x19, 0x0, 0x70             
3. Scorpio Sr. Core SCSI (10) at 0xf0825000, versions 0x19, 0x0, 0x71           
4. Scorpio Sr. Core LAN (802.3) (10) at 0xf0826000, versions 0x19, 0x0, 0x72    
5. Scorpio Sr. Core HIL (10) at 0xf0821000, versions 0x19, 0x0, 0x73            
6. Scorpio Sr. Core RS-232 (10) at 0xf0823000, versions 0x19, 0x0, 0x75         
7. Scorpio Sr. Core RS-232 (10) at 0xf0822000, versions 0x19, 0x0, 0x75         
8. Scorpio Sr. Core Centronics (10) at 0xf0824000, versions 0x19, 0x0, 0x74     
9. Scorpio Sr. Audio (10) at 0xf1000000, versions 0x19, 0x0, 0x7b               
10. Scorpio Sr. EISA BA (11) at 0xfc000000, versions 0x19, 0x0, 0x76            
11. unknown device (10) at 0xfc001000, versions 0x0, 0x0, 0xfff                 
12. Scorpio Sr.(715/75) (0) at 0xfffbe000, versions 0x316, 0x0, 0x4             
13. Scorpio Sr. (1) at 0xfffbf000, versions 0x27, 0x0, 0x9                      
That's a total of 13 devices.                                                   
CPU(s): 1 x PA7100 (PCX-T) at 75.000000 MHz                                     
Mongoose EISA Adapter found at 0xfc000000                                       
Asp version 1 at 0xf0800000 found.                                              
LED (ASP-style) display at f0800020 registered                                  
POSIX conformance testing by UNIFIX                                             
Linux NET4.0 for Linux 2.4                                                      
Based upon Swansea University Computer Society NET3.039                         
Starting kswapd v1.8                                                            
parport_init_chip: enhanced parport-modes not supported.                        
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]                                
STI byte mode ROM at f4000000, hpa=f4000000                                     
STI byte mode ROM, id 27f12392-40a00499, conforms to spec rev. 8.02             
STI device: HPA1991AC19                                                         
pty: 256 Unix98 ptys configured                                                 
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI en
abled                                                                           
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A                               
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A                               
Found HIL at 0xf0821000, IRQ 94                                                 
HIL: no keyboard present.                                                       
Warning : device (10, 0x19, 0x0, 0x73) NOT claimed by HIL                       
lp0: using parport0 (interrupt-driven).                                         
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)            
block: 128 slots per queue, batch=16                                            
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize           
loop: loaded (max 8 devices)                                                    
Found i82596 at 0xf0826000, IRQ 87                                              
82596.c: MAC of HP700 LAN read from EEPROM                                      
eth0: Couldn't get consistent shared memory                                     
eth0: 82596 at 0xf0826000, 08 00 09 87 E4 8F IRQ 87.                            
82596.c $Revision: 1.23 $                                                       
SCSI subsystem driver Revision: 1.00                                            
