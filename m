From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] Re: [PATCH] Fix the atomic compare and swap
	function on hppa
Date: Tue, 22 May 2007 17:19:30 +0200
Message-ID: <20070522151930.GA16377__36403.0837001794$1416624360$gmane$org@farad.aurel32.net>
References: <20070520015215.GA26949@amd64.aurel32.net>
	<20070520015653.GA22224@amd64.aurel32.net>
	<119aab440705200822vcfe3dd2ud542783a4ac2c3c8@mail.gmail.com>
	<4652C3EF.3020905@aurel32.net>
	<119aab440705220705s13c5fa96yd27857e22afbd2bd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
Cc: libc-ports@sourceware.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705220705s13c5fa96yd27857e22afbd2bd@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 22, 2007 at 10:05:11AM -0400, Carlos O'Donell wrote:
> On 5/22/07, Aurelien Jarno <aurelien@aurel32.net> wrote:
> >Well we still have a problem, the failure occurs less often, but still
> >sometimes. Apparently it is cause by the kernel returning -EDEADLOCK.
> >How should that be handled? The same way as -EAGAIN?
> 
> No.
> 
> The only way you can get  -EDEADLOCK back is to build a kernel with
> ENABLE_LWS_DEBUG, this is strictly a developer only feature, please do
> not enable this.
> 
> Please verify that ENABLE_LWS_DEBUG is defined as 0 in:
> arch/parisc/kernel/syscall.S:467 #define ENABLE_LWS_DEBUG 0
> 

As discussed on IRC, there is actually a bug in the kernel:

  #define ENABLE_LWS_DEBUG 0
  ...
  # ifdef ENABLE_LWS_DEBUG

ENABLE_LWS_DEBUG is defined as 0, so the debug code is enabled.

Please find below a patch which fixes the -EAGAIN problem by harcoding
the value directly into the code. It also adds a workaround for unfixed
kernels which return -EDEADLOCK.

Cheers,
Aurelien


2007-05-22  Aurelien Jarno  <aurelien@aurel32.net>

	* sysdeps/unix/sysv/linux/hppa/bits/atomic.h: check for -11 
	(-EAGAIN) instead of 11. Loop again when the kernel returns
	error -45 (-EDEADLOCK) to workaround a kernel bug (debugging
	code enabled).

--- ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h.orig	2007-05-20 03:28:39.000000000 +0200
+++ ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h	2007-05-20 03:24:41.000000000 +0200
@@ -56,10 +56,14 @@
 #define LWS_CAS "0"
 /* Note r31 is the link register */
 #define LWS_CLOBBER "r1", "r26", "r25", "r24", "r23", "r22", "r21", "r20", "r28", "r31", "memory"
-#define ASM_EAGAIN "11" 
 
 #if __ASSUME_LWS_CAS
-/* The only basic operation needed is compare and exchange.  */
+/* The only basic operation needed is compare and exchange.
+   -11 corresponds to -EAGAIN, and -45 to -EDEADLOCK. The constants
+   must stay the same to avoid breaking backwards compatibility.
+
+   The check for -EDEADLOCK workarounds a kernel bug (debugging code
+   enabled by default). */
 # define atomic_compare_and_exchange_val_acq(mem, newval, oldval) 	\
   ({									\
      volatile int lws_errno = EFAULT;					\
@@ -71,7 +75,10 @@
 	"copy	%5, %%r24			\n\t"			\
 	"ble	" LWS "(%%sr2, %%r0)		\n\t"			\
 	"ldi	" LWS_CAS ", %%r20		\n\t"			\
-	"cmpib,=,n " ASM_EAGAIN ",%%r21,0b	\n\t"			\
+	"cmpib,=,n -11,%%r21,0b			\n\t"			\
+	"nop 					\n\t"			\
+	"ldi	-45, %%r24			\n\t"			\
+	"cmpb,=,n %%r24,%%r21,0b		\n\t"			\
 	"nop					\n\t"			\
 	"stw	%%r28, %0			\n\t"			\
         "sub	%%r0, %%r21, %%r21		\n\t"			\

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
