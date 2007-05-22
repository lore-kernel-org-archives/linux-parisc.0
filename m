From: Aurelien Jarno <aurelien@aurel32.net>
Subject: [parisc-linux] [PATCH] parisc: Disable LWS debugging
Date: Tue, 22 May 2007 17:38:26 +0200
Message-ID: <20070522153825.GA16404__31260.7159991332$1416624361$gmane$org@farad.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
Cc: parisc-linux@lists.parisc-linux.org
To: linux-kernel@vger.kernel.org
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

The LWS debugging code on parisc is wrongly enabled due to a bug in the
use of the preprocessor directives. This debugging code is not thread 
safe and causes problems with a recent glibc on SMP kernels.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Cc: parisc-linux@lists.parisc-linux.org
---
 syscall.S |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net


diff -u a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -501,7 +501,7 @@
 	shlw	%r20, 4, %r20
 	add	%r20, %r28, %r20
 
-# ifdef ENABLE_LWS_DEBUG
+# if ENABLE_LWS_DEBUG
 	/*	
 		DEBUG, check for deadlock! 
 		If the thread register values are the same
@@ -550,7 +550,7 @@
 		perspective
 	*/
 cas_action:
-#if defined CONFIG_SMP && defined ENABLE_LWS_DEBUG
+#if defined CONFIG_SMP && ENABLE_LWS_DEBUG
 	/* DEBUG */
 	mfctl	%cr27, %r1
 	stw	%r1, 4(%sr2,%r20)
@@ -562,7 +562,7 @@
 #ifdef CONFIG_SMP
 	/* Free lock */
 	stw	%r20, 0(%sr2,%r20)
-# ifdef ENABLE_LWS_DEBUG
+# if ENABLE_LWS_DEBUG
 	/* Clear thread register indicator */
 	stw	%r0, 4(%sr2,%r20)
 # endif
@@ -576,7 +576,7 @@
 #ifdef CONFIG_SMP
 	/* Free lock */
 	stw	%r20, 0(%sr2,%r20)
-# ifdef ENABLE_LWS_DEBUG
+# if ENABLE_LWS_DEBUG
 	stw	%r0, 4(%sr2,%r20)
 # endif
 #endif
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
