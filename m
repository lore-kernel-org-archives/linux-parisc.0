Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (unknown [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 063764829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jun 2003 06:00:01 -0600 (MDT)
Date: Thu, 5 Jun 2003 13:59:48 +0200
Message-ID: <3ED4C8B600002734@ocpmta1.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] palo II
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>,
	parisc-linux@lists.parisc-linux.org
Cc: "Grant Grundler" <grundler@parisc-linux.org>,
	"Helge Deller" <deller@gmx.de>
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

> On Mon, 2 Jun 2003, Bjoern A. Zeeb wrote:
>
> Hi,
>
> > g) here is the patch. Thanks I remember basic for the goto ;-)

Simple and efficent;

> > peherhaps ignore the part with the version number ...
>
> well please - before commiting - verifiy ... I t
ink there is a
> problem maybe with some pointer ... Will have to verify all possible
> paths ... going to re-check and let you know.
>
> --- cut ---
> /boot/vmlinux-2.5.69-pa1 74 00L 1X c 1Q root=/dev/sdb3 HOME=/ TERM=linux
conso0
>  0: 3/boot/vmlinux-2.5.69-pa1
>  1: 74
>  2: 00L
>  3: 1X
>  4: c
>  5: 1Q
>  6: root=/dev/sdb3
>  7: HOME=/
>  8: TERM=linux
>  9: console=ttyS0
>
> Edit which field?
> (or 'b' to boot with this command line)?
> --- cut ---

Hmm how may I reproduce?


btw (as rought draft) I also consider the case if you accidently choose
swap (even on a md), here is the full patch:
=====
diff -Naur --exclude iplboot palo-1.2/debian/changelog palo-1.3/debian/changelog
--- palo-1.2/debian/changelog	2003-01-14
21:07:52.000000000 +0100
+++ palo-1.3/debian/changelog	2003-06-05 11:20:38.000000000 +0200
@@ -1,3 +1,9 @@
+palo (1.3) unstable; urgency=low
+
+  * Comeback to interact if failled to find boot kernel (Bjoern A. Zeeb)
+
+ -- Paul Bame <bame@debian.org>  Tue, 14 Jan 2003 13:06:45 -0700
+
 palo (1.2) unstable; urgency=low

   * Recognize RAID partition types (Martin K. Petersen)
diff -Naur --exclude iplboot palo-1.2/ipl/ipl.c palo-1.3/ipl/ipl.c
--- palo-1.2/ipl/ipl.c	2003-01-14 20:44:49.000000000 +0100
+++ palo-1.3/ipl/ipl.c	2003-06-05 12:56:25.000000000 +0200
@@ -367,6 +367,7 @@
 	}
     }

+interactive_loop:
     if (is_interactive)
 	interact(&f);

@@ -406,7 +407,9 @@
     {
 	printf("ERROR: Requesting kernel from partition %d "
 		    "on unpartitioned media!\n", kern_part);
-	while(1);
+
+        is_interactive = 1;
+        goto interactive_loop;
     }

     if (rd_part != -1 && rd_part != kern_part)
@@ -510,7 +513,9 @@
 	    (partition[kern_part - 1].id != 0x83 && partition[kern_part - 1].id
!= 0xfd) )
 	{
 	    printf("ERROR: Partition %d must be ext2\n", kern_part);
-	    while(1);
+
+            is_interactive = 1;
+            goto interactive_loop;
 	}

 	pp = &partition[kern_part - 1];
@@
-518,8 +523,13 @@
 	part_fd = offset_open(bootdev, 512 * pp->start, 512 * pp->length);

 	mount_fd = ext2_mount(part_fd, 0, 0);
-	if (0) printf("ext2_mount(partition %d) returns %d\n",
-	    kern_part, mount_fd);
+	if (mount_fd < 0){
+            printf("ext2_mount(partition %d) returns %d\n",
+	            kern_part, mount_fd);
+
+            is_interactive = 1;
+            goto interactive_loop;
+	}

 	kern_fd = ext2_open(kern_name);
 	if (0) printf("ext2_open(%s) = %d\n", kern_name
 kern_fd);
@@ -527,7 +537,9 @@
 	{
 	    printf("ERROR: open %s from partition %d failed\n",
 		kern_name, kern_part);
-	    while(1);
+
+            is_interactive = 1;
+            goto interactive_loop;
 	}

 	bkern_fd = byteio_open(kern_fd);
diff -Naur --exclude iplboot palo-1.2/lib/common.h palo-1.3/lib/common.h
--- palo-1.2/lib/common.h	2003-01-14 21:06:14.000000000 +0100
+++ palo-1.3/lib/common.h	2003-06-05 11:53:20.000000000 +0200
@@ -11,7 +11,7 @@
 #include <asm/byteorder.h>

 #include <linux/genhd.h>

-#define PALOVERSION "1.2"
+#define PALOVERSION "1.3"

 /* size of I/O block used in HP firmware */
 #define FW_BLOCKSIZE	2048

====

Up to you to adapt changes in changelog and lib/common.h :)

I a not an expert 
n debian building pkg but to rebuild a source tree i
follow this small recipe:
A) grab palo_1.2.dsc palo_1.2.tar.gz into your test dir
B) dpkg-source -x palo_1.2.dsc
this will extract palo-1.2
C) I rename palo-1.2 into palo-1.3 [according to chang
log revision]
D) cd palo-1.3
E) apply above patch (patch -p1 -i YourPatchFile)
E) dpkg-buildpackage [ 2>&1 | tee ../palo-1.3.bpkg # to log build messages]
on a _linux-parisc_ box it would rebuild iplboot :)

if successfull, you would find in the 
pper dir palo_1.3_hppa.deb dpkg which
you can just install.

hth,
    Joel

PS: another kind thing would be add edition line capability (any idea?)



---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
