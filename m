Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 95C7A482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 13:03:10 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Holger Zessel <hzessel@grc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problem activating the optional lan card on 712/80 with 0.9-32serial
Date: Fri, 13 Jul 2001 21:02:28 +0200
Cc: hzessel@grc.hp.com
References: <200107131003.MAA10316@hprtdt13.grc.hp.com>
In-Reply-To: <200107131003.MAA10316@hprtdt13.grc.hp.com>
MIME-Version: 1.0
Message-Id: <20010713190310.95C7A482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Holger,

I think the main problem why the second lan card didn't worked was, that
both - the first and the second card - tried to register the "eth0" device 
name.
I just committed the following patch and it should fix your problem.

Greetings,
Helge

RCS file: /home/cvs/parisc/linux/drivers/gsc/lan.c,v
retrieving revision 1.9
diff -u -r1.9 lan.c
--- lan.c       2001/07/09 02:34:02     1.9
+++ lan.c       2001/07/13 18:39:32
@@ -43,19 +43,16 @@
 
        printk(KERN_INFO "Found i82596 at 0x%p, IRQ %d\n", d->hpa, irq);
 
-       netdevice = kmalloc(sizeof(*netdevice), GFP_KERNEL);
+       netdevice = alloc_etherdev(NULL,0);
        if (!netdevice)
-               return -ENOMEM;
+               return -ENOMEM;
 
-       memset(netdevice, 0, sizeof(*netdevice));
-       strcpy(netdevice->name,"eth0");
        netdevice->base_addr = (unsigned long) d->hpa;
        netdevice->irq = irq;
        netdevice->init =
                (d->sversion == 0x72) ? asp_i82596_probe :lasi_i82596_probe;
 
-       retval = register_netdevice(netdevice);
-
+       retval = register_netdev(netdevice);
        if (retval) {
                printk(KERN_WARNING __FILE__ ": register_netdevice ret'd %d\n", retval);
                kfree(netdevice);


On Friday 13 July 2001 12:03, Holger Zessel wrote:
> Hi all,
>
> did anybody manage to activate the optional lan card in the 712 ??
>
> As far as I know the normal prefab kernel on one of the iso images
> should work. And according to the website the card should be supported.
> I installed the 0.9-32serial and everything was fine so far.
>
> The boot messages show that the kernel sees the card but registering
> the card as a networkdevice seems to be the problem.
>
> I remembered that at least 2.2 kernels needed a commandline option
> e.g   ether=0,0,eth1   to enable an additional lancard and
> experimented with the command line but have not been able to find
> sufficient info or to see any effect on the behavior.
>
> Crucial seem to be the following lines (full dmesg output is further
> below):
>
> 4. Gecko 80 Core Lan (802.3) (10) at 0xf0107000, versions 0x1c, 0x0, 0x8a,
> 0x0, 0x0 ...
> 12. Gecko Optional Lan (802.3) (10) at 0xf0507000, versions 0x18, 0x0,
> 0x8a, 0x0, 0x0 ...
> Found i82596 at 0xf0107000, IRQ 87
> early initialization of device eth0 is deferred
> Found i82596 at 0xf0507000, IRQ 119
> early initialization of device eth0 is deferred
> lan.c: register_netdevice ret'd -17
> Warning : device (10, 0x18, 0x0, 0x8a, 0x0) NOT claimed by Lasi i82596 LAN
> 712, 715 or similiar
>
>
> The card was working fine on HP-UX 10.20 and currently it is not connected
> to a hub but that does not make a difference in the behavior.
>
> Questions:
>    - Any bugs / caveats known ??
>    - cmdline options needed here evtly ??
>
>
> Thanks in advance for feedback,
> best regards,
> Holger
>
>
>
> Full dmesg output:
>
>
> Linux version 2.4.0-pa10 (root@slab) (gcc version 3.0 20010315
> (prerelease)) #1 Wed May 30 20:19:52 BST 2001 FP[0] enabled: Rev 1 Model 13
> The 32-bit Kernel has started...
> Determining PDC firmware type: Older Legacy Box
> setup_cmdline(0x65328,0x65328,0x0,0x0)
> PALO command line: 'root=/dev/sda2 HOME=/ TERM=linux console=ttyS0
> ether=eth1,0,0,0,0' PALO initrd 0-0
> model   00006010 00000481 00000000 00000000 7816e9c5 00000000 00000004
> 00000072 00000072 vers    0000000b
> CPUID   vers 0 rev 0
> model   9000/712
> Total Memory: 64 Mb
> initrd: 00000000-00000000
> pagetable_init
> On node 0 totalpages: 16384
> zone(0): 16384 pages.
> zone(1): 0 pages.
> zone(2): 0 pages.
> Searching for devices...
> Found devices:
> 1. Gecko 80 GSC Core Graphics (10) at 0xf8000000, versions 0x1c, 0x0, 0x85,
> 0x0, 0x0 2. Gecko 80 Core BA (11) at 0xf0100000, versions 0x1c, 0x0, 0x81,
> 0x0, 0x0 3. Gecko 80 Core SCSI (10) at 0xf0106000, versions 0x1c, 0x0,
> 0x82, 0x0, 0x0 4. Gecko 80 Core Lan (802.3) (10) at 0xf0107000, versions
> 0x1c, 0x0, 0x8a, 0x0, 0x0 5. Gecko 80 Core RS-232 (10) at 0xf0105000,
> versions 0x1c, 0x0, 0x8c, 0x0, 0x0 6. Gecko 80 Core Centronics (10) at
> 0xf0102000, versions 0x1c, 0x0, 0x74, 0x0, 0x0 7. Gecko 80 Audio (10) at
> 0xf0104000, versions 0x1c, 0x0, 0x7b, 0x0, 0x0 8. Gecko 80 Core PC Floppy
> (10) at 0xf010a000, versions 0x1c, 0x0, 0x83, 0x0, 0x0 9. Gecko 80 Core PC
> Keyboard (10) at 0xf0108000, versions 0x1c, 0x0, 0x84, 0x0, 0x0 10. Gecko
> 80 Core PC Keyboard (10) at 0xf0108100, versions 0x1c, 0x0, 0x84, 0x0, 0x0
> 11. Gecko 80 Core BA (11) at 0xf0500000, versions 0x1c, 0x0, 0x81, 0x0, 0x0
> 12. Gecko Optional Lan (802.3) (10) at 0xf0507000, versions 0x18, 0x0,
> 0x8a, 0x0, 0x0 13. Gecko Optional RS-232 (10) at 0xf0505000, versions 0x18,
> 0x0, 0x8c, 0x0, 0x0 14. Gecko 80 (712/80) (0) at 0xfffbe000, versions
> 0x601, 0x0, 0x4, 0x0, 0x81 15. Gecko 80 (1) at 0xfffbf000, versions 0x38,
> 0x0, 0x9, 0x0, 0x0
> That's a total of 15 devices.
> CPU(s): 1 x PA7100LC (PCX-L) at 80.000000 MHz
> Kernel command line: root=/dev/sda2 HOME=/ TERM=linux console=ttyS0
> ether=eth1,0,0,0,0 Calibrating delay loop... 79.66 BogoMIPS
> Memory: 62272k available
> Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
> Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
> Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
> Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
> POSIX conformance testing by UNIFIX
> Lasi version 0 at 0xf0100000 found.
> Lasi version 0 at 0xf0500000 found.
> Initializing Lasi PS/2-keyboard port at 0xf0108000...
> Support for Lasi PS/2-psaux not yet available !
> Found i82596 at 0xf0107000, IRQ 87
> early initialization of device eth0 is deferred
> Found i82596 at 0xf0507000, IRQ 119
> early initialization of device eth0 is deferred
> lan.c: register_netdevice ret'd -17
> Warning : device (10, 0x18, 0x0, 0x8a, 0x0) NOT claimed by Lasi i82596 LAN
> 712, 715 or similiar Linux NET4.0 for Linux 2.4
> Based upon Swansea University Computer Society NET3.039
> Starting kswapd v1.8
> pty: 256 Unix98 ptys configured
> request_module[parport_lowlevel]: Root fs not mounted
> lp: driver loaded but no devices found
> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> eth0: 82596 at 0xf0107000, 08 00 09 5C 55 1E IRQ 87.
> 82596.c $Revision: 1.18 $
> Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ
> SERIAL_PCI enabled ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
> ttyS01 at iomem 0xf0505800 (irq = 122) is a 16550A
> Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
> parport_init_chip: initialize bidirectional-mode.
> parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
> lp0: using parport0 (interrupt-driven).
> SCSI subsystem driver Revision: 1.00
> sim700: Configuring 53c710 (SCSI-ID 7) at f0106100, IRQ 86, options 0
> scsi0: Revision 0x2
> Post test1, istat 01, sstat0 00, dstat 84
> sim700: WARNING IRQ probe failed, (returned 0)
> scsi0: Good, target data areas are dma coherent
> scsi0: test 1 completed ok.
> scsi0 : LASI/Simple 53c7xx
>   Vendor: SEAGATE   Model: ST32550N          Rev: HP09
>   Type:   Direct-Access                      ANSI SCSI revision: 02
> Detected scsi disk sda at scsi0, channel 0, id 4, lun 0
> SCSI device sda: 4165272 512-byte hdwr sectors (2133 MB)
> Partition check:
>  sda: sda1 sda2 sda3
> md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
> md.c: sizeof(mdp_super_t) = 4096
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP Protocols: ICMP, UDP, TCP
> IP: routing cache hash table of 512 buckets, 4Kbytes
> TCP: Hash tables configured (established 4096 bind 8192)
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> VFS: Mounted root (ext2 filesystem) readonly.
> Adding Swap: 204592k swap-space (priority -1)
> eth0: link ok.
