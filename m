Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 954314830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jun 2003 11:47:07 -0600 (MDT)
Date: Wed, 11 Jun 2003 19:46:54 +0200
Message-ID: <3ED4C8B600004A2B@ocpmta1.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] palo II
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Bjoern,

Anoyed to change my fstab because I add or remove a disk to/from the external
scsi controler of my b2k (boot disk sda became sdb, sdc, or what else),
I decide so to test devfs kernel. It seems to works (excepted that I could
not specify root=/dev/scsi/host1/bus0/target5/lun0/part5)

Coming back to the actual pb with new palo:
the original ipl prompt is:
PALO(F0) partition contains:
    0/vmlinux32 3826722 bytes @ 0x44000

Information: No console specified on kernel command line. 
his is normal.
PALO will choose the console currently used by firmware (serial).Current
command line:
3/vmlinux-2.4.19-pre10-pa39-tsi root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
 0: 3/vmlinux-2.4.19-pre10-pa39-tsi
 1: root=/dev/sda5
 2: HOME=/

 3: console=ttyS0
 4: TERM=vt102

which I would like to change in:
Current command line:
3/vmlinux-2.4.21-rc8-pa35-devfs root=/dev/scsi/host1/bus0/target5/lun0/part5
HOME=/ console=ttyS0 TERM=vt102
 0: 3/vmlinux-2.4.21-rc8-pa35-devfs
 1: root=/dev/scsi/host1/bus0/target5/lun0/part5
 2: HOME=/
 3: console=ttyS0
 4: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: 'root=/dev/scsi/host1/bus0/target5/lun0/part5 HOME=/
console=ttyS0 TERM=
t102 palo_kernel=3/vmlinux-2.4.21-rc8-pa35-devfs'
Selected kernel: /vmlinux-2.4.21-rc8-pa35-devfs from partition 3

the system hang here (just read on LCD "init c7ff")

(btw, there is no pb if I don't change root path and the final lenght of
cmd line is of 121 characters < 256 of buffer ??)

I so come back to palo-1.2 where the pb don't occure:
Command line for kernel: 'root=/dev/scsi/host1/bus0/target5/lun0/part5 HOME=/
console=ttyS0 TERM=vt102 palo_kernel=3/vmlinux-2.4.21-rc8-pa35-devfs'

Selected kernel: /vmlinux-2.4.21-rc8-pa35-devfs from partition 3
ELF32 executable
Entry 00100210 first 00100000 n 6
Segment 0 load 00100000 size 2101928 mediaptr 0x1000
[...]

Even thought later:
[...]
VFS: Unable to mount root fs via NFS, trying floppy.
VFS: Cannot open root device "scsi/host1/bus0/target5/lun0/part5" or 02:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 02:00

Never the less, in the cmdln the root device seems to be well /dev/scsi/...
and here is just mentionned scsi/... (may be normal, don't know)?

Any idea (how to debug)?

Thanks in advance,
    Joel





---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
