Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA26368
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Jan 2001 12:28:24 -0700
Message-Id: <200101131933.LAA08812@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] semaphores 
In-reply-to: Your message of "Sat, 13 Jan 2001 08:18:35 PST."
             <20010113081835.C16185@parcelfarce.linux.theplanet.co.uk>
Date: Sat, 13 Jan 2001 11:33:26 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> ok, bug found: i wasn't reenabling irqs if it had to sleep.  this patch
> should fix that bug, but obviously there may be more.  Please someone
> test this, I don't have access to any PA-RISC machines here in Sydney.

Tested on A500 and 64-bit wedges after kswapd.
Here's the output.

grant


Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Network Station Address 00306e-03799f
System IP Address 15.8.80.77
Server IP Address 15.8.81.247

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@hpisp747 Wed Dec 27 14:27:46 PST 2000
0/vmlinux 2701749 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/'
Kernel: partition 0 file /vmlinux                                               
ELF64 executable                                                                
                                                                                
Entry 00100000 first 00100000 n 4                                               
Segment 0 load 00100000 size 1652568 mediaptr 0x1000                            
Segment 1 load 00294000 size 421808 mediaptr 0x195000                           
Segment 2 load 002fc000 size 101936 mediaptr 0x1fc000                           
Segment 3 load 00318000 size 16384 mediaptr 0x215000                            
branching to kernel entry point 0x00100000                                      
Set default PSW W bit to 1                                                      
PDC Console Initialized                                                         
The 64-bit Kernel has started...                                                
Enabled FP coprocessor                                                          
If this is the LAST MESSAGE YOU SEE, you're probably using                      
32-bit millicode by mistake.                                                    
Free memory starts at: 0xc035f000                                               
start_parisc(0x504d70,0x504d70,0x0,0x0)                                         
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpbo'
PALO initrd 0-0                                                                 
model   00005cb0 00000491 00000000 00000001 23355fdc 100000f0 00000008 000000b22
vers    00000300                                                                
cpuid   0000022a                                                                
CPUID   vers 17 rev 10                                                          
model   9000/800/A500-44                                                        
Searching for devices in PDC firmware... processor hpa 0xfffffffffffa0000       
Found devices:                                                                  
1. Crescendo 440 (0) at 0xfffffffffffa0000, versions 0x5cb, 0x0, 0x4, 0x0, 0x91 
2. Crescendo 440 (0) at 0xfffffffffffa2000, versions 0x5cb, 0x0, 0x4, 0x0, 0x91 
3. Crescendo Memory (1) at 0xfffffffffed08000, versions 0x9b, 0x0, 0x9, 0x0, 0x0
4. Astro BC Runway Port (12) at 0xfffffffffed00000, versions 0x582, 0x0, 0xb, 00
5. Elroy PCI Bridge (13) at 0xfffffffffed30000, versions 0x782, 0x0, 0xa, 0x0, 0
6. Elroy PCI Bridge (13) at 0xfffffffffed34000, versions 0x782, 0x0, 0xa, 0x0, 0
7. Elroy PCI Bridge (13) at 0xfffffffffed38000, versions 0x782, 0x0, 0xa, 0x0, 0
8. Elroy PCI Bridge (13) at 0xfffffffffed3c000, versions 0x782, 0x0, 0xa, 0x0, 0
That's a total of 8 devices.                                                    
CONFIG_SMP disabled - not claiming addional CPUs                                
Warning : device (0, 0x5cb, 0x0, 0x4, 0x0) NOT claimed by CPU PARISC            
CPU(s): 1 x PA8500 (PCX-W) at 440.000000 MHz                                    
Linux version 2.4.0-test10 (grundler@hpisp747) (gcc version 2.96 20000925 (expe1
free_bootmem(0x361000, 0xfc9f000)                                               
initrd: 00000000-00000000                                                       
pagetable_init                                                                  
On node 0 totalpages: 65536                                                     
zone(0): 32768 pages.                                                           
zone(1): 32768 pages.                                                           
zone(2): 0 pages.                                                               
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpb0
trap_init                                                                       
Calibrating delay loop... 878.18 BogoMIPS                                       
Memory: 249452k available                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
Dentry-cache hash table entries: 32768 (order: 7, 524288 bytes)                 
Buffer-cache hash table entries: 16384 (order: 5, 131072 bytes)                 
Page-cache hash table entries: 65536 (order: 7, 524288 bytes)                   
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
Inode-cache hash table entries: 16384 (order: 6, 262144 bytes)                  
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
POSIX conformance testing by UNIFIX                                             
lba version TR4.0 (0x5) found at 0xfffffffffed30000                             
lba range[2] : ignoring GMMIO (0xfffffff804000000)                              
PCI: dev PCI device 1000:000b type 64-bit                                       
PCI: dev PCI device 1000:000b type 64-bit                                       
PCI: dev PCI device 1000:000b type 64-bit                                       
PCI: dev PCI device 1000:000b type 64-bit                                       
lba version TR4.0 (0x5) found at 0xfffffffffed34000                             
lba range[2] : ignoring GMMIO (0xfffffff904000000)                              
lba version TR4.0 (0x5) found at 0xfffffffffed38000                             
lba range[2] : ignoring GMMIO (0xfffffffa04000000)                              
PCI: dev PCI device 1000:000b type 64-bit                                       
PCI: dev PCI device 1000:000b type 64-bit                                       
PCI: dev PCI device 1000:000b type 64-bit                                       
PCI: dev PCI device 1000:000b type 64-bit                                       
lba version TR4.0 (0x5) found at 0xfffffffffed3c000                             
lba range[2] : ignoring GMMIO (0xfffffffb04000000)                              
PCI : ignoring 30:00.0 PCI-PCI bridge - I/O BASE not configured                 
PCI : ignoring 30:02.0 PCI-PCI bridge - I/O BASE not configured                 
PCI: dev PCI device 1000:000b type 64-bit                                       
PCI: dev PCI device 1000:000b type 64-bit                                       
PCI: dev PCI device 1000:000b type 64-bit                                       
PCI: dev PCI device 1000:000b type 64-bit                                       
SBA found Astro 2.1 at 0xfffffffffed00000                                       
Linux NET4.0 for Linux 2.4                                                      
Based upon Swansea University Computer Society NET3.039                         
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
down     00000000c0327d70                                                       
up       00000000c0327d70                                                       
end_up   00000000c0327d70                                                       
Starting kswapd v1.8                                                            
down     00000000cfff0988                                                       
up       00000000cfff0988                                                       
end_up   00000000cfff0988                                                       
