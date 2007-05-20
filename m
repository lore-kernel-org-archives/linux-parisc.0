From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] Re: [PATCH] Fix the atomic compare and swap
	function
Date: Sun, 20 May 2007 23:19:01 +0200
Message-ID: <20070520211900.GA22493__2028.50371501899$1416624365$gmane$org@i386.aurel32.net>
References: <119aab440705200822vcfe3dd2ud542783a4ac2c3c8@mail.gmail.com>
	<200705201534.l4KFYknM023731@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
Cc: libc-ports@sourceware.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200705201534.l4KFYknM023731@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, May 20, 2007 at 11:34:46AM -0400, John David Anglin wrote:
> > > -#define ASM_EAGAIN "11"
> > > +#define ASM_EAGAIN "-11"
> 
> If the check is wrong, I would change the compare instead of the
> define.  Error numbers are normally defined as positive values.
> 

Then, what about this patch?

--- ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h.orig	2007-05-20 23:15:37.000000000 +0200
+++ ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h	2007-05-20 23:15:59.000000000 +0200
@@ -71,10 +71,10 @@
 	"copy	%5, %%r24			\n\t"			\
 	"ble	" LWS "(%%sr2, %%r0)		\n\t"			\
 	"ldi	" LWS_CAS ", %%r20		\n\t"			\
+        "sub	%%r0, %%r21, %%r21		\n\t"			\
 	"cmpib,=,n " ASM_EAGAIN ",%%r21,0b	\n\t"			\
 	"nop					\n\t"			\
 	"stw	%%r28, %0			\n\t"			\
-        "sub	%%r0, %%r21, %%r21		\n\t"			\
 	"stw	%%r21, %1			\n\t"			\
 	: "=m" (lws_ret), "=m" (lws_errno), "=m" (*mem)			\
         : "r" (mem), "r" (oldval), "r" (newval)				\

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
