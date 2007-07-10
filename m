From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Tue, 10 Jul 2007 09:23:23 +0200
Message-ID: <20070710072322.GA28527__35070.9815546454$1416624410$gmane$org@farad.aurel32.net>
References: <20070705142222.GA26105@frankengul.org> <200707051518.l65FI56n006476@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
Cc: seb@frankengul.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org,
 libc-ports@sources.redhat.com,
 Carlos O'Donell <carlos@systemhalted.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200707051518.l65FI56n006476@hiauly1.hia.nrc.ca>
Resent-Message-ID: <oter8.A.BAF.4QzkGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Thu, Jul 05, 2007 at 11:18:05AM -0400, John David Anglin wrote:
> > > Could you do glibc builds with the gcc trunk before and after the change?
> > > It's best to base the PR on an unmodified version of gcc.
> > 
> > The test with the gcc-trunk (Main 4.3.0 head) shows the same error at the same place.
> 
> Ok, it would be useful to file a gcc PR to start.  However, it's not
> clear that gcc is a fault.
> 
> It may be that glibc isn't using the visibility attribute correctly
> for this symbol (i.e., hiding a symbol that is externally referenced).


The patch below based on the m68k version of sysdep-cancel.h fixes the
problem.


2007-07-10  Aurelien Jarno  <aurelien@aurel32.net>

	* sysdeps/unix/sysv/linux/hppa/linuxthreads/sysdep-cancel.h:
	(__local_multiple_threads): Declare as hidden only in libc and
	in libpthread.

Index: ports/sysdeps/unix/sysv/linux/hppa/linuxthreads/sysdep-cancel.h 
===================================================================
--- ports/sysdeps/unix/sysv/linux/hppa/linuxthreads/sysdep-cancel.h.orig
+++ ports/sysdeps/unix/sysv/linux/hppa/linuxthreads/sysdep-cancel.h
@@ -206,7 +206,11 @@
 # endif
 
 # ifndef __ASSEMBLER__
- extern int __local_multiple_threads attribute_hidden;
+#  if !defined NOT_IN_libc || defined IS_IN_libpthread
+extern int __local_multiple_threads attribute_hidden;
+#  else
+extern int __local_multiple_threads;
+#  endif
 #  define SINGLE_THREAD_P __builtin_expect (__local_multiple_threads == 0, 1)
 # else
 /* This ALT version requires newer kernel support */

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
