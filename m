Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA30586
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 10:00:04 -0700
To: Matthew Wilcox <matthew@wil.cx>
cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] kernel merge 
In-Reply-To: Your message of "Tue, 14 Nov 2000 10:29:36 GMT."
             <20001114102936.A2062@parcelfarce.linux.theplanet.co.uk>
References: <E13twjn-0004fw-00@noam.fc.hp.com> <m13uLiv-001Vp3C@chalet>  <20001114102936.A2062@parcelfarce.linux.theplanet.co.uk> 
Date: Tue, 14 Nov 2000 10:02:06 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13vjTC-000381-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= On Fri, Nov 10, 2000 at 02:28:33PM -0700, bame@riverrock.org wrote:
= > fcntl.h acquired a 'struct fcntl64' used with 64-bit offsets, implementing
= > fcntl(fd, F_S/GETLK[W]64, ...).  Several other locking-related #defines add
ed.
= > 
= > We'll need to add the getdents64() and fcntl64() syscall glue. (TODO!!!)
= 
= actually, we don't.  Linux/PA-RISC has sufficiently wide data types
= already so we don't have the grot required in other ports to support
= the appropriate wide data types.

Ok that sounds great but I need a clue how to see it.  struct flock
contains an off_t which is 32 bits on narrow (wide too at the moment,
but that will probably change).  Also, struct dirent contains
a 32-bit inode and a __kernel_off_t offset (d_off), which is also
32 bits narrow.  I did see the ... in our fcntl() syscall definition
so I'll go check glibc to see what's happening there.

I wouldn't be so picky except that I need to write
the 32/64 syscall translators for these soon!  Thanks!

	-P
