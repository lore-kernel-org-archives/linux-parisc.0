From: Aurelien Jarno <aurelien@aurel32.net>
Subject: [parisc-linux] Re: [PATCH] Fix the atomic compare and swap function
	on hppa
Date: Sun, 20 May 2007 03:56:53 +0200
Message-ID: <20070520015653.GA22224__24390.3088187382$1416624362$gmane$org@amd64.aurel32.net>
References: <20070520015215.GA26949@amd64.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
Cc: parisc-linux@lists.parisc-linux.org
To: libc-ports@sourceware.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070520015215.GA26949@amd64.aurel32.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, May 20, 2007 at 03:52:15AM +0200, Aurelien Jarno wrote:
> Hi,
> 
> I have finally tracked down the "error while loading shared libraries: 
> internal error: symidx out of range of fptr table" problem. 
> 
> It comes from a bug in atomic.h, the errno number is compared with the
> wrong value. The kernel returns -EAGAIN (ie -11), but the value in the
> cmpib instruction is EAGAIN (11).
> 
> The patch below fixes the problem.
> 

Oops this patch is reversed.

Please find a new version below.


2007-05-20  Aurelien Jarno  <aurelien@aurel32.net>

	* sysdeps/unix/sysv/linux/hppa/bits/atomic.h: check for
	-EAGAIN instead of EAGAIN.

--- ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h.orig	2007-05-20 03:28:39.000000000 +0200
+++ ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h	2007-05-20 03:24:41.000000000 +0200
@@ -56,7 +56,7 @@
 #define LWS_CAS "0"
 /* Note r31 is the link register */
 #define LWS_CLOBBER "r1", "r26", "r25", "r24", "r23", "r22", "r21", "r20", "r28", "r31", "memory"
-#define ASM_EAGAIN "11" 
+#define ASM_EAGAIN "-11" 
 
 #if __ASSUME_LWS_CAS
 /* The only basic operation needed is compare and exchange.  */

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
