Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B5204829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 11:19:03 -0600 (MDT)
Received: from esiee.fr (grobluk.esiee.fr [147.215.7.22])
	by mail.esiee.fr (Postfix) with ESMTP id D3DB049BEA
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 19:19:00 +0200 (CEST)
Message-ID: <3D876384.1090200@esiee.fr>
Date: Tue, 17 Sep 2002 19:16:52 +0200
From: Thibaut VARENE <varenet@esiee.fr>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Fwd: A500 hang up 2.4.19-pa18 (lot of) details
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

This a forward to the p-l.o m-l about hang-up with 2.4.19-pa18 kernel, 
that occurs when playing around with setiathome. See the transcript for 
details.

info taken from System.map:

mkhppa3:~# ./a.out 000000001015c620
0x1015c620 kmem_cache_free+a8
mkhppa3:~# ./a.out 000000001015bfb0
0x1015bfb0 free_block+48

BTW, you'll notice that the second CPU timed-out, instead of dumping 
when the first one died...

HTH


Thibaut VARENE wrote:
> 
> 
> I was able to reproduce the same hang, with a little variant:
> the first time i hanged the box, i launched both seti one after the 
> other (i.e., "cd seti1; ./setiathome &" and then "cd ../seti2; 
> ./setiathome &") and the box crashed when firing the second one.
> 
> Here i started one. then did some small commands like "ls", "top" and 
> so, and then started the second one. It didn't crash. I did a top, ls, 
> ps -ef, no pb.
> Then i decided to stop both setis (killall setiathome), and start one 
> again. It crahsed.
> 
> See the following session transcript:
> 
> Booting...
> Boot IO Dependent Code (IODC) revision 1
> 
> 
> HARD Booted.
> palo ipl 0.97 root@c3k Tue Nov 27 14:51:48 MST 2001
> Information: Boot device can't seek past 2Gb (ignore next 
> error).byteio_read: seekread() returned -1 expected 2048
> 
> Partition Start(MB) End(MB) Id Type
> 1               1      15   f0 Palo
> 2              16     503   82 swap
> 3             504    2887   83 ext2
> 
> PALO(F0) partition contains:
>     0/vmlinux64 3990942 bytes @ 0x44000
> 
> Information: No console specified on kernel command line. This is normal.
> PALO will choose the console currently  used by firmware (serial).
> Command line for kernel: 'root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102'
> Selected kernel: /boot/vmlinux from partition 3
> ELF64 executable
> Entry 00100000 first 00100000 n 4
> Segment 0 load 00100000 size 2448040 mediaptr 0x1000
> Segment 1 load 00356000 size 1043344 mediaptr 0x257000
> Segment 2 load 00458000 size 431368 mediaptr 0x356000
> Segment 3 load 004c4000 size 49152 mediaptr 0x3c0000
> Branching to kernel entry point 0x00100000.  If this is the last
> message you see, you may need to switch your console.  This is
> a common symptom -- search the FAQ and mailing list at parisc-linux.org
> 
> Linux version 2.4.19-pa18 (root@mkhppa3) (gcc version 3.0) #1 SMP Sun 
> Sep 15 18:21:12 CEST 2002
> FP[0] enabled: Rev 1 Model 16
> The 64-bit Kernel has started...
> Determining PDC firmware type: 64 bit PAT.
> model 00005d50 00000491 00000000 00000001 5cbb53d8 100000f0 00000008 
> 000000b2 000000b2
> vers  00000301
> CPUID vers 18 rev 11 (0x0000024b)
> capabilities 0x1
> model 9000/800/A500-5X
> Total Memory: 1024 Mb
> pagetable_init
> On node 0 totalpages: 262144
> zone(0): 262144 pages.
> zone(1): 0 pages.
> zone(2): 0 pages.
> Kernel command line: root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102
> Calibrating delay loop... 1097.72 BogoMIPS
> Memory: 1019664k available
> Dentry cache hash table entries: 131072 (order: 9, 2097152 bytes)
> Inode cache hash table entries: 65536 (order: 8, 1048576 bytes)
> Mount-cache hash table entries: 16384 (order: 6, 262144 bytes)
> Buffer-cache hash table entries: 65536 (order: 7, 524288 bytes)
> Page-cache hash table entries: 262144 (order: 9, 2097152 bytes)
> Searching for devices...
> Found devices:
> 1. Crescendo 550 (0) at 0xfffffffffffa0000 [160], versions 0x5d5, 0x0, 0x4
> 2. Crescendo 550 (0) at 0xfffffffffffa2000 [162], versions 0x5d5, 0x0, 0x4
> 3. Astro BC Runway Port (12) at 0xfffffffffed00000 [0], versions 0x582, 
> 0x0, 0xb
> 4. Elroy PCI Bridge (13) at 0xfffffffffed30000 [0/0], versions 0x782, 
> 0x0, 0xa
> 5. Elroy PCI Bridge (13) at 0xfffffffffed34000 [0/2], versions 0x782, 
> 0x0, 0xa
> 6. Elroy PCI Bridge (13) at 0xfffffffffed38000 [0/4], versions 0x782, 
> 0x0, 0xa
> 7. Elroy PCI Bridge (13) at 0xfffffffffed3c000 [0/6], versions 0x782, 
> 0x0, 0xa
> 8. Memory (1) at 0xfffffffffed08000 [8], versions 0x9b, 0x0, 0x9
> CPU(s): 2 x PA8600 (PCX-W+) at 550.000000 MHz
> SBA found Astro 2.1 at 0xfffffffffed00000
> lba version TR4.0 (0x5) found at 0xfffffffffed30000
> lba range[2] : ignoring GMMIO (0xfffffff804000000)
> lba version TR4.0 (0x5) found at 0xfffffffffed34000
> lba range[2] : ignoring GMMIO (0xfffffff904000000)
> lba version TR4.0 (0x5) found at 0xfffffffffed38000
> lba range[2] : ignoring GMMIO (0xfffffffa04000000)
> lba version TR4.0 (0x5) found at 0xfffffffffed3c000
> lba range[2] : ignoring GMMIO (0xfffffffb04000000)
> POSIX conformance testing by UNIFIX
> FP[1] enabled: Rev 1 Model 16
> SMP: Total 2 of 2 processors activated (2195.46 BogoMIPS noticed).
> Waiting on wait_init_idle (map = 0x2)
> All processors have done init_idle
> Linux NET4.0 for Linux 2.4
> Based upon Swansea University Computer Society NET3.039
> Initializing RT netlink socket
> Soft power switch support not available.
> Performance monitoring counters enabled for Crescendo 550
> Starting kswapd
> Journalled Block Device driver loaded
> Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
> pty: 256 Unix98 ptys configured
> Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ 
> SERIAL_PCI enabled
> Redundant entry in serial pci_table.  Please send the output of
> lspci -vv, this message (103c,1048,103c,1049)
> and the manufacturer and name of serial board or modem board
> to serial-pci-info@lists.sourceforge.net.
> ttyS00 at iomem 0xfffffffff8000000 (irq = 132) is a 16550A
> ttyS01 at iomem 0xfffffffff8000008 (irq = 132) is a 16550A
> ttyS02 at iomem 0xfffffffff8000010 (irq = 132) is a 16550A
> Redundant entry in serial pci_table.  Please send the output of
> lspci -vv, this message (103c,1048,103c,104a)
> and the manufacturer and name of serial board or modem board
> to serial-pci-info@lists.sourceforge.net.
> ttyS03 at iomem 0xfffffffff8006000 (irq = 133) is a 16550A
> ttyS04 at iomem 0xfffffffff8006008 (irq = 133) is a 16550A
> Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> loop: loaded (max 8 devices)
> Linux Tulip driver version 0.9.15-pre11 (May 11, 2002)
> tulip0: no phy info, aborting mtable build
> tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
> eth0: Digital DS21143 Tulip rev 65 at 0xfffffffff8007000, 
> 00:30:6E:0C:8A:8F, IRQ 128.
> SCSI subsystem driver Revision: 1.00
> sym53c8xx: at PCI bus 0, device 2, function 0
> sym53c8xx: 53c875 detected
> sym53c8xx: at PCI bus 0, device 2, function 1
> sym53c8xx: 53c875 detected
> sym53c8xx: at PCI bus 0, device 1, function 0
> sym53c8xx: setting PCI_COMMAND_INVALIDATE (fix-up)
> sym53c8xx: 53c896 detected
> sym53c8xx: at PCI bus 0, device 1, function 1
> sym53c8xx: setting PCI_COMMAND_INVALIDATE (fix-up)
> sym53c8xx: 53c896 detected
> sym53c875-0: rev 0x14 on pci bus 0 device 2 function 0 irq 130
> sym53c875-0: ID 7, Fast-10, Parity Checking
> sym53c875-1: rev 0x14 on pci bus 0 device 2 function 1 irq 131
> sym53c875-1: ID 7, Fast-20, Parity Checking
> sym53c896-2: rev 0x7 on pci bus 0 device 1 function 0 irq 129
> sym53c896-2: ID 7, Fast-20, Parity Checking
> sym53c896-2: handling phase mismatch from SCRIPTS.
> sym53c896-3: rev 0x7 on pci bus 0 device 1 function 1 irq 130
> sym53c896-3: ID 7, Fast-20, Parity Checking
> sym53c896-3: handling phase mismatch from SCRIPTS.
> scsi0 : sym53c8xx-1.7.3c-20010512
> scsi1 : sym53c8xx-1.7.3c-20010512
> scsi2 : sym53c8xx-1.7.3c-20010512
> scsi3 : sym53c8xx-1.7.3c-20010512
>   Vendor: SEAGATE   Model: ST39103LC         Rev: HP02
>   Type:   Direct-Access                      ANSI SCSI revision: 02
> Attached scsi disk sda at scsi1, channel 0, id 15, lun 0
> sym53c875-1-<15,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
> SCSI device sda: 17783112 512-byte hdwr sectors (9105 MB)
> Partition check:
>  sda: sda1 sda2 sda3 sda4 < sda5 sda6 >
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP Protocols: ICMP, UDP, TCP
> IP: routing cache hash table of 1024 buckets, 48Kbytes
> TCP: Hash tables configured (established 32768 bind 65536)
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> kjournald starting.  Commit interval 5 seconds
> EXT3-fs: mounted filesystem with ordered data mode.
> VFS: Mounted root (ext3 filesystem) readonly.
> Freeing unused kernel memory: 421k freed
> INIT: version 2.84 booting
> Activating swap.
> Adding Swap: 499704k swap-space (priority -1)
> Checking root file system...
> fsck 1.27 (8-Mar-2002)
> /dev/sda3: clean, 57492/305216 files, 321970/610304 blocks
> EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,3), internal journal
> System time was Mon Sep 16 10:11:13 UTC 2002.
> Setting the System Clock using the Hardware Clock as reference...
> System Clock set. System local time is now Mon Sep 16 10:10:05 UTC 2002.
> Calculating module dependencies... depmod: Can't open 
> /lib/modules/2.4.19-pa18/modules.dep for writing
> done.
> Loading modules:
> modprobe: Can't open dependencies file 
> /lib/modules/2.4.19-pa18/modules.dep (No such file or directory)
> Checking all file systems...
> fsck 1.27 (8-Mar-2002)
> /dev/sda5: clean, 104123/366528 files, 553485/732412 blocks
> /dev/sda6 has been mounted 35 times without being checked, check forced.
> /dev/sda6: 132287/376096 files (6.2% non-contiguous), 695541/751356 blocks
> Setting kernel variables.
> Mounting local filesystems...
> kjournald starting.  Commit interval 5 seconds
> EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,5), internal journal
> EXT3-fs: mounted filesystem with ordered data mode.
> /dev/sda5 on /home type ext3 (rw)
> kjournald starting.  Commit interval 5 seconds
> EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,6), internal journal
> EXT3-fs: mounted filesystem with ordered data mode.
> /dev/sda6 on /work type ext3 (rw)
> Cleaning: /etc/network/ifstate.
> Setting up IP spoofing protection: rp_filter.
> Configuring network interfaces: done.
> Starting portmap daemon: portmap.
> Loading the saved-state of the serial devices...
> Cannot set serial info: Device or resource busy
> /dev/ttyS0 at 0x0000 (irq = 132) is a 16550A
> /dev/ttyS1 at 0x0500 (irq = 133) is a 16550A
> /dev/ttyS2 at 0x0000 (irq = 132) is a 16550A
> /dev/ttyS3 at 0x0000 (irq = 133) is a 16550A
> 
> Setting the System Clock using the Hardware Clock as reference...
> System Clock set. Local time: Mon Sep 16 12:11:23 CEST 2002
> 
> Cleaning: /tmp /var/lock /var/run.
> eth0: Setting half-duplex based on MII#1 link partner capability of 0021.
> Initializing random number generator... done.
> Recovering nvi editor sessions... done.
> INIT: Entering runlevel: 2
> Starting system log daemon: syslogd.
> Starting kernel log daemon: klogd.
> Starting NFS common utilities: statd.
> Starting internet superserver: inetd.
> Starting OpenBSD Secure Shell server: sshd.
> Starting NTP server: ntpd.
> Starting NFS servers: nfsd mountd.
> Starting periodic command scheduler: cron.
> 
> Debian GNU/Linux testing/unstable mkhppa3 ttyS0
> 
> mkhppa3 login: varenet
> Password:
> Last login: Mon Sep 16 12:02:45 2002 from grobluk.esiee.fr on pts/0
> Linux mkhppa3 2.4.19-pa18 #1 SMP Sun Sep 15 18:21:12 CEST 2002 parisc64 
> unknown unknown GNU/Linux
> 
> Most of the programs included with the Debian GNU/Linux system are
> freely redistributable; the exact distribution terms for each program
> are described in the individual files in /usr/share/doc/*/copyright
> 
> Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
> permitted by applicable law.
> [varenet@mkhppa3 ~]$ cd seti
> seti1
> seti2
> setiathome-3.03.hppa-parisc-palinux.tar
> [varenet@mkhppa3 ~]$ cd seti1/
> [varenet@mkhppa3 ~/seti1]$ ./setiathome &
> [1] 185
> [varenet@mkhppa3 ~/seti1]$ >>DEBUG : Use LOCKFSETI@home client.
> Platform: hppa-parisc-palinux
> Version: 3.03
> 
> SETI@home is sponsored by individual donors around the world.
> If you'd like to contribute to the project,
> please visit the SETI@home web site at
> http://setiathome.ssl.berkeley.edu.
> The project is also sponsored by the Planetary Society,
> the University of California, Sun Microsystems, Paramount Pictures,
> Fujifilm Computer Products, Informix, Engineering Design Team Inc,
> The Santa Cruz Operation (SCO), Intel, Quantum Corporation,
> and the SETI Institute.
> 
> SETI@home was developed by David Gedye (Founder),
> David Anderson (Director), Dan Werthimer (Chief Scientist),
> Leonard Chung, Hiram Clawson, Jeff Cobb, Charles Congdon, Charlie Fenton,
> Kyle Granger, Eric Heien, Mike Hill, Michael Kang, Eric Korpela,
> Matt Lebofsky, Peter Leiser, Brad Silen, Woody Sullivan, and Adam Wight.
> 
> Scanning data file
> Data Info:
> Sky coordinates:  1.605 R.A.,  8.090 Dec
> Recorded on:  2452319.35352 (Wed Feb 13 20:29:04 2002)
> Source: Arecibo Radio Observatory
> Base Frequency: 1.421201172 GHz
> Found data file: yes. Found result header file: yes.
> Scanning result header file.
> Beginning analysis...
>         (This is the last message displayed while the client works.
>         To see progress messages between now and completion of
>         processing, operate the client with the -verbose option.
>         You can also see the progress of the client by looking at
>  12:11:58 up 3 min,  1 user,  load average: 0.74, 0.48, 0.19
> 23 processes: 21 sleeping, 2 running, 0 zombie, 0 stopped
> CPU states:   0.1% user,   0.9% system,  48.1% nice,  50.9% idle
> Mem:   1020088K total,   101308K used,   918780K free,     1468K buffers
> Swap:   499704K total,        0K used,   499704K free,     9792K cached
> 
>   PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
>   185 varenet   18   1 13772  13M   376 R N  97.4  1.3   0:11 setiathome
>   187 varenet   12   0  1128 1132   912 R     0.7  0.1   0:00 top
>     1 root       9   0   612  616   520 S     0.0  0.0   0:07 init
>     2 root       9   0     0    0     0 SW    0.0  0.0   0:00 keventd
>     3 root      19  19     0    0     0 SWN   0.0  0.0   0:00 
> ksoftirqd_CPU0
>     4 root      18  19     0    0     0 SWN   0.0  0.0   0:00 
> ksoftirqd_CPU1
>     5 root       9   0     0    0     0 SW    0.0  0.0   0:00 kswapd
>     6 root       9   0     0    0     0 SW    0.0  0.0   0:00 bdflush
>     7 root       9   0     0    0     0 SW    0.0  0.0   0:02 kupdated
>     8 root       9   0     0    0     0 SW    0.0  0.0   0:00 kjournald
> 
>    66 root       9   0     0    0     0 SW    0.0  0.0   0:00 kjournald
>    67 root       9   0     0    0     0 SW    0.0  0.0   0:00 kjournald
>    90 daemon     9   0   564  564   452 S     0.0  0.0   0:00 portmap
>   146 root       9   0  1004 1004   840 S     0.0  0.0   0:00 syslogd
>   149 root       9   0  1424 1424   508 S     0.0  0.1   0:00 klogd
>   153 root       9   0   840  840   712 S     0.0  0.0   0:00 rpc.statd
> 
> [varenet@mkhppa3 ~]$ cd seti2/
> [varenet@mkhppa3 ~/seti2]$ ./setiathome &
> [2] 188
> [varenet@mkhppa3 ~/seti2]$ >>DEBUG : Use LOCKFSETI@home client.
> Platform: hppa-parisc-palinux
> Version: 3.03
> 
> SETI@home is sponsored by individual donors around the world.
> If you'd like to contribute to the project,
> please visit the SETI@home web site at
> http://setiathome.ssl.berkeley.edu.
> The project is also sponsored by the Planetary Society,
> the University of California, Sun Microsystems, Paramount Pictures,
> Fujifilm Computer Products, Informix, Engineering Design Team Inc,
> The Santa Cruz Operation (SCO), Intel, Quantum Corporation,
> and the SETI Institute.
> 
> SETI@home was developed by David Gedye (Founder),
> David Anderson (Director), Dan Werthimer (Chief Scientist),
> Leonard Chung, Hiram Clawson, Jeff Cobb, Charles Congdon, Charlie Fenton,
> Kyle Granger, Eric Heien, Mike Hill, Michael Kang, Eric Korpela,
> Matt Lebofsky, Peter Leiser, Brad Silen, Woody Sullivan, and Adam Wight.
> 
> Scanning data file
> Data Info:
> Sky coordinates:  4.859 R.A., 18.010 Dec
> Recorded on:  2452425.22882 (Thu May 30 17:29:29 2002)
> Source: Arecibo Radio Observatory
> Base Frequency: 1.420849609 GHz
> Found data file: yes. Found result header file: yes.
> Scanning result header file.
>  12:12:37 up 4 min,  1 user,  load average: 1.20, 0.63, 0.25
> 24 processes: 21 sleeping, 3 running, 0 zombie, 0 stopped
> CPU states:   0.1% user,   1.1% system,  98.8% nice,   0.0% idle
> Mem:   1020088K total,   117088K used,   903000K free,     1548K buffers
> Swap:   499704K total,        0K used,   499704K free,    10784K cached
> 
>   PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
>   185 varenet   15   1 14984  14M   376 R N  99.8  1.4   0:49 setiathome
>   188 varenet   16   1 13772  13M   376 R N  99.6  1.3   0:24 setiathome
>   190 varenet   11   0  1128 1132   912 R     0.7  0.1   0:00 top
>     1 root       9   0   612  616   520 S     0.0  0.0   0:07 init
>     2 root       9   0     0    0     0 SW    0.0  0.0   0:00 keventd
>     3 root      19  19     0    0     0 SWN   0.0  0.0   0:00 
> ksoftirqd_CPU0
>     4 root      18  19     0    0     0 SWN   0.0  0.0   0:00 
> ksoftirqd_CPU1
>     5 root       9   0     0    0     0 SW    0.0  0.0   0:00 kswapd
>     6 root       9   0     0    0     0 SW    0.0  0.0   0:00 bdflush
>     7 root       9   0     0    0     0 SW    0.0  0.0   0:02 kupdated
>     8 root       9   0     0    0     0 SW    0.0  0.0   0:00 kjournald
>    66 root       9   0     0    0     0 SW    0.0  0.0   0:00 kjournald
>    67 root       9   0     0    0     0 SW    0.0  0.0   0:00 kjournald
>    90 daemon     9   0   564  564   452 S     0.0  0.0   0:00 portmap
>   146 root       9   0  1004 1004   840 S     0.0  0.0   0:00 syslogd
>   149 root       9   0  1424 1424   508 S     0.0  0.1   0:00 klogd
> 
> q[varenet@mkhppa3 ~/seti2]$ killall setiathome
> [varenet@mkhppa3 ~/seti2]$ cat /proc/version
> Linux version 2.4.19-pa18 (root@mkhppa3) (gcc version 3.0) #1 SMP Sun 
> Sep 15 18:21:12 CEST 2002
> [1]-  Terminated              ./setiathome  (wd: ~/seti1)
> (wd now: ~/seti2)
> [2]+  Terminated              ./setiathome
> [varenet@mkhppa3 ~/seti2]$ crontab -l
> @hourly         cd /home/varenet/seti1; ./setiathome -nice 20 -proxy 
> cache:3128 &
> #@reboot                cd /home/varenet/dnetc; ./dnetc
> @hourly         cd /home/varenet/seti2; ./setiathome -nice 20 -proxy 
> cache:3128 &
> [varenet@mkhppa3 ~/seti2]$ cd /home/varenet/seti1; ./setiathome -nice 20 
> -proxy cache:3128 &
> WARNING! Stack pointer and cr30 do not correspond!
> Dumping virtual address stack instead
> 
> Dumping Stack from 0x000000005f5a0000 to 0x000000005f5a4dc0:
> 
> 
> And nothing more.
> 
> after a toc, here was the content of SER PIM output:
> (I dumped everything, not sure of what may be useful or not ;)
> 
> Main Menu: Enter command or menu > ser pim
> 
> 
> PROCESSOR PIM INFORMATION
> 
> 
> 
> -----------------  Processor 0 HPMC Information - PDC Version: 40.50 ------
> 
> Timestamp =    Tue Oct  23 19:05:06 GMT 2001    (20:01:10:23:19:05:06)
> 
> HPMC Chassis Codes
> 
>        Chassis Code        Extension
>        ------------        ---------
>        0x0000082000ff6242  0x0000000000000000
>        0x1800082011006322  0xcb81800000000000
>        0x0000087000ff6292  0x0000000000000000
>        0x6000082070006062  0x0000000000100010
>        0x7000082070006082  0x0000000000b92400
>        0x7000082379006133  0xc1bff0fffed08040
>        0x0000080080006310  0x0000000000000001
>        0x000008008000631f  0x0000000000000000
> 
> 
> General Registers 0 - 31
> 00-03  0000000000000000  00000000103f9bb0  0000000010100bac 
> 00000000103f6bb0
> 04-07  000000000003d5ea  000000000038a000  00000000000000f0 
> 0000000000000000
> 08-11  0000000000000000  0000000000000001  000000000804000e 
> 000000001040888c
> 12-15  00000000000000f2  00000000000000fa  00000000000000f0 
> 00000000000000ff
> 16-19  00000000f00003dc  00000000f000028c  00000000f0002aa4 
> 00000000104a8000
> 20-23  0000000000000000  0000000000000000  0000000000000001 
> 000000004fa5c824
> 24-27  000000000800000f  0000000000000032  0000000000000019 
> 00000000103f6bb0
> 28-31  0000000000000000  00000000104a8b70  00000000104a8b00 
> 00000000104043b0
> 
> 
> Control Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 04-07  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 08-11  0000000000000072  0000000000000000  00000000000000c0 
> 000000000000003f
> 12-15  0000000000000000  0000000000000000  0000000000104000 
> ffffffffffffffff
> 16-19  0000000f96e6aa48  0000000000000000  0000000010100b88 
> 0000000003c008b3
> 20-23  0000000000000000  0000000000000000  000000000804000f 
> 0000000000000000
> 24-27  0000000000389000  000000003f158000  ffffffffffff7f10 
> ffffffffffff7fff
> 28-31  ffffffffffffffff  ffffffffffffffff  00000000104a8000 
> 00000000104b0000
> 
> Space Registers 0 - 7
> 00-03  00001c80          00000000          00000000          00001c80
> 04-07  00000000          00000000          00000000          00000000
> 
> 
> IIA Space (back entry)       = 0x0000000000000000
> IIA Offset (back entry)      = 0x0000000010100b8c
> Check Type                   = 0x20000000
> CPU State                    = 0x9e000004
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x0030000d
> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0xfffffffffffa0000
> System Requestor Address     = 0xfffffffffffa0000
> 
> 
> Floating Point Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 04-07  0000000010388100  0000000100000001  0000000012a20000 
> 0000000000000000
> 08-11  0000000000000802  000000004fa78000  00000000103f6bb0 
> 000000004fa6fec0
> 12-15  0000000000000000  0000000010388100  000000001018197c 
> 00000000103fcbb0
> 16-19  0000000010388100  0000000000000002  0000000000000002 
> 000000001032d2d4
> 20-23  0000000000000001  0000000010388a80  0000000000000000 
> 00000000000000c0
> 24-27  0000000a10332690  00000000104fce18  000000000800000f 
> 00000000103d2af0
> 28-31  00000000103d2b20  0000000000000001  0000000010162de0 
> 0000000000000002
> 
> 
> Check Summary                = 0xcb81800000000000
> Available Memory             = 0x0000000040000000
> CPU Diagnose Register 2      = 0x0301000000802004
> CPU Status Register 0        = 0x3440c20000000000
> CPU Status Register 1        = 0x8000000000000000
> SADD LOG                     = 0x4820000000000000
> Read Short LOG               = 0xc1bff0fffed22310
> 
> 
> 
> -----------------  Processor 0 LPMC Information ------------------
> 
> Check Type                   = 0x00000000
> IC Parity Info               = 0x00000000
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x00000000
> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x0000000000000000
> System Requestor Address     = 0x0000000000000000
> 
> 
> 
> -----------------  Processor 0 TOC Information -------------------
> 
> General Registers 0 - 31
> 00-03  0000000000000000  000000001037fa30  000000001010cca0 
> 0000000010443f10
> 04-07  000000004f5a5480  000000000000000f  000000001032adfc 
> 000000005f5a0018
> 08-11  000000001051f190  000000001051f1a0  000000000000002e 
> 0000000000000001
> 12-15  0000000000000003  000000000000002f  0000000000000000 
> 0000000000000002
> 16-19  000000004f5a5480  00000000000ad800  000000000009e800 
> 0000000000000000
> 20-23  000000001037fa30  0000000000000000  000000001038f690 
> 000000005f5a0018
> 24-27  000000000000000f  000000004f5a5480  000000001032adfc 
> 0000000010443f10
> 28-31  0000000000000040  000000004f5a5930  000000004f5a59c0 
> ffffffffffffffff
> 
> 
> Control Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 04-07  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 08-11  000000000000015a  0000000000000000  00000000000000c0 
> 000000000000003e
> 12-15  0000000000000000  0000000000000000  0000000000107000 
> 0000000000000000
> 16-19  00000059f094e5b5  0000000000000000  000000001010c990 
> 0000000086603fed
> 20-23  0000000000240000  00000000dff7fa30  000000000804000e 
> a000000000000000
> 24-27  00000000003d2000  000000003d24b000  ffffffffffff7f00 
> ffffffffffffffff
> 28-31  ffffffffffff7fff  ffffffffffffffff  000000004f5a4000 
> 00000000104c8000
> 
> Space Registers 0 - 7
> 00-03  00005680          00005680          00000000          00005680
> 04-07  00000000          00000000          00000000          00000000
> 
> IIA Space (back entry)       = 0x0000000000000000
> IIA Offset (back entry)      = 0x000000001010c994
> CPU State                    = 0x9e000001
> 
> 
> 
> -----------------  Processor 1 HPMC Information - PDC Version: 40.50 ------
> 
> Timestamp =    Tue Oct  23 19:05:06 GMT 2001    (20:01:10:23:19:05:06)
> 
> HPMC Chassis Codes
> 
>        Chassis Code        Extension
>        ------------        ---------
>        0x0000082000ff6242  0x0000000000000000
>        0x1800082011016312  0xcb81000000000000
> 
> 
> General Registers 0 - 31
> 00-03  0000000000000000  0000000010368068  000000001022f13c 
> 000000004fb29240
> 04-07  fffffffff8006030  00000000103f6bb0  00000000103f6bb0 
> fffffffff8006000
> 08-11  000000004fb29000  fffffffff8006028  0000000000002000 
> fffffffff8006030
> 12-15  000000000000012c  000000004f0d0b08  0000000000018054 
> 0000000000018414
> 16-19  0000000000000000  0000000000000001  0000000000026228 
> fffffffff8006000
> 20-23  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 24-27  0000000000000000  fffffffff8006060  fffffffff8006030 
> 00000000103f6bb0
> 28-31  000000000000d6d8  000000004f0d10f0  000000004f0d1100 
> 000000000000003f
> 
> 
> Control Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 04-07  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 08-11  000000000000007c  0000000000000000  00000000000000c0 
> 0000000000000002
> 12-15  0000000000000000  0000000000000000  0000000000104000 
> ffffffffffffffff
> 16-19  0000000f96e6acc4  0000000000000000  0000000010270798 
> 000000000f40019a
> 20-23  00000000ae27ffe0  c000000001806030  000000ff0804f40f 
> 8000000000000000
> 24-27  0000000000389000  000000003f130000  ffffffffffffffff 
> ffffffffffff7fff
> 28-31  ffffffffffffffff  ffffffffffffffff  000000004f0d0000 
> 000000004fb78000
> 
> Space Registers 0 - 7
> 00-03  00001f00          00000000          00000000          00001f00
> 04-07  00000000          00000000          00000000          00000000
> 
> 
> IIA Space (back entry)       = 0x0000000000000000
> IIA Offset (back entry)      = 0x000000001027079c
> Check Type                   = 0x20000000
> CPU State                    = 0x9e000004
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x0030103b
> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x000000fff8006030
> System Requestor Address     = 0xfffffffffffa2000
> 
> 
> Floating Point Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 04-07  0000000010388100  0000000100000001  0000000012a20000 
> 0000000000000000
> 08-11  0000000000000802  000000004fa78000  00000000103f6bb0 
> 000000004fa6fec0
> 12-15  0000000000000000  0000000010388100  000000001018197c 
> 00000000103fcbb0
> 16-19  0000000010388100  0000000000000002  0000000000000002 
> 000000001032d2d4
> 20-23  0000000000000001  0000000010388a80  0000000000000000 
> 0000000000000000
> 24-27  0000000a10332690  00000000104fce18  000000000800000f 
> 00000000103d2af0
> 28-31  00000000103d2b20  0000000000000001  0000000010162de0 
> 0000000000000003
> 
> 
> Check Summary                = 0xcb81000000000000
> Available Memory             = 0x0000000040000000
> CPU Diagnose Register 2      = 0x0301010000802004
> CPU Status Register 0        = 0x2440c20000000000
> CPU Status Register 1        = 0x8002000000000000
> SADD LOG                     = 0x0c1912c0e840d002
> Read Short LOG               = 0xc1af00fff8006030
> 
> 
> 
> -----------------  Processor 1 LPMC Information ------------------
> 
> Check Type                   = 0x00000000
> IC Parity Info               = 0x00000000
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x00000000
> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x0000000000000000
> System Requestor Address     = 0x0000000000000000
> 
> 
> 
> -----------------  Processor 1 TOC Information -------------------
> 
> General Registers 0 - 31
> 00-03  0000000000000000  0000000010446f10  0000000010103714 
> 0000000010443f10
> 04-07  00000000003d2000  fffffff0f040a000  0000000000000032 
> 00000000000000f7
> 08-11  0000000000000000  fffffff0f0400000  000000000804000e 
> 000000001045dbac
> 12-15  00000000000000f2  0000000000000001  00000000000000f0 
> 00000000000000ff
> 16-19  000000f0f00000c4  fffffff0f040c000  0000000000000000 
> 0000000011c50000
> 20-23  0000000000000000  0000000000000000  0000000000000001 
> 000000001047f824
> 24-27  000000000800000f  0000000000000032  0000000000000019 
> 0000000010443f10
> 28-31  0000000000000000  0000000011c50b30  0000000011c50ac0 
> 0000000010450f10
> 
> 
> Control Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 04-07  0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 08-11  0000000000000118  0000000000000000  00000000000000c0 
> 000000000000003e
> 12-15  0000000000000000  0000000000000000  0000000000107000 
> ff80000000000000
> 16-19  0000005a0364ba5e  0000000000000000  00000000101036f0 
> 0000000003c008b3
> 20-23  0000000000004480  0000000000000000  000000ff0806ff0f 
> 0000000000000000
> 24-27  00000000003d2000  000000003daa2000  ffffffffffffffff 
> ffffffffffffffff
> 28-31  ffffffffffffffff  ffffffffffffffff  0000000011c50000 
> ffffffffffffffff
> 
> Space Registers 0 - 7
> 00-03  00004480          00004480          00000000          00004600
> 04-07  00000000          00000000          00000000          00000000
> 
> IIA Space (back entry)       = 0x0000000000000000
> IIA Offset (back entry)      = 0x00000000101036f4
> CPU State                    = 0x9e000001
> 
> 
> --------------  Memory Error Log Information  --------------
> 
> Bus 0 Log Information
> 
> Timestamp =    Tue Oct  23 19:05:06 GMT 2001    (20:01:10:23:19:05:06)
> 
>   OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
>   --  --  --      -----      -  -  -  ----  ---  --  --  --
>   X       X     ERR_ERROR       X            X
> 
> Bus Requestor Address      = 0xfffffffffffa0000
> Bus Target Address         = 0x0000000000000000
> Bus Responder Address      = 0xfffffffffed00000
> 
> Error Status Reg           = 0x0000000000100010
> Runway Control Reg         = 0x0000021c00002818
> Runway Address Reg         = 0xc1bff0fffed08040
> Runway Data High Reg       = 0xf8018a1ff820ca01
> Runway Data Low Reg        = 0xf8018a1ff820ca01
> Memory Address Reg         = 0x000001ff3fffffff
> Memory Address Corr Reg    = 0x000001ff3fffffff
> Memory Syndrome Reg        = 0x0000000000000000
> Memory Syndrome Corr Reg   = 0x0000000000000000
> 
> 
> 
>  Address/Control Parity Error Registers
> 
>    Address/Control Parity Error Bit (mem_addr_par_stat) Not Set
> 
> 
> 
> ------------  I/O Module Error Log Information  ------------
> 
> 
>    No I/O module errors logged
> 
> 
> HTH,
> 
> Thibaut.
> 
> PS: when trying to boot after ser pim, the machine showed the following 
> and hung again:
> I dunno if that's normal ?
> 
> *****************************************
> 
> ************* SYSTEM ALERT **************
> SYSTEM NAME: a500
> DATE: 09/16/2002 TIME: 10:23:28
> ALERT LEVEL: 7 = reserved
> 
> REASON FOR ALERT
> SOURCE: 0 = unknown, no source stated
> SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
> PROBLEM DETAIL: 0 = no problem detail
> 
> LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
>        OFF      FLASH         ON        ON         ON
> LED State: Boot Failed.  Non-critical error detected.
> Check Chassis and Console Logs for error messages.
> 
> 0x0000107000FF6292 00000000 00000000 - type  0 = Data Field Unused
> 0x5800187000FF6292 00006608 100A171C - type 11 = Timestamp 09/16/2002 
> 10:23:28
> A: ack read of this entry - X: Disable all future alert messages
> Anything else skip redisplay the log entry
> ->Choice:a
> *****************************************
> 
> I had to issue a 'RS' to reboot the box.
> 



-- 
Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
