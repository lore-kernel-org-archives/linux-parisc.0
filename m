Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9773048CA
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 11 Mar 2004 11:57:02 -0700 (MST)
Date: Thu, 11 Mar 2004 13:42:39 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
Message-ID: <20040311184239.GC24266@baldric.uwo.ca>
References: <20040309150318.GD22721@baldric.uwo.ca>
	<404EC1C600000B2D@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <404EC1C600000B2D@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 10, 2004 at 03:47:09PM +0100, Joel Soete wrote:
> The glibc cvs 2.3.3 cvs dated 20040308 + your patch compiles well (just this
> time I enable profiling) :).

Excellent.
 
> As I foreseen to use this disk to other test on the N4k, I grab the list
> of packages installed (dpkg --get-selection > /mnt/chroot/var/tmp/Selection.doc)
> and chroot to /mnt/chroot to install previously mentioned pkg list. All works
> fine (just 3 pkg failled to install because no /proc available in chroot).

Try binding your chroot if you want to expose your process list to the
chroot 'mount -o bind /proc /mnt/chroot/proc
 
> In the same time I drive a make -k check and just get additional Errors:
> [...]
> make[2]: *** [/Develop/parisc-linux/build/glibc/libio/tst-mmap-eofsync.out]
> Error 1
> make[2]: *** [/Develop/parisc-linux/build/glibc/libio/tst-mmap-fflushsync.out]
> Error 1

Your kernel is too old, jejb fixed these.

> make[1]: *** [libio/tests] Error 2
> make[2]: [/Develop/parisc-linux/build/glibc/posix/annexc.out] Error 1 (ignored)
> make[2]: *** [/Develop/parisc-linux/build/glibc/elf/multiload.o] Error 1
> make[2]: *** [/Develop/parisc-linux/build/glibc/elf/origtest.o] Error 1
> [...]

The 'annexc.out' is an expected failure. The other two failures are new
and unknown, they aren't segfaulting which is good (Error 1), they just
aren't completing for some reason. Most likely they are taking too long
and timeout before the 2 second maximum. If they *are* timing out, set
TIMEOUTFACTOR=10 or 100 in your environment, this scales the test
timeout.
 
> I have two hypothesis:
> a. it is the first time I added enable-profile;

No, profiling works.

> b. I forget to build first gcc(3.3) tool with your gcc patch (gcc/config/pa/fptr.c)

No, I fixed this in glibc such that gcc doesn't have to be recompiled.
If I hand't the userspace would have been *completely* broken, since
function pointer comparisons wouldn't have worked.
 
> Now, 2.6.4-rc3-pa0 is just available, I will so try first to build it in
> the chroot disk...

That should fix the mmap failures, please check to see if the other two
failures are timeout related.

c.
