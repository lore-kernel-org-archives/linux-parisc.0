Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 851394830
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jul 2003 06:11:50 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157024107.dialin.heagmedianet.de [213.157.24.107])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h6KCBcI7023295
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jul 2003 14:11:40 +0200
Message-ID: <3F1A857B.5030104@hrzpub.tu-darmstadt.de>
Date: Sun, 20 Jul 2003 14:05:15 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------050301080609020600000804"
Subject: [parisc-linux] [PATCH] getting a working kernel-2.6.0-test1 with gcc > 3.2
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

This is a multi-part message in MIME format.
--------------050301080609020600000804
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi there!

I finally found the appropriate patch to add the function 
"canonicalize_funcptr_for_compare" to the kernel. It was in 
ftp://ftp.parisc-linux.org/patches/diff-2.4.21-pa2 . A simple 
cut'n'paste to the kernel source of 2.6.0-test1 gives me a working 
kernel with gcc-3.2 on my 715/100.
I don't know whether more stuff of diff-2.4.21-pa2 could go into 2.6.0, 
so I just make a small patch of this particular problem. Can s.b. please 
check this in?
Greetings,
    Ruediger

--------------050301080609020600000804
Content-Type: text/plain;
 name="patch.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.diff"

Index: linux-2.5/arch/parisc/kernel/parisc_ksyms.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/parisc_ksyms.c,v
retrieving revision 1.21
diff -u -p -r1.21 parisc_ksyms.c
--- linux-2.5/arch/parisc/kernel/parisc_ksyms.c	9 Jun 2003 02:24:25 -0000	1.21
+++ linux-2.5/arch/parisc/kernel/parisc_ksyms.c	20 Jul 2003 11:52:21 -0000
@@ -220,3 +220,6 @@ EXPORT_SYMBOL($$dyncall);

 #include <asm/pgtable.h>
 EXPORT_SYMBOL(vmalloc_start);
+
+asmlinkage void * __canonicalize_funcptr_for_compare(void *);
+EXPORT_SYMBOL_NOVERS(__canonicalize_funcptr_for_compare);

Index: linux-2.5/arch/parisc/kernel/real2.S
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/real2.S,v
retrieving revision 1.4
diff -u -p -r1.4 real2.S
--- linux-2.5/arch/parisc/kernel/real2.S	14 Jul 2003 15:21:07 -0000	1.4
+++ linux-2.5/arch/parisc/kernel/real2.S	20 Jul 2003 11:52:21 -0000
@@ -275,6 +275,7 @@ r64_ret:
 	nop

 #endif
+
 	.export pc_in_user_space
 	.text
 	/* Doesn't belong here but I couldn't find a nicer spot. */
@@ -283,3 +284,16 @@ pc_in_user_space:
 	bv,n	0(%rp)
 	nop

+	.export __canonicalize_funcptr_for_compare
+	.text
+	/* http://lists.parisc-linux.org/hypermail/parisc-linux/10916.html
+	**	GCC 3.3 and later has a new function in libgcc.a for
+	**	comparing function pointers.
+	*/
+__canonicalize_funcptr_for_compare:
+#ifdef __LP64__
+       bve (%r2)
+#else
+       bv %r0(%r2)
+#endif
+       copy %r26,%r28

--------------050301080609020600000804--
