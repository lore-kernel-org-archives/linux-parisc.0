Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA02332
	for <parisc-linux@puffin.external.hp.com>; Sun, 9 Apr 2000 01:27:35 -0600
From: Bdale Garbee <bdale@gag.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] building a glibc-based tool chain
In-Reply-To: <20000409060602.269491E9D6@rover.gag.com>
Message-Id: <20000409072731.14C0C1E9D6@rover.gag.com>
Date: Sun,  9 Apr 2000 01:27:31 -0600 (MDT)
List-ID: <linux-parisc.vger.kernel.org>

In article <20000409060602.269491E9D6@rover.gag.com> you wrote:

> We have the crt[1in].o in /opt/palinux/lib, but not crtbegin*.  I'm off to
> see if I can figure that out now.

So, crtbegin/crtend are related to constructors and destructors for C++.  I
see where they get defined as part of extra_parts in the gcc build for various
architectures, but I confess to not understanding how they are being included
in my builds... 

If I run the compiler with -nostdlib and explicitly specify things, ld seg
faults.  See below.

With my extra options to the gcc builds cleaning up some of the manual goo
Paul was doing, and putting limits.h in place making the gcc build finish
cleanly, I feel like I've made some progress.  However, since I don't have any
idea why ld is seg faulting and have heard this isn't the first time that's
been tripped over, and since I don't see offhand how to get gcc to leave
out crtbegin any other way right now, I think I'm stuck.

Hmmm.  The "cannot size stub section" might correlate with Paul's ugly hack
making stub files?  Is this just garbage in -> garbage out?  Hmmm.

Bdale


bdale@chunks:~/puffin/user-space-test-code: hppa1.1-linux-gcc -nostdlib -o bdale /opt/palinux/lib/crt1.o bdale.c -lc -lgcc
collect2: ld terminated with signal 11 [Segmentation fault]
/opt/palinux/bin/../lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/../../../../hppa1.1-linux/bin/ld: can not size stub section: Bad value
bdale@chunks:~/puffin/user-space-test-code: 
