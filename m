Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id E56AE482A
	for <parisc-linux@parisc-linux.org>; Wed, 27 Mar 2002 17:39:31 -0700 (MST)
Received: from localhost.localdomain (beavis.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id 8BBEEBD42
	for <parisc-linux@parisc-linux.org>; Wed, 27 Mar 2002 17:39:28 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@parisc-linux.org
Content-Type: multipart/mixed; boundary="=-FzfXyKX/ypTtkYeGQXm4"
Date: 27 Mar 2002 17:39:28 -0700
Message-Id: <1017275968.24441.54.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] Patch for PA 2.0, 32-bit kernels on systems with > 2GB RAM
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

--=-FzfXyKX/ypTtkYeGQXm4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello parisc-linux hackers,

The 2.4.18-pa6 patch broke 32-bit kernel on PA 2.0 systems if the system
has > 2GB RAM.  This patch fixes the problem for my C200+ with > 2GB
RAM, and continues to boots with < 2GB RAM.

The basic problem was that the kernel was performing simple sign
extension instead of F-Extension.

I plan on committing this patch into CVS in a couple of days unless it
causes problems on someones configuration.  Please test and let me
know if you encounter problems.

Thanks,

- Ryan

P.S. Thanks to Thomas Bogendoerfer for helping to identify the cause,
and to LaMont Jones for providing the assembly instructions to fix the
problem without using a branch instruction :)



--=-FzfXyKX/ypTtkYeGQXm4
Content-Disposition: attachment; filename=entry.S.diff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; charset=ISO-8859-1

Index: arch/parisc/kernel/entry.S
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux/arch/parisc/kernel/entry.S,v
retrieving revision 1.91
diff -u -p -r1.91 entry.S
--- arch/parisc/kernel/entry.S	2002/03/20 05:08:58	1.91
+++ arch/parisc/kernel/entry.S	2002/03/27 04:28:11
@@ -1352,12 +1352,10 @@ dtlb_miss_20:
=20
 	/* Get rid of prot bits and convert to page addr for idtlbt */
=20
-	/* FIXME - sign extension of 0xf0... range is incorrect!
-	** extrd,s below needs to "f-extend" to "0xf0f0f0...".
-	** 4 instances of this to fix.
-	*/
-
+	extrd,s         pte,35,4,t0
 	depdi		0,63,12,pte	/* clear lower 12 bits */
+        addi,=3D          1,t0,0=20
+        extrd,u,*tr     pte,56,25,pte=20
 	extrd,s		pte,56,25,pte	/* bit 31:8 >> 8  */=20
 	idtlbt          pte,prot
=20
@@ -1424,9 +1422,12 @@ nadtlb_miss_20:
=20
 	/* Get rid of prot bits and convert to page addr for idtlbt */
=20
-	depdi		0,63,12,pte	/* clear lower 12 bits */
-	extrd,s		pte,56,25,pte	/* bit 31:8 >> 8  */=20
-	idtlbt          pte,prot
+        extrd,s         pte,35,4,t0
+        depdi           0,63,12,pte     /* clear lower 12 bits */
+        addi,=3D          1,t0,0
+        extrd,u,*tr     pte,56,25,pte
+        extrd,s         pte,56,25,pte   /* bit 31:8 >> 8  */
+        idtlbt          pte,prot
=20
 	rfir
 	nop
@@ -1674,8 +1675,11 @@ itlb_miss_common_20:
=20
 	/* Get rid of prot bits and convert to page addr for iitlbt */
=20
-	depdi		0,63,12,pte	/* clear lower 12 bits */
-	extrd,s		pte,56,25,pte	/* bit 31:8 >> 8  */=20
+        extrd,s         pte,35,4,t0=20
+        depdi           0,63,12,pte     /* clear lower 12 bits */
+        addi,=3D          1,t0,0
+        extrd,u,*tr     pte,56,25,pte=20
+        extrd,s         pte,56,25,pte   /* bit 31:8 >> 8  */
 	iitlbt          pte,prot
=20
 	rfir
@@ -1889,11 +1893,13 @@ dbit_nolock_20:
 	extrd,u,*=3D 	pte,_PAGE_GATEWAY_BIT+32,1,r0
 	depdi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
=20
-	/* Get rid of prot bits and convert to page addr for idtlbt */
+        extrd,s         pte,35,4,t0=20
+        depdi           0,63,12,pte     /* clear lower 12 bits */
+        addi,=3D          1,t0,0
+        extrd,u,*tr     pte,56,25,pte=20
+        extrd,s         pte,56,25,pte   /* bit 31:8 >> 8  */
+        idtlbt          pte,prot
=20
-	depdi		0,63,12,pte	/* clear lower 12 bits */
-	extrd,s		pte,56,25,pte	/* bit 31:8 >> 8  */=20
-	idtlbt          pte,prot
 #ifdef CONFIG_SMP
 	CMPIB=3D,n        0,spc,dbit_nounlock_20
 	ldi             1,t1

--=-FzfXyKX/ypTtkYeGQXm4--
