Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6204D4842
	for <parisc-linux@parisc-linux.org>; Fri, 28 Feb 2003 10:40:44 -0700 (MST)
Message-Id: <200302281740.h1SHegff003314@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: jsoe0708@tiscali.be (Joel Soete)
Date: Fri, 28 Feb 2003 12:40:41 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
In-Reply-To: <3E5A232800001242@ocpmta8.freegates.net> from "Joel Soete" at Feb 28, 2003 02:56:55 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Sorry Dave I do not find this stuff.

The place to look is

linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/initspin.h.

It is rather buried.  Carlos and I have had some rather lengthy
discussions on how to implement pthread locking in glibc given
the limitations in aligning data on the stack and also for data
allocated by malloc.  This might be relevant to the kernel
locking code.

>  #define rwlock_init(lp)	do { *(lp) = RW_LOCK_UNLOCKED; } while (0)

The above macro uses a compound literal.  This creates a unique object
in the scope in which the macro is used.  As this is a BLKmode object,
the alignment of the object is set to GCC's definition for BIGGEST_ALIGNMENT.
The overall alignment also won't be better than STACK_BOUNDARY.  It
is possible to use a "static" macro argument in which case space for the
object will be allocated in the .bss section rather than on the stack.
This also allows the alignment attribute to work.  If you do this, then
you have to worry about whether the code needs to be reentrant.

On the hppa64 port (3.3 & later), BIGGEST_ALIGNMENT, STACK_BOUNDARY
and PREFERRED_STACK_BOUNDARY are now all 128 bits.  Prior to 3.3,
PREFERRED_STACK_BOUNDARY is 1024 bits but this is wrong.  The runtime
documentation specifies 128 bits (16 bytes) for the stack alignment
on the 64-bit port.  Using a larger boundary just wastes space.
Stack alignment is also determined by what you start with.

Also note, any attempt to provide an overall alignment for the compound
literal on the stack is ignored.  However, as all 64-bit machines are
PA 2.0, this doesn't matter.  On the otherhand, the alignment does
matter for the 32-bit port on PA 1.1 machines.  There the ldcw insn
has to operate on 16-byte aligned data.  GCC from the master source
has BIGGEST_ALIGNMENT set to 64-bits on the 32-bit port.  So, the
above macro won't create a properly aligned lock.  Debian 3.0.4 has
BIGGEST_ALIGNMENT set to 128, so it should be used for PA 1.1 kernel
builds until this issue is resolved.

> Any better idea?

Not really.  I might use a name like SPIN_LOCK_UNLOCKED_INIT rather than
C_SPIN_LOCK_UNLOCKED, as I think it is slightly more descriptive.

Hope this helps,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
