Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id MAA27295
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 12:47:43 -0700
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id MAA12104
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 12:50:11 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=noam.fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 141Zid-00049i-00
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 12:50:11 -0700
To: parisc-linux@puffin.external.hp.com
Date: Thu, 30 Nov 2000 12:50:11 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E141Zid-00049i-00@noam.fc.hp.com>
Subject: [parisc-linux] time_t, size_t, off_t, ...
List-ID: <linux-parisc.vger.kernel.org>


Thanks for all the helpful suggestions for data types.  Here's
my current plan so far as I know it, plus some questions/gripes.  I
have no current plans to break user space, though a new glibc
should be produced eventually because of changes to struct sigcontext.
I hope to make and test most(3) of these changes today.  Let me know
if anything is flatly stupid -- I already know some choices are not
ideal because ideal is impossible (off_t for example).

						# bits
					parisc		parisc64
					------------------------
__kernel_off_t (long)			32		64(1)
__kernel_size_t	(unsigned long)		32		64(1)
__kernel_daddr_t (int)			32		32(2)
__kernel_time_t (long)			32		64(1,3)
__kernel_suseconds_t (long)		32		64(1,3)
sigset_t.sig[] (long)			32		64(4)
__kernel_ino_t (unsigned int)		32		32(5)
elf.h:gregs_t				DEBUGGER ISSUE(6)

(1)	A difference from the current posix_types.h

(2)	Appears to be used for an on-media data structure.  mips64
	has it 64 bits which is probably wrong.

(3)	I'm currently using 32-bit time_t and suseconds_t for my 64-bit
	kernel and it appears to work just fine, and saves lots of syscall
	wrapper work.  However the other ports use 'long' so there's
	probably a good reason (or hidden assumptions in kernel code)
	for it.  Those are
	probably not the best reasons (I mean, why should a type used
	to describe milliseconds (timeval.tv_usec) be 64 bits?  Oh well,
	here come lots more 32/64 syscall wrappers to handle timevals.

	** NOTE ** I may not make the changes to these two types
	immediately due to the number of (uninteresting) syscall
	wrappers required (I'd rather write the networking ones first).
	Sorry this means posix_types.h may change more than once.

(4)	I thought I could get away with making this 'int' and therefore
	32 bits everywhere.  It would save several 32/64 syscall
	wrappers (and increase speed).  However this little piece
	in kernel/signal.c is a hard-coded assumption that .sig[] is
	an array of long, and was a bitch to find:

		unsigned long i, *s, *m, x;
		s = tsk->pending.signal.sig;

(5)	This looks to be 32 bits everywhere, even on 64-bit archs,
	with the single exception of sparc.  Although this little
	snippet in <linux/nfs_fs.h>:

	static inline ino_t
	nfs_fileid_to_ino_t(u64 fileid)
	{
		ino_t ino = (ino_t) fileid;
		if (sizeof(ino_t) < sizeof(u64))
			ino ^= fileid >> (sizeof(u64)-sizeof(ino_t)) * 8;
		return ino;
	}
	
	clearly shows a 32-bit ino_t is currently a (potential) problem,
	it seems to me this is a Linux problem not a parisc problem, so
	it seemed better to follow the lead of the other ports.

(6)	Debugger is going to care about structs in elf.h, which are not
	identical narrow and wide at the present time.

		-Paul Bame
