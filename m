From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: [parisc-linux] Re: Duplicate ustat structure
Date: Sun, 16 Jul 2006 10:07:25 -0700
Message-ID: <20060716170725.GA29459@titanium.v3.ca>
References: <20060716160300.GA27091@titanium.v3.ca>
	<jeodvpbj2k.fsf@sykes.suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: libc-ports@sources.redhat.com,
 parisc-linux@lists.parisc-linux.org
To: Andreas Schwab <schwab@suse.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <jeodvpbj2k.fsf@sykes.suse.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 16, 2006 at 06:39:15PM +0200, Andreas Schwab wrote:

> > The problem is that bits/ustat.h includes the definition of struct
> > ustat.  However, sys/types.h eventually winds up pulling in
> > linux/types.h which also defines struct ustat.
> 
> <sys/types.h> should not include <linux/types.h> in the first place.

It seems like it ought to now that the kernel is exporting a set of
headers that are intended to be used by userspace.  struct ustat is
defined in linux/types.h.

But in general, this is the path by which it gets included:

include/sys/types.h includes thread_db.h

nptl_db/thread_db.h includes procfs.h

ports/sysdeps/unix/sysv/linux/hppa/sys/procfs.h includes asm/elf.h for
elf_gregset_t and elf_fpregset_t

asm-parisc/elf.h includes asm/ptrace.h unnecessarily, but relies on it
to pull in linux/types for __u32

asm-parisc/ptrace.h includes linux/types.h for __u64

So the following patch would work instead, but I think this type of fix
used to be right when the kernel folks didn't want to provide userspace
headers.  Now that they are doing so, I think it's more correct for us
to use them.

2006-07-16  Jeff Bailey  <jbailey@ubuntu.com>

	* sysdeps/unix/sysv/linux/hppa/sys/procfs.h: Don't include
	elf.h.
	Declare elf_greg_t, elf_gregset_t, elf_fpreg_t,
	and elf_fpregset_t.

Index: sysdeps/unix/sysv/linux/hppa/sys/procfs.h
===================================================================
RCS file: /cvs/glibc/ports/sysdeps/unix/sysv/linux/hppa/sys/procfs.h,v
retrieving revision 1.2
diff -u -p -r1.2 procfs.h
--- sysdeps/unix/sysv/linux/hppa/sys/procfs.h	6 Jul 2001 04:56:16 -0000	1.2
+++ sysdeps/unix/sysv/linux/hppa/sys/procfs.h	16 Jul 2006 16:57:39 -0000
@@ -34,10 +34,18 @@
 #include <sys/types.h>
 #include <sys/ucontext.h>
 #include <sys/user.h>
-#include <asm/elf.h>
 
 __BEGIN_DECLS
 
+typedef unsigned long elf_greg_t;
+#define ELF_NGREG 80    /* We only need 64 at present, but leave space
+			                              for expansion. */
+typedef elf_greg_t elf_gregset_t[ELF_NGREG];
+
+#define ELF_NFPREG 32
+typedef double elf_fpreg_t;
+typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
+
 struct elf_siginfo
   {
     int si_signo;			/* Signal number.  */


-- 
I do not agree with a word you say, but I will defend to the death your
right to say it. 
 - Voltaire
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
