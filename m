Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA00403
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Apr 2000 19:08:35 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id 8DF3A384
	for <parisc-linux@thepuffingroup.com>; Thu, 13 Apr 2000 21:08:33 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id SAA19184 for <parisc-linux@thepuffingroup.com>; Thu, 13 Apr 2000 18:08:38 -0700 (PDT)
Message-Id: <200004140108.SAA19184@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Astro and 100BT still not working 
In-reply-to: Your message of "Tue, 11 Apr 2000 22:14:55 PDT."
             <200004120514.WAA16365@milano.cup.hp.com>
Date: Thu, 13 Apr 2000 18:08:37 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Hi all,
> I haven't been able to figure out why the 100BT isn't able
> to read the Tx Descriptor and send a setup frame on the C3000.


I did find (and fix) several bugs in the SBA code regarding
translations from res_map[] -> pdir_base[] -> iova. But the
add-on tulip (cogent or HP) still wasn't working.  I think
after I changed the order of the CSR5/6/7 register writes,
I saw this output:

    eth0: No link beat on the MII interface, status 7809.

I am convinced Tulip initialization of CSR5/6/7 isn't right.
Writing CSR6 (enable Tx/Rx) should be the last thing.
But since vmlinux with my tulip_core.c "hung" after the same output
it's not clear if my changes "fix" anything. I'm not sure
the "No link beat" was due to my changes.
Anyone want my patch?
Or should I just commit my tulip_core.c?


Anyway, I removed the add-on card to try built-in tulip again.
With original Tulip code it got to:

    IP-Config: Got BOOTP answer from 15.8.80.76, my address is 15.8.80.77

I don't know why I stopped getting output.
I've TOC'd the box and will look at TOC output tomorrow.
(Don't want to spoil my day :^)
Could also be a problem with my bootp server or nfs root file system.

Full debug output is appended (with my tulip_core.c changes).
Code changes (except tulip_core.c) are committed if someone
else wants to play more with it.
SCSI is next on my list.

cheers,
grant

ps. yes - I'm working on getting George a 712/80...sounds
    like he needs one anyway. :^)

Grant Grundler
Unix Development Lab
+1.408.447.7253



Main Menu: Enter command > bo lan
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 001083-360089

System IP Address 15.8.80.77
Server IP Address 15.8.80.76

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@rock Thu Apr 13 16:26:33 PDT 2000
0/vmlinux 1961991 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.80.76'
0/ramdisk 614400 bytes @ 0x1e5807
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 0010174c first 00100000 n 4
Segment 0 load 00100000 size 1103012 mediaptr 0x1000
Segment 1 load 0020e000 size 95400 mediaptr 0x10f000
Segment 2 load 00228000 size 55796 mediaptr 0x127000
Segment 3 load 00238000 size 8192 mediaptr 0x135000
branching to kernel entry point 0x0010174c
The Kernel has started...
Free memory starts at: 0xc02a8000
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.80.76'
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00005bb0 00000481 00000000 00000002 77cd9463 100000f0 00000008 000000b2 000000b2
vers    00000200
cpuid   00000224
CPUID vers 17 rev 4
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
Linux version 2.3.99-pre1 (grundler@rock) (gcc version 2.9-hppa-991112) #79 Thu Apr 13 16:25:57 PDT 2000
init_bootmem 680 32768
init_bootmem complete
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
trap_init
Calibrating delay loop... 758.58 BogoMIPS
Memory: 124884k available
kmem_test() - start
kmem_free: Bad front redzone (objp=c7ffe004, name=test-cachep)
kmem_free: Bad rear redzone (objp=c7ffe004, name=test-cachep)
kmem_test() - finished
c7ff0000 c7ff8000 c7fee000 c7ffc000
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
lba version TR2.1 (0x2) found at 0xfed30000
Scanning bus 00
Found 00:60 [1011/0019] 000200 00
Found 00:68 [11d4/1889] 000401 00
Found 00:70 [100b/0002] 000101 00
Found 00:71 [100b/000e] 000680 00
Found 00:72 [100b/0012] 000c03 00
Found 00:78 [1000/000b] 000100 00
Found 00:79 [1000/000b] 000100 00
Fixups for bus 00
lba_fixup_bus(0xc7ffd660) bus 0 sysdata 0xc7feb0e0
request_irq(258, c0123e94, 0x0, iosapic, c7fbb060)
request_irq(259, c0123e94, 0x0, iosapic, c7fbb080)
request_irq(260, c0123e94, 0x0, iosapic, c7fbb020)
request_irq(261, c0123e94, 0x0, iosapic, c7fbb020)
request_irq(262, c0123e94, 0x0, iosapic, c7fbb020)
request_irq(263, c0123e94, 0x0, iosapic, c7fbb040)
request_irq(264, c0123e94, 0x0, iosapic, c7fbb040)
Bus scan for 00 returning with max=00
lba version TR2.1 (0x2) found at 0xfed32000
Scanning bus 01
Found 01:28 [1011/0019] 000200 00
Found 01:30 [1000/000f] 000100 00
Fixups for bus 01
lba_fixup_bus(0xc7ffd700) bus 1 sysdata 0xc7feb1a0
request_irq(265, c0123e94, 0x0, iosapic, c7fbb280)
request_irq(266, c0123e94, 0x0, iosapic, c7fbb260)
Bus scan for 01 returning with max=01
lba version TR2.1 (0x2) found at 0xfed38000
Scanning bus 02
Found 02:08 [12ae/0001] 000200 00
Fixups for bus 02
lba_fixup_bus(0xc7ffd7a0) bus 2 sysdata 0xc7feb260
request_irq(267, c0123e94, 0x0, iosapic, c7fbb4c0)
Bus scan for 02 returning with max=02
lba version TR2.1 (0x2) found at 0xfed3c000
lba: iosapic_register says not used
Warning : device (13, 0x782, 0x0, 0xa, 0x0) NOT claimed by lba TR2.1
SBA at 0xfed00000
IOS_DIST_BASE   : 000000ff fee00001
IOS_DIST_MASK   : 000000ff ffff0000
IOS_DIST_ROUTE  : 34000000 00000000

IOS_DIRECT_BASE : 000000ff fee00200
IOS_DIRECT_MASK : 000000ff ffff0000
IOS_DIRECT_ROUTE: 00000000 00000000
SBA found Astro 2.1 at 0xfed00000
sba_hw_init() hpa 0xfed00000 ioc_ctl 0x29cf ->sba_ioc_init hpa 0xfed22000 mem 128MBIOV 16MB (24 bits) PDIR size 0x8000 base c7fa8000
sba_ioc_init IOV base 0x1 mask 0xff000000
lba_init_iregs() ibase 0x1 imask 0xfc000000
lba_init_iregs() base_addr fed38000
lba_init_iregs() base_addr fed32000
lba_init_iregs() base_addr fed30000
lba_init_iregs() done
sba_ioc_init done
sba_common_init() res_size 0x200
lba: lba_bios_init
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
Starting kswapd v1.6
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Linux Tulip driver version 0.9.4.2 (Mar 21, 2000)

tulip 0x00 : 0x00191011 0x02800057 0x02000030 0x0000ff10
tulip 0x10 : 0x00001001 0xf4008000 0x00000000 0x00000000
tulip 0x20 : 0x00000000 0x00000000 0x00000000 0x104f103c
tulip 0x30 : 0xf4040000 0x00000000 0x00000000 0x28140102
pcibios_enable_device: Enabling device 00:0c.0 (0057 -> 0157)
sba_map_single 0xc7f7a000 -> 0x80000 pdir 0xc7fa8400 8000000007f7a07a
eth0: Digital DS21143 Tulip rev 48 at 0x1000, 00:10:83:36:00:89, IRQ 514.
eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
tulip: skipping card at 0x12100
request_irq(514, c01b38f4, 0x4000000, eth0, c7fb1000)
sba_map_single 0xc7fb0810 -> 0xa0810 pdir 0xc7fa8500 8000000007fb00b0
sba_map_single 0xc7fb0010 -> 0xc0010 pdir 0xc7fa8600 8000000007fb00b0
sba_map_single 0xc7f77810 -> 0xe0810 pdir 0xc7fa8700 8000000007f77077
sba_map_single 0xc7f77010 -> 0x100010 pdir 0xc7fa8800 8000000007f77077
sba_map_single 0xc7f76810 -> 0x120810 pdir 0xc7fa8900 8000000007f76076
sba_map_single 0xc7f76010 -> 0x140010 pdir 0xc7fa8a00 8000000007f76076
sba_map_single 0xc7f75810 -> 0x160810 pdir 0xc7fa8b00 8000000007f75075
sba_map_single 0xc7f75010 -> 0x180010 pdir 0xc7fa8c00 8000000007f75075
sba_map_single 0xc7f74810 -> 0x1a0810 pdir 0xc7fa8d00 8000000007f74074
sba_map_single 0xc7f74010 -> 0x1c0010 pdir 0xc7fa8e00 8000000007f74074
sba_map_single 0xc7f73810 -> 0x1e0810 pdir 0xc7fa8f00 8000000007f73073
sba_map_single 0xc7f73010 -> 0x200010 pdir 0xc7fa9000 8000000007f73073
sba_map_single 0xc7f72810 -> 0x220810 pdir 0xc7fa9100 8000000007f72072
sba_map_single 0xc7f72010 -> 0x240010 pdir 0xc7fa9200 8000000007f72072
sba_map_single 0xc7f71810 -> 0x260810 pdir 0xc7fa9300 8000000007f71071
sba_map_single 0xc7f71010 -> 0x280010 pdir 0xc7fa9400 8000000007f71071
sba_map_single 0xc7f70810 -> 0x2a0810 pdir 0xc7fa9500 8000000007f70070
sba_map_single 0xc7f70010 -> 0x2c0010 pdir 0xc7fa9600 8000000007f70070
sba_map_single 0xc7f6f810 -> 0x2e0810 pdir 0xc7fa9700 8000000007f6f06f
sba_map_single 0xc7f6f010 -> 0x300010 pdir 0xc7fa9800 8000000007f6f06f
sba_map_single 0xc7f6e810 -> 0x320810 pdir 0xc7fa9900 8000000007f6e06e
sba_map_single 0xc7f6e010 -> 0x340010 pdir 0xc7fa9a00 8000000007f6e06e
sba_map_single 0xc7f6d810 -> 0x360810 pdir 0xc7fa9b00 8000000007f6d06d
sba_map_single 0xc7f6d010 -> 0x380010 pdir 0xc7fa9c00 8000000007f6d06d
sba_map_single 0xc7f6c810 -> 0x3a0810 pdir 0xc7fa9d00 8000000007f6c06c
sba_map_single 0xc7f6c010 -> 0x3c0010 pdir 0xc7fa9e00 8000000007f6c06c
sba_map_single 0xc7f6b810 -> 0x3e0810 pdir 0xc7fa9f00 8000000007f6b06b
sba_map_single 0xc7f6b010 -> 0x400010 pdir 0xc7faa000 8000000007f6b06b
sba_map_single 0xc7f6a810 -> 0x420810 pdir 0xc7faa100 8000000007f6a06a
sba_map_single 0xc7f6a010 -> 0x440010 pdir 0xc7faa200 8000000007f6a06a
sba_map_single 0xc7f69810 -> 0x460810 pdir 0xc7faa300 8000000007f69069
sba_map_single 0xc7f69010 -> 0x480010 pdir 0xc7faa400 8000000007f69069
eth0: tulip_up(), irq==514.
sba_map_single 0xc7fb12bc -> 0x4a02bc pdir 0xc7faa500 8000000007fb10b1
eth0: No media description table, assuming MII transceiver, CSR12 c6.
eth0: Using MII transceiver 1, status 782d.
eth0: Done tulip_open(), CSR0 ffa0c000, CSR5 f0360000 CSR6 b20e2002.
eth0: interrupt  csr5=0xf0670004 new csr5=0xf0660000.
sba_unmap_single iovp 0x4a02bc
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 0 20074000.
eth0: In tulip_rx(), entry 0 00400720.
eth0: In tulip_rx(), entry 1 00400720.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 2 00000080.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
sba_map_single 0xc7fb12bc -> 0x4c02bc pdir 0xc7faa600 8000000007fb10b1
eth0: interrupt  csr5=0xf0670004 new csr5=0xf0660000.
sba_unmap_single iovp 0x4c02bc
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
sba_map_single 0xc7fb12bc -> 0x4e02bc pdir 0xc7faa700 8000000007fb10b1
eth0: interrupt  csr5=0xf0670004 new csr5=0xf0660000.
sba_unmap_single iovp 0x4e02bc
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
Sending BOOTP requests...sba_map_single 0xc7feda02 -> 0x500a02 pdir 0xc7faa800 8000000007fed0ed
eth0: interrupt  csr5=0xf0670004 new csr5=0xf0660000.
sba_unmap_single iovp 0x500a02
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 2 20035a01.
eth0: In tulip_rx(), entry 2 015a0320.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
.<7>eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 3 20074000.
eth0: In tulip_rx(), entry 3 00400720.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 4 20033202.
eth0: In tulip_rx(), entry 4 02320320.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 5 20074000.
eth0: In tulip_rx(), entry 5 00400720.
eth0: In tulip_rx(), entry 6 00400720.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 7 00000080.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 7 20074000.
eth0: In tulip_rx(), entry 7 00400720.
eth0: In tulip_rx(), entry 8 00400720.
eth0: In tulip_rx(), entry 9 00720720.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 10 00000080.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: 21143 negotiation status 000000c6, MII.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 10 20074000.
eth0: In tulip_rx(), entry 10 00400720.
eth0: In tulip_rx(), entry 11 00400720.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: MII status 782d, Link partner report 40a1.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 12 20074000.
eth0: In tulip_rx(), entry 12 00400720.
eth0: In tulip_rx(), entry 13 00400720.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 14 00000080.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 14 20074000.
eth0: In tulip_rx(), entry 14 00400720.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 15 20074000.
eth0: In tulip_rx(), entry 15 00400720.
eth0: In tulip_rx(), entry 16 02320320.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 17 00000080.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 17 20074000.
eth0: In tulip_rx(), entry 17 00400720.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 18 20074000.
eth0: In tulip_rx(), entry 18 00400720.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
eth0: interrupt  csr5=0xf0670040 new csr5=0xf0660000.
 In tulip_rx(), entry 19 00077600.
eth0: In tulip_rx(), entry 19 00760700.
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
 OK
IP-Config: Got BOOTP answer from 15.8.80.76, my address is 15.8.80.77
sba_map_single 0xc7fb12bc -> 0x5202bc pdir 0xc7faa900 8000000007fb10b1
eth0: interrupt  csr5=0xf0670044 new csr5=0xf0660000.
 In tulip_rx(), entry 20 20074000.
eth0: In tulip_rx(), entry 20 00400720.
sba_unmap_single iovp 0x5202bc
eth0: interrupt  csr5=0xf0660000 new csr5=0xf0660000.
eth0: exiting interrupt, csr5=0xf0660000.
