Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sngrel4.hp.com (sngrel4.hp.com [192.6.86.110])
	by dsl2.external.hp.com (Postfix) with ESMTP id B42B54866
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Sep 2003 13:07:44 -0600 (MDT)
Received: from XIN02.india.hp.com (xin02.india.hp.com [15.10.41.164])
	by sngrel4.hp.com (Postfix) with ESMTP id 388C4E73
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 03:07:33 +0800 (SST)
Message-ID: <A11077E28200D51182EA00D0B7755253099DF4E0@xin02.india.hp.com>
From: "SUDARSANAN,RANJITH (HP-India,ex2)" <ranjith_sudarsanan@hp.com>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 19 Sep 2003 00:36:55 +0530
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C37E18.06CAF4E8"
Subject: [parisc-linux] Problems with raw interface.
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C37E18.06CAF4E8
Content-Type: text/plain

Hi
	I am developing a scsi disk exerciser and I am blocked on a strange
problem with the raw interface. When I use the block device /dev/sda
directly I am able to read and write from the disk properly. But when I use
the raw interface I get garbage. For instance please look at the output
below. I am reading the 1st sector of the disk, which is the boot sector,
When I use the block device /dev/sda I get my expected output, whereas when
I use the raw interface I get garbage. Can any one explain? The machine I am
using is an L Class. 

I have attached the start up (boot up) screen dump at the end of the mail

Kernel details:
oak:~# uname -a
Linux oak 2.4.22-pa3 #1 Thu Sep 18 23:19:58 IST 2003 parisc64 unknown


oak:/home/sranjith# ls -l /dev/sda
brw-rw----    1 root     disk       8,   0 Jun  7  2002 /dev/sda

oak:/home/sranjith# ls -l /dev/sdb
brw-rw----    1 root     disk       8,  16 Jun  7  2002 /dev/sdb

oak:/home/sranjith# ls -l /dev/raw/    
total 0
crw-r--r--    1 root     root     162,   4 Sep 12 00:32 raw4
crw-r--r--    1 root     root     162,   2 Aug  7 00:35 rawsda
crw-r--r--    1 root     root     162,   1 Jul 31 19:33 rawsdb

I am binding the raw devices to the block devices

oak:/home/sranjith# raw /dev/raw/rawsdb /dev/sdb
/dev/raw/raw1:  bound to major 8, minor 16
oak:/home/sranjith# raw /dev/raw/rawsda /dev/sda
/dev/raw/raw2:  bound to major 8, minor 0

oak:/home/sranjith# raw -qa
/dev/raw/raw1:  bound to major 8, minor 16
/dev/raw/raw2:  bound to major 8, minor 0

I am reading the 1st sector of /dev/sda from which I booted

oak:/home/sranjith# dd if=/dev/sda of=o_sda bs=512 count=8
8+0 records in
8+0 records out
oak:/home/sranjith# xxd o_sda |more
0000000: 8000 5041 4c4f 0003 0000 0000 0000 0000  ..PALO..........
0000010: 0000 0000 0000 0000 322f 766d 6c69 6e75  ........2/vmlinu
0000020: 7820 726f 6f74 3d2f 6465 762f 7364 6133  x root=/dev/sda3
0000030: 2048 4f4d 453d 2f00 696e 6974 3d2f 6269   HOME=/.init=/bi
0000040: 6e2f 6261 7368 0037 3a2f 2069 703d 6468  n/bash.7:/ ip=dh
0000050: 6370 2048 4f4d 453d 2f00 0000 0000 0000  cp HOME=/.......
0000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000080: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000090: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000a0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000b0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000c0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000e0: 0000 0000 0000 0000 0004 4000 0050 7fd9  ..........@..P..
00000f0: 0000 4000 0000 7800 0000 0000 0000 0000  ..@...x.........
0000100: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000110: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000120: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000130: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000140: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000150: 0000 0000 0000 0000 0000 0000 0000 0000  ................
--More--

I am getting a valid output

Now I use the raw interface to read the same sector and I get garbage

oak:/home/sranjith# dd if=/dev/raw/rawsda of=o_sda bs=512 count=8
8+0 records in
8+0 records out
oak:/home/sranjith# xxd o_sda |more
0000000: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000020: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000030: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000040: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000050: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000080: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000090: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000a0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000b0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000c0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000e0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000100: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000110: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000120: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000130: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000140: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000150: 0000 0000 0000 0000 0000 0000 0000 0000  ................
--More--

I get Garbage	



Boot up screen dump
************ EARLY BOOT VFP *************
End of early boot detected
*****************************************

Firmware Version  41.46

Duplex Console IO Dependent Code (IODC) revision 1

----------------------------------------------------------------------------
--
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
----------------------------------------------------------------------------
--

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst
Data
  ---------  --------   ---------------------  -----------------
------------
      0      750  MHz   Active                 Functional         750 KB 1.5
MB
      2      750  MHz   Idle                   Functional         750 KB 1.5
MB

  Central Bus Speed (in MHz)  :        133  
  Available Memory            :   16777216  KB
  Good Memory Required        :      86948  KB

   Primary boot path:    0/0/2/0.2           
   Alternate boot path:  0/0/1/1.2           
   Console path:         0/0/4/1.0           
   Keyboard path:        0/0/4/0.0           

 WARNING:  The non-destructive test bit was set, so memory was not tested 
            destructively.  Information only, no action required. 


Processor is booting from first available device.

To discontinue, press any key within 10 seconds.
Proceeding...

Trying Primary Boot Path
------------------------
Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Partition Start(MB) End(MB) Id Type
1               1      95   f0 Palo
2              96     286   83 ext2
3             287    5054   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 5275609 bytes @ 0x44000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 2872448 mediaptr 0x1000
Segment 1 load 003be000 size 1028616 mediaptr 0x2bf000
Segment 2 load 004bc000 size 376832 mediaptr 0x3bb000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org


********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system
down.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: setting PCI_COMMAND_INVALIDATE (fix-up)
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 1, function 1
sym53c8xx: setting PCI_COMMAND_INVALIDATE (fix-up)
sym53c8xx: 53c896 detected 
sym53c875-0: rev 0x14 on pci bus 0 device 2 function 0 irq 130
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-1: rev 0x14 on pci bus 0 device 2 function 1 irq 131
sym53c875-1: ID 7, Fast-20, Parity Checking
sym53c875-2: rev 0x14 on pci bus 64 device 0 function 0 irq 512
sym53c875-2: ID 7, Fast-20, Parity Checking
sym53c875-3: rev 0x14 on pci bus 64 device 0 function 1 irq 513
sym53c875-3: ID 7, Fast-20, Parity Checking
sym53c896-4: rev 0x7 on pci bus 0 device 1 function 0 irq 129
sym53c896-4: ID 7, Fast-20, Parity Checking
sym53c896-4: handling phase mismatch from SCRIPTS.
sym53c896-5: rev 0x7 on pci bus 0 device 1 function 1 irq 130
sym53c896-5: ID 7, Fast-20, Parity Checking
sym53c896-5: handling phase mismatch from SCRIPTS.
scsi0 : sym53c8xx-1.7.3c-20010512
scsi1 : sym53c8xx-1.7.3c-20010512
scsi2 : sym53c8xx-1.7.3c-20010512
scsi3 : sym53c8xx-1.7.3c-20010512
scsi4 : sym53c8xx-1.7.3c-20010512
scsi5 : sym53c8xx-1.7.3c-20010512
blk: queue 000000008f9a3428, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: HP 36.4G  Model: MAN3367MC         Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
blk: queue 000000008f9a3628, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: HP        Model: DVD-ROM 305       Rev: 1.01
  Type:   CD-ROM                             ANSI SCSI revision: 02
blk: queue 000000008f9a3828, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: HP 36.4G  Model: MAN3367MC         Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
blk: queue 000000008f9a3a28, I/O limit 4095Mb (mask 0xffffffff)
Attached scsi disk sda at scsi0, channel 0, id 2, lun 0
Attached scsi disk sdb at scsi5, channel 0, id 2, lun 0
sym53c875-0-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
SCSI device sda: 71132960 512-byte hdwr sectors (36420 MB)
 sda: sda1 sda2 sda3
sym53c896-5-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 31)
SCSI device sdb: 71132960 512-byte hdwr sectors (36420 MB)
 sdb: unknown partition table
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 2, lun 0
sym53c875-1-<2,*>: FAST-20 SCSI 20.0 MB/s (50.0 ns, offset 16)
sr0: scsi3-mmc drive: 16x/40x cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.12
STI GSC/PCI graphics driver version 0.9
BUG: Skipping previously registered driver: sti (native)
mice: PS/2 mouse device common for all mice
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :  3434.400 MB/sec
   8regs_prefetch:  2515.600 MB/sec
   32regs    :  2800.000 MB/sec
   32regs_prefetch:  2640.000 MB/sec
raid5: using function: 8regs (3434.400 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 16384 buckets, 128Kbytes
TCP: Hash tables configured (established 262144 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 316k freed
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system
down.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
System Clock set. System local time is now Thu Sep 18 18:46:58 UTC 2003.
Calculating module dependencies... depmod: Can't open
/lib/modules/2.4.22-pa3/modules.dep for writing
done.
Loading modules: 
modprobe: Can't open dependencies file /lib/modules/2.4.22-pa3/modules.dep
(No such file or directory)
Checking all file systems...
fsck 1.27 (8-Mar-2002)
/dev/sda2: clean, 20/48960 files, 33836/195584 blocks
Setting kernel variables.
Mounting local filesystems...
/dev/sda2 on /boot type ext2 (rw)
Running 0dns-down to make sure resolv.conf is ok...done.
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: done.
Starting portmap daemon: portmap.
Starting portmapper... Mounting remote filesystems...

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Fri Sep 19 00:17:02 IST 2003

Cleaning: /tmp /var/lock eth0: Setting full-duplex based on MII#1 link
partner capability of 41e1.
/var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting NFS common utilities: statd.
Starting internet superserver: inetd.
Exporting directories for NFS kernel daemon...done.
Starting NFS kernel daemon: nfsd mountd.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.

Debian GNU/Linux 3.0 oak ttyS0

oak login: 

with warm regards,
Ranjith Sudarsanan

--------------------------------------
Ranjith Sudarsanan
Rage Team
30CA, Cunningham Road
Bangalore
--------------------------------------
"When the head bows, it meets the heart and that head which has met the
heart gets the crown!!! - Sri Sri"


------_=_NextPart_001_01C37E18.06CAF4E8
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2655.35">
<TITLE>Problems with raw interface.</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">I am developing a scsi disk exerciser and I am blocked =
on a strange problem with the raw interface. When I use the block =
device /dev/sda directly I am able to read and write from the disk =
properly. But when I use the raw interface I get garbage. For instance =
please look at the output below. I am reading the 1st sector of the =
disk, which is the boot sector, When I use the block device /dev/sda I =
get my expected output, whereas when I use the raw interface I get =
garbage. Can any one explain? The machine I am using is an L Class. =
</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have attached the start up (boot up) =
screen dump at the end of the mail</FONT>
</P>

<P><B><FONT SIZE=3D2 FACE=3D"Arial">Kernel details:</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">oak:~# uname -a</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Linux oak 2.4.22-pa3 #1 Thu Sep 18 =
23:19:58 IST 2003 parisc64 unknown</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith#</FONT><B> <FONT =
SIZE=3D2 FACE=3D"Arial">ls -l /dev/sda</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">brw-rw----&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; disk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
8,&nbsp;&nbsp; 0 Jun&nbsp; 7&nbsp; 2002 /dev/sda</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith#</FONT><B> <FONT =
SIZE=3D2 FACE=3D"Arial">ls -l /dev/sdb</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">brw-rw----&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; disk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
8,&nbsp; 16 Jun&nbsp; 7&nbsp; 2002 /dev/sdb</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith#</FONT><B> <FONT =
SIZE=3D2 FACE=3D"Arial">ls -l /dev/raw/&nbsp;&nbsp;&nbsp; </FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">total 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">crw-r--r--&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp; =
162,&nbsp;&nbsp; 4 Sep 12 00:32 raw4</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">crw-r--r--&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp; =
162,&nbsp;&nbsp; 2 Aug&nbsp; 7 00:35 rawsda</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">crw-r--r--&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp; =
162,&nbsp;&nbsp; 1 Jul 31 19:33 rawsdb</FONT>
</P>

<P><B><FONT COLOR=3D"#FF00FF" SIZE=3D2 FACE=3D"Arial">I am binding the =
raw devices to the block devices</FONT></B>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith#</FONT><B> <FONT =
SIZE=3D2 FACE=3D"Arial">raw /dev/raw/rawsdb /dev/sdb</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">/dev/raw/raw1:&nbsp; bound to major =
8, minor 16</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith# raw =
/dev/raw/rawsda /dev/sda</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">/dev/raw/raw2:&nbsp; bound to major =
8, minor 0</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith#</FONT><B> <FONT =
SIZE=3D2 FACE=3D"Arial">raw -qa</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">/dev/raw/raw1:&nbsp; bound to major =
8, minor 16</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">/dev/raw/raw2:&nbsp; bound to major =
8, minor 0</FONT>
</P>

<P><B><FONT COLOR=3D"#FF00FF" SIZE=3D2 FACE=3D"Arial">I am reading the =
1st sector of /dev/sda from which I booted</FONT></B>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith#</FONT><B> <FONT =
SIZE=3D2 FACE=3D"Arial">dd if=3D/dev/sda of=3Do_sda bs=3D512 =
count=3D8</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">8+0 records in</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">8+0 records out</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith#</FONT><B> <FONT =
SIZE=3D2 FACE=3D"Arial">xxd o_sda |more</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000000: 8000 5041 4c4f 0003 0000 =
0000 0000 0000&nbsp; ..PALO..........</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000010: 0000 0000 0000 0000 322f =
766d 6c69 6e75&nbsp; ........2/vmlinu</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000020: 7820 726f 6f74 3d2f 6465 =
762f 7364 6133&nbsp; x root=3D/dev/sda3</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000030: 2048 4f4d 453d 2f00 696e =
6974 3d2f 6269&nbsp;&nbsp; HOME=3D/.init=3D/bi</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000040: 6e2f 6261 7368 0037 3a2f =
2069 703d 6468&nbsp; n/bash.7:/ ip=3Ddh</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000050: 6370 2048 4f4d 453d 2f00 =
0000 0000 0000&nbsp; cp HOME=3D/.......</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000060: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000070: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000080: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000090: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000a0: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000b0: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000c0: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000d0: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000e0: 0000 0000 0000 0000 0004 =
4000 0050 7fd9&nbsp; ..........@..P..</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000f0: 0000 4000 0000 7800 0000 =
0000 0000 0000&nbsp; ..@...x.........</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000100: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000110: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000120: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000130: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000140: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000150: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">--More--</FONT>
</P>

<P><B><FONT COLOR=3D"#FF00FF" SIZE=3D2 FACE=3D"Arial">I am getting a =
valid output</FONT></B>
</P>

<P><B><FONT COLOR=3D"#FF00FF" SIZE=3D2 FACE=3D"Arial">Now I use the raw =
interface to read the same sector and I get garbage</FONT></B>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith#</FONT><B> <FONT =
SIZE=3D2 FACE=3D"Arial">dd if=3D/dev/raw/rawsda of=3Do_sda bs=3D512 =
count=3D8</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">8+0 records in</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">8+0 records out</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith#</FONT><B> <FONT =
SIZE=3D2 FACE=3D"Arial">xxd o_sda |more</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000000: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000010: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000020: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000030: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000040: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000050: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000060: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000070: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000080: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000090: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000a0: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000b0: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000c0: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000d0: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000e0: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">00000f0: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000100: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000110: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000120: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000130: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000140: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">0000150: 0000 0000 0000 0000 0000 =
0000 0000 0000&nbsp; ................</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">--More--</FONT>
</P>

<P><B><FONT COLOR=3D"#FF00FF" SIZE=3D2 FACE=3D"Arial">I get =
Garbage&nbsp;&nbsp; </FONT></B>
</P>
<BR>
<BR>

<P><B><FONT SIZE=3D2 FACE=3D"Arial">Boot up screen dump</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">************ EARLY BOOT VFP =
*************</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">End of early boot detected</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">*****************************************</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Firmware Version&nbsp; 41.46</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Duplex Console IO Dependent Code =
(IODC) revision 1</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">---------------------------------------------------------=
---------------------</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; (c) Copyright 1995-2000, =
Hewlett-Packard Company, All rights reserved</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">---------------------------------------------------------=
---------------------</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Processor&nbsp;&nbsp; =
Speed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
CoProcessor State&nbsp; Cache Size</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; =
Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =
State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; Inst&nbsp;&nbsp;&nbsp; Data</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; ---------&nbsp; =
--------&nbsp;&nbsp; ---------------------&nbsp; =
-----------------&nbsp; ------------</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 750&nbsp; MHz&nbsp;&nbsp; =
Active&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Functional&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 750 KB 1.5 =
MB</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 750&nbsp; MHz&nbsp;&nbsp; =
Idle&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Functional&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 750 KB 1.5 =
MB</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Central Bus Speed (in =
MHz)&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 133&nbsp; =
</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Available Memory&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp; =
16777216&nbsp; KB</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Good Memory =
Required&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 86948&nbsp; KB</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; Primary boot =
path:&nbsp;&nbsp;&nbsp; =
0/0/2/0.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; Alternate boot =
path:&nbsp; =
0/0/1/1.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; Console =
path:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0/0/4/1.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; Keyboard =
path:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0/0/4/0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;WARNING:&nbsp; The =
non-destructive test bit was set, so memory was not tested </FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; destructively.&nbsp; Information only, no action required. =
</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">Processor is booting from first =
available device.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">To discontinue, press any key within =
10 seconds.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Proceeding...</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Trying Primary Boot Path</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">------------------------</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Booting... </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Boot IO Dependent Code (IODC) =
revision 1</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">HARD Booted.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">palo ipl 1.0 root@palinux Mon =
Apr&nbsp; 1 10:02:53 MST 2002</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Partition Start(MB) End(MB) Id =
Type</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
95&nbsp;&nbsp; f0 Palo</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 96&nbsp;&nbsp;&nbsp;&nbsp; 286&nbsp;&nbsp; 83 =
ext2</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 287&nbsp;&nbsp;&nbsp; 5054&nbsp;&nbsp; 83 ext2</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">PALO(F0) partition contains:</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; 0/vmlinux64 =
5275609 bytes @ 0x44000</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Information: No console specified on =
kernel command line. This is normal.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">PALO will choose the console =
currently used by firmware (serial).</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Command line for kernel: =
'root=3D/dev/sda3 HOME=3D/ console=3DttyS0 TERM=3Dvt102 =
palo_kernel=3D2/vmlinux'</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Selected kernel: /vmlinux from =
partition 2</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">ELF64 executable</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Entry 00100000 first 00100000 n =
3</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Segment 0 load 00100000 size 2872448 =
mediaptr 0x1000</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Segment 1 load 003be000 size 1028616 =
mediaptr 0x2bf000</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Segment 2 load 004bc000 size 376832 =
mediaptr 0x3bb000</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Branching to kernel entry point =
0x00100000.&nbsp; If this is the last</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">message you see, you may need to =
switch your console.&nbsp; This is</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">a common symptom -- search the FAQ =
and mailing list at parisc-linux.org</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">********** VIRTUAL FRONT PANEL =
**********</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">System Boot detected</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">*****************************************</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">LEDs:&nbsp; =
RUN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ATTENTION&nbsp;&nbsp;&nbsp;&nbsp; =
FAULT&nbsp;&nbsp;&nbsp;&nbsp; REMOTE&nbsp;&nbsp;&nbsp;&nbsp; =
POWER</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ON&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
FLASH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
OFF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ON&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ON</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">LED State: There was a system =
interruption that did not take the system down.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Check Chassis and Console Logs for =
error messages.</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">processor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; system =
initialization&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1C00</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">*****************************************</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">************ EARLY BOOT VFP =
*************</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">End of early boot detected</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">*****************************************</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c8xx: 53c875 detected </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c8xx: at PCI bus 0, device 1, =
function 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c8xx: setting =
PCI_COMMAND_INVALIDATE (fix-up)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c8xx: 53c896 detected </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c8xx: at PCI bus 0, device 1, =
function 1</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c8xx: setting =
PCI_COMMAND_INVALIDATE (fix-up)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c8xx: 53c896 detected </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c875-0: rev 0x14 on pci bus 0 =
device 2 function 0 irq 130</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c875-0: ID 7, Fast-20, Parity =
Checking</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c875-1: rev 0x14 on pci bus 0 =
device 2 function 1 irq 131</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c875-1: ID 7, Fast-20, Parity =
Checking</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c875-2: rev 0x14 on pci bus 64 =
device 0 function 0 irq 512</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c875-2: ID 7, Fast-20, Parity =
Checking</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c875-3: rev 0x14 on pci bus 64 =
device 0 function 1 irq 513</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c875-3: ID 7, Fast-20, Parity =
Checking</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c896-4: rev 0x7 on pci bus 0 =
device 1 function 0 irq 129</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c896-4: ID 7, Fast-20, Parity =
Checking</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c896-4: handling phase mismatch =
from SCRIPTS.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c896-5: rev 0x7 on pci bus 0 =
device 1 function 1 irq 130</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c896-5: ID 7, Fast-20, Parity =
Checking</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c896-5: handling phase mismatch =
from SCRIPTS.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">scsi0 : =
sym53c8xx-1.7.3c-20010512</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">scsi1 : =
sym53c8xx-1.7.3c-20010512</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">scsi2 : =
sym53c8xx-1.7.3c-20010512</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">scsi3 : =
sym53c8xx-1.7.3c-20010512</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">scsi4 : =
sym53c8xx-1.7.3c-20010512</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">scsi5 : =
sym53c8xx-1.7.3c-20010512</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">blk: queue 000000008f9a3428, I/O =
limit 4095Mb (mask 0xffffffff)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Vendor: HP 36.4G&nbsp; Model: =
MAN3367MC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rev: =
HP04</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Type:&nbsp;&nbsp; =
Direct-Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ANSI SCSI revision: 02</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">blk: queue 000000008f9a3628, I/O =
limit 4095Mb (mask 0xffffffff)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Vendor: HP&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; Model: DVD-ROM =
305&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rev: 1.01</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Type:&nbsp;&nbsp; =
CD-ROM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANSI SCSI revision: 02</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">blk: queue 000000008f9a3828, I/O =
limit 4095Mb (mask 0xffffffff)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Vendor: HP 36.4G&nbsp; Model: =
MAN3367MC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rev: =
HP04</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Type:&nbsp;&nbsp; =
Direct-Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ANSI SCSI revision: 02</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">blk: queue 000000008f9a3a28, I/O =
limit 4095Mb (mask 0xffffffff)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Attached scsi disk sda at scsi0, =
channel 0, id 2, lun 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Attached scsi disk sdb at scsi5, =
channel 0, id 2, lun 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c875-0-&lt;2,*&gt;: FAST-20 WIDE =
SCSI 40.0 MB/s (50.0 ns, offset 16)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">SCSI device sda: 71132960 512-byte =
hdwr sectors (36420 MB)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;sda: sda1 sda2 sda3</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c896-5-&lt;2,*&gt;: FAST-20 WIDE =
SCSI 40.0 MB/s (50.0 ns, offset 31)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">SCSI device sdb: 71132960 512-byte =
hdwr sectors (36420 MB)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;sdb: unknown partition =
table</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Attached scsi CD-ROM sr0 at scsi1, =
channel 0, id 2, lun 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sym53c875-1-&lt;2,*&gt;: FAST-20 SCSI =
20.0 MB/s (50.0 ns, offset 16)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">sr0: scsi3-mmc drive: 16x/40x cd/rw =
xa/form2 cdda tray</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Uniform CD-ROM driver Revision: =
3.12</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">STI GSC/PCI graphics driver version =
0.9</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">BUG: Skipping previously registered =
driver: sti (native)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">mice: PS/2 mouse device common for =
all mice</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">HP SDC: No SDC found.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">HP SDC MLC: Registering the System =
Domain Controller's HIL MLC.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">HP SDC MLC: Request for raw HIL ISR =
hook denied</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">md: linear personality registered as =
nr 1</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">md: raid0 personality registered as =
nr 2</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">md: raid1 personality registered as =
nr 3</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">md: raid5 personality registered as =
nr 4</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">raid5: measuring checksumming =
speed</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; =
8regs&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; 3434.400 MB/sec</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; 8regs_prefetch:&nbsp; =
2515.600 MB/sec</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; 32regs&nbsp;&nbsp;&nbsp; =
:&nbsp; 2800.000 MB/sec</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; 32regs_prefetch:&nbsp; =
2640.000 MB/sec</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">raid5: using function: 8regs =
(3434.400 MB/sec)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">md: md driver 0.90.0 =
MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">md: Autodetecting RAID arrays.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">md: autorun ...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">md: ... autorun DONE.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">NET4: Linux TCP/IP 1.0 for =
NET4.0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">IP Protocols: ICMP, UDP, TCP, =
IGMP</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">IP: routing cache hash table of 16384 =
buckets, 128Kbytes</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">TCP: Hash tables configured =
(established 262144 bind 65536)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">NET4: Unix domain sockets 1.0/SMP for =
Linux NET4.0.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">VFS: Mounted root (ext2 filesystem) =
readonly.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Freeing unused kernel memory: 316k =
freed</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">********** VIRTUAL FRONT PANEL =
**********</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">System Boot detected</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">*****************************************</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">LEDs:&nbsp; =
RUN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ATTENTION&nbsp;&nbsp;&nbsp;&nbsp; =
FAULT&nbsp;&nbsp;&nbsp;&nbsp; REMOTE&nbsp;&nbsp;&nbsp;&nbsp; =
POWER</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ON&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
FLASH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
OFF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ON&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ON</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">LED State: There was a system =
interruption that did not take the system down.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Check Chassis and Console Logs for =
error messages.</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">processor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; system =
initialization&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1C00</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">*****************************************</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">************ EARLY BOOT VFP =
*************</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">End of early boot detected</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">*****************************************</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">System Clock set. System local time =
is now Thu Sep 18 18:46:58 UTC 2003.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Calculating module dependencies... =
depmod: Can't open /lib/modules/2.4.22-pa3/modules.dep for =
writing</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">done.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Loading modules: </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">modprobe: Can't open dependencies =
file /lib/modules/2.4.22-pa3/modules.dep (No such file or =
directory)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Checking all file systems...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">fsck 1.27 (8-Mar-2002)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">/dev/sda2: clean, 20/48960 files, =
33836/195584 blocks</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Setting kernel variables.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Mounting local filesystems...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">/dev/sda2 on /boot type ext2 =
(rw)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Running 0dns-down to make sure =
resolv.conf is ok...done.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Cleaning: =
/etc/network/ifstate.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Setting up IP spoofing protection: =
rp_filter.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Configuring network interfaces: =
done.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Starting portmap daemon: =
portmap.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Starting portmapper... Mounting =
remote filesystems...</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Setting the System Clock using the =
Hardware Clock as reference...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">System Clock set. Local time: Fri Sep =
19 00:17:02 IST 2003</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Cleaning: /tmp /var/lock eth0: Setting =
full-duplex based on MII#1 link partner capability of 41e1.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">/var/run.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Initializing random number =
generator... done.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Recovering nvi editor sessions... =
done.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">INIT: Entering runlevel: 2</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Starting system log daemon: =
syslogd.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Starting kernel log daemon: =
klogd.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Starting NFS common utilities: =
statd.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Starting internet superserver: =
inetd.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Exporting directories for NFS kernel =
daemon...done.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Starting NFS kernel daemon: nfsd =
mountd.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Starting deferred execution =
scheduler: atd.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Starting periodic command scheduler: =
cron.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Debian GNU/Linux 3.0 oak ttyS0</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">oak login: </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">with warm regards,</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Ranjith Sudarsanan</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">--------------------------------------</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Ranjith Sudarsanan</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Rage</FONT><FONT SIZE=3D2 =
FACE=3D"Arial"> Team</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">30CA, Cunningham Road</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Bangalore</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">--------------------------------------</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&quot;</FONT><FONT SIZE=3D2 =
FACE=3D"Arial">When the head bows, it meets the heart and that =
head</FONT> <FONT SIZE=3D2 FACE=3D"Arial">w</FONT><FONT SIZE=3D2 =
FACE=3D"Arial">hich has</FONT><FONT SIZE=3D2 FACE=3D"Arial"></FONT> =
<FONT SIZE=3D2 FACE=3D"Arial">met</FONT><FONT SIZE=3D2 =
FACE=3D"Arial"></FONT> <FONT SIZE=3D2 FACE=3D"Arial">the heart gets the =
crown!!!</FONT><FONT SIZE=3D2 FACE=3D"Arial"> - Sri Sri&quot;</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C37E18.06CAF4E8--
