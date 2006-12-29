From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] fix error condition in glibc's clone() call
Date: Fri, 29 Dec 2006 17:09:34 +0100
Message-ID: <200612291709.34592.deller__22584.7319853075$1416624242$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Joel Soete <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
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

Hello,

The following patch to glibc fixes an error which is triggered by the Linux Test Projects clone04 test, and was already mentioned and analyzed by Mike and Joel (see links to mail threads below).
The problem is, that if clone(<function>, <stack>, ...) is called and <function> or <stack> is NULL, then %r19 is restored from a location which wasn't initialized.
Something like this...
clone:
		if <function> == NULL goto .Lerror
		if <stack>== NULL goto .Lerror
		save_%r19_on_stack
		.....
.Lerror:	restore_%r19_from_stack  ##### <- may read from stack without %r19 having been saved here !
		goto __syscall_error

The patch below moves the "save_%r19_on_stack" part above the checks, so that "restore_%r19_from_stack" always reads the correct value.

Any takers to bring this patch into glibc ?

Helge

Original threads:
http://lists.parisc-linux.org/pipermail/parisc-linux/2006-January/028088.html
http://lists.parisc-linux.org/pipermail/parisc-linux/2006-March/028552.html
http://sourceware.org/ml/libc-alpha/2003-12/msg00120.html

PATCH:
--- ../glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S.org	2006-12-29 08:49:25.000000000 +0100
+++ ../glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S	2006-12-29 16:58:30.000000000 +0100
@@ -32,6 +32,11 @@
 ENTRY(__clone)
 	/* FIXME: I have no idea how profiling works on hppa. */
 
+	/* Save the PIC register. */
+#ifdef PIC
+	stw	%r19,-32(%sr0, %sp)	/* parent */
+#endif
+
 	/* Sanity check arguments.  */
 	comib,=  0,%arg0,.Lerror        /* no NULL function pointers */
 	ldi     -EINVAL,%ret0
@@ -42,11 +47,6 @@
 	stwm    %arg0,64(%arg1)
 	stw	%arg3,-60(%arg1)
 
-	/* Save the PIC register. */
-#ifdef PIC
-	stw	%r19,-32(%sr0, %sp)	/* parent */
-#endif
