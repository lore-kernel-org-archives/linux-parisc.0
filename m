Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA28662
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 10:06:23 -0700
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id KAA14370
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 10:08:22 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=noam.fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13w62o-0006Pv-00
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 10:08:22 -0700
To: parisc-linux@puffin.external.hp.com
Date: Wed, 15 Nov 2000 10:08:22 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13w62o-0006Pv-00@noam.fc.hp.com>
Subject: [parisc-linux] Help with posix_types.h
List-ID: <linux-parisc.vger.kernel.org>


I'm reviewing the posix_types.h to figure out what's right for 64-bit
linux.  I know others may have thought through this before so I'm hoping
for guidance.  For those unfamiliar, the type names in posix_types.h
are like __kernel_dev_t and usually are used to define the corresponding
"normal" type (dev_t).  These should be settled before the 32/64
syscall wrappers can be completed.

__kernel_ino_t: often 32 bits, currently 32 bits for parisc and som3
	64-bit kernels (mips64 and ia64).  64 bits on alpha and sparc64.

	Seems to me this ought to be 32 bits on parisc and parisc64, or
	64 bits on both, since it's a function of file system sizes not
	processor width.  HPUX kernel seems to always use 32 bits, but
	64-bit userspace uses 64 bits.  I propose 32 bits on both, but
	willy had selected 64 bits in parisc64 for some reason.

__kernel_off_t: seems to be 32 bits on 32-bit cpus, 64 on 64-bit ones.
	This is supposedly the offset from a beginning of a file.
	HPUX appears to use 64-bits *in the kernel* for both 32 and
	64-bit kernels.

	The obvious pattern is to make ours 32 on narrow, and 64 on
	wide palinux so I guess I propose that, and that's the way
	it was before I hacked on it too.
	Should we consider switching to 64 bits on narrow
	palinux since this is related to file systems, not CPUs.

	Note there's also a __kernel_loff_t -> loff_t which appears
	to be defined as 64 bits.  I'm not sure how this does/should
	interact with off_t (lseek vs lseek64 for example).

__kernel_suseconds_t: which becomes suseconds_t which is used in
	struct timeval {
		time_t          tv_sec;         /* seconds */
		suseconds_t     tv_usec;        /* microseconds */
	};

	I'm confused why hpux, and other systems,
	like for this to be 'long' (e.g., 64 bits on 64-bit processors)
	since it seems like values over a million are probably rare
	and 32 bits seems to be enough for most implementations.  sparc64
	chose 32 bits for this and I want to do the same for parisc64
	because it will reduce the amount of syscall structure repackings.
	Comments?

__kernel_daddr_t: which is used indirectly in struct solaris_x86_vtoc and
	solaris_x86_slice which *might* be an on-disk data structures
	(used with CONFIG_SOLARIS_X86_PARTITION).  So this needs to
	be 32 bits if that's the case (definition from sparc) and several
	archs have it 64 bits!

	On the other hand, HPUX's man page says 'daddr_t used for disk
	addresses except in an inode [and partition table I would think]
	on disk'.  So it should probably be the same
	type as off_t.  FYI the only other place it's used is in
	'struct mtio' -- used to talk to magnetic tape units.

	I'm guessing the sparc struct should not be using this type,
	and that we should define it the same as off_t.  Comments?
