From: "Ryan Bradetich" <rbradetich@gmail.com>
Subject: [parisc-linux] [PATCH] Fixs to work on ARM and PARIC platforms.
Date: Sat, 1 Apr 2006 01:22:20 -0800
Message-ID: <e739902b0604010122tefc6ab5radf8121eea8a3015__14044.421821791$1416624037$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="----=_Part_37864_1435824.1143883340132"
To: fuse-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

------=_Part_37864_1435824.1143883340132
Content-Type: multipart/alternative;
	boundary="----=_Part_37865_6263148.1143883340132"

------=_Part_37865_6263148.1143883340132
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all,

I spend the last couple days tracking down why FUSE would not work on the
ARM and PARISC platform ... With the hints from  James Bottomley in the
"Example filesystems fail to init on parisc" thread and a fair amount of
persistence I was got a patch that works.

The patch really fixes two bugs:

1.  The rwlock tree_lock  in struct fuse was not properly initialized using
pthread_rwlock_init().    This normally works on other archs (besides
PARISC) since the lock can be initialized to 0 values, this is not true on
the PARISC platform ... these locks must be initialized properly to work on
PARISC.

2. I had to add an additional cache flush in the fuse_copy_do function.  On
both ARM and PARISC, the data was corrupted unless cache is flushed first.
Unfortunately I hit it with a very big hammer (flush_cache_all) ... I am
hoping someone more familiar with the caches will suggest a better flush
function to use.  I tried to use the flush_kernel_dcache_page and
flush_dcache_page functions without any luck :(


Hopefully this work will enable FUSE to work on these architectures in the
near future.

Thanks,

- Ryan

------=_Part_37865_6263148.1143883340132
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all,<br><br>I spend the last couple days tracking down why FUSE would=
 not work on the ARM and PARISC platform ... With the hints from&nbsp; Jame=
s Bottomley in the &quot;Example filesystems fail to init on parisc&quot; t=
hread and a fair amount of persistence I was got a patch that works.&nbsp;=
=20
<br><br>The patch really fixes two bugs:<br><br>1.&nbsp; The rwlock tree_lo=
ck&nbsp; in struct fuse was not properly initialized using pthread_rwlock_i=
nit().&nbsp;&nbsp;&nbsp; This normally works on other archs (besides PARISC=
) since the lock can be initialized to 0 values, this is not true on the PA=
RISC platform ... these locks must be initialized properly to work on PARIS=
C.
<br><br>2. I had to add an additional cache flush in the fuse_copy_do funct=
ion.&nbsp; On both ARM and PARISC, the data was corrupted unless cache is f=
lushed first.&nbsp; Unfortunately I hit it with a very big hammer (flush_ca=
che_all) ... I am hoping someone more familiar with the caches will suggest=
 a better flush function to use.&nbsp; I tried to use the flush_kernel_dcac=
he_page and flush_dcache_page functions without any luck :(
<br><br><br>Hopefully this work will enable FUSE to work on these architect=
ures in the near future.<br><br>Thanks,<br><br>- Ryan<br>

------=_Part_37865_6263148.1143883340132--

------=_Part_37864_1435824.1143883340132
Content-Type: text/x-patch; name=fuse-kernel.patch; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_elhqhfpe
Content-Disposition: attachment; filename="fuse-kernel.patch"

--- fuse-2.6.0-pre2/kernel/dev.c.orig	2006-04-01 00:40:28.000000000 -0800
+++ fuse-2.6.0-pre2/kernel/dev.c	2006-04-01 00:40:43.000000000 -0800
@@ -522,6 +522,7 @@
 {
 	unsigned ncpy = min(*size, cs->len);
 	if (val) {
+		flush_cache_all();
 		if (cs->write)
 			memcpy(cs->buf, *val, ncpy);
 		else

------=_Part_37864_1435824.1143883340132
Content-Type: text/x-patch; name=fuse-lib.patch; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_elhqi305
Content-Disposition: attachment; filename="fuse-lib.patch"

--- fuse-2.6.0-pre2/lib/fuse.c.orig	2006-04-01 00:54:32.000000000 -0800
+++ fuse-2.6.0-pre2/lib/fuse.c	2006-04-01 00:47:48.000000000 -0800
@@ -2068,6 +2068,7 @@
     }
 
     mutex_init(&f->lock);
+    pthread_rwlock_init(&f->tree_lock, PTHREAD_RWLOCK_PREFER_READER_NP);
     memcpy(&f->op, op, op_size);
     f->compat = compat;
 

------=_Part_37864_1435824.1143883340132
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
------=_Part_37864_1435824.1143883340132--
