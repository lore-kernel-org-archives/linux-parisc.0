Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B1E04829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Jun 2003 13:40:36 -0600 (MDT)
Date: Mon, 2 Jun 2003 19:40:03 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: patch@zabbadoz.net
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
In-Reply-To: <Pine.BSF.4.53.0306021827240.1237@e0-0.zab2.int.zabbadoz.net>
Message-ID: <Pine.BSF.4.53.0306021858520.1237@e0-0.zab2.int.zabbadoz.net>
References: <Pine.BSF.4.53.0306011303040.1237@e0-0.zab2.int.zabbadoz.net>
 <200306011543.59335.deller@gmx.de> <Pine.BSF.4.53.0306011402580.1237@e0-0.zab2.int.zabbadoz.net>
 <20030602181451.GB31212@dsl2.external.hp.com>
 <Pine.BSF.4.53.0306021827240.1237@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 2 Jun 2003, Bjoern A. Zeeb wrote:

> > > When palo cannot open the kernel and errors out shouldn't it fall back
> > > to the dialog and ask one to which fields to change instead of simply
> > > running into a dead end where I think I can only recover from with
> > > physical access to the machine ?
> >
> > The same issue has annoyed me too.
> > But not enough to hack on palo. I only work on machines remotely
> > if I have remote power control (eg A500).
> >
> > Paul Bame is happy to take any patches people have to improve
> > this behaviour.  Source is available via anon CVS:
> > 	cvs -d pserver:anonymous@cvs.parisc-linux.org login
> > 	cvs -d pserver:anonymous@cvs.parisc-linux.org co palo
>
> on sunday eve I already dowloaded 1.2 src tarball and had a quick look
> at it. I may come up with a very dirty quick hack but I really hate
> gotos in C.
>
> The Problem is that I am currently in the middle of my final exams.
> Perhaps I might come up with a patch next weekend.

forget next weekend ;-) Though the machine time is out of sync :(

a) I am no debian package builder but in debian/rules dh_testdir is
unknown - whatever it should do - as are a lotta other things. Seems
some package(?) is missing locally.

b) going to test (press me your thumbs it will work else I will
   have to find a kernel to tftp boot ...) ...
   going back to my old 2.5.60-pa1 instead of 69 typo...
   still old palo on bootup ... maybe installing the new one would be
   better for testing ;-))

c) *hhm* debian/rules build doesn't do make iplboot ? ok, doing and
   installing manually ...

d) re-run palo

e) reboot 'n' pray ... (is this a song ? ;-)

f) Bingo:

--- cut ---
palo ipl 1.2bz01 bz@apollo Mon May 26 04:02:26 UTC 2003

Partition Start(MB) End(MB) Id Type
1               1      30   f0 Palo
2              31     156   82 swap
3             157    2046   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 2955343 bytes @ 0x48000

Command line for kernel: 'root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0 palo_kernel=3/boot/vmlinux-2.5.60-pa1'
Selected kernel: /boot/vmlinux-2.5.60-pa1 from partition 3
ERROR: open /boot/vmlinux-2.5.60-pa1 from partition 3 failed
Current command line:
3/boot/vmlinux-2.5.60-pa1 root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0
 0: 3/boot/vmlinux-2.5.60-pa1
 1: root=/dev/sdb3
 2: HOME=/
 3: TERM=linux
 4: console=ttyS0

Edit which field?
(or 'b' to boot with this command line)? 0
3/boot/vmlinux-2.5.69-pa435
Current command line:
3/boot/vmlinux-2.5.69-pa435 root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0
 0: 3/boot/vmlinux-2.5.69-pa435
 1: root=/dev/sdb3
 2: HOME=/
 3: TERM=linux
 4: console=ttyS0

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: 'root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0 palo_kernel=3/boot/vmlinux-2.5.69-pa435'
Selected kernel: /boot/vmlinux-2.5.69-pa435 from partition 3
ERROR: open /boot/vmlinux-2.5.69-pa435 from partition 3 failed
Current command line:
3/boot/vmlinux-2.5.69-pa435 root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0
 0: 3/boot/vmlinux-2.5.69-pa435
 1: root=/dev/sdb3
 2: HOME=/
 3: TERM=linux
 4: console=ttyS0

Edit which field?
(or 'b' to boot with this command line)? 0
3/boot/vmlinux-2.5.69-pa1
Current command line:
3/boot/vmlinux-2.5.69-pa1 root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0
 0: 3/boot/vmlinux-2.5.69-pa1
 1: root=/dev/sdb3
 2: HOME=/
 3: TERM=linux
 4: console=ttyS0

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: 'root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0 palo_kernel=3/boot/vmlinux-2.5.69-pa1'
Selected kernel: /boot/vmlinux-2.5.69-pa1 from partition 3
ELF32 executable
Entry 001002a0 first 00100000 n 3
Segment 0 load 00100000 size 1688080 mediaptr 0x1000
Segment 1 load 0029e000 size 307316 mediaptr 0x19e000
Segment 2 load 002ec000 size 438400 mediaptr 0x1ea000
...
--- /cut ---


g) here is the patch. Thanks I remember basic for the goto ;-)
peherhaps ignore the part with the version number ...


--- ./ipl/ipl.c.orig	2003-01-14 19:44:49.000000000 +0000
+++ ./ipl/ipl.c	2003-05-26 03:34:03.000000000 +0000
@@ -367,6 +367,7 @@
 	}
     }

+interactive_loop:
     if (is_interactive)
 	interact(&f);

@@ -510,7 +511,9 @@
 	    (partition[kern_part - 1].id != 0x83 && partition[kern_part - 1].id != 0xfd) )
 	{
 	    printf("ERROR: Partition %d must be ext2\n", kern_part);
-	    while(1);
+
+	    is_interactive = 1;
+	    goto interactive_loop;
 	}

 	pp = &partition[kern_part - 1];
@@ -527,7 +530,9 @@
 	{
 	    printf("ERROR: open %s from partition %d failed\n",
 		kern_name, kern_part);
-	    while(1);
+
+	    is_interactive = 1;
+	    goto interactive_loop;
 	}

 	bkern_fd = byteio_open(kern_fd);
--- ./lib/common.h.orig	2003-05-26 03:34:11.000000000 +0000
+++ ./lib/common.h	2003-05-26 03:34:18.000000000 +0000
@@ -11,7 +11,7 @@
 #include <asm/byteorder.h>
 #include <linux/genhd.h>

-#define PALOVERSION "1.2"
+#define PALOVERSION "1.2bz01"

 /* size of I/O block used in HP firmware */
 #define FW_BLOCKSIZE	2048


-- 
Greetings

Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
