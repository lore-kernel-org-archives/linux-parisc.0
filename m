Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id PAA27061
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 15:13:11 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id MAA24376
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 12:12:35 -0800 (PST)
Received: from netscape.com ([205.217.243.139]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F962T600.JEP for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar
          1999 12:12:42 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36FA98B2.3B82B92A@netscape.com>
Date: Thu, 25 Mar 1999 15:12:34 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] syscall work
References: <199903251919.LAA01701@cllmail.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Cary Coutant wrote:
> I'd suggest *not* using the same gateway page address as HP-UX. If you
> do, you won't be able to develop a later kernel extension to support
> HP-UX binaries, unless you allocate syscall numbers carefully.

Well, my plan was to do what the MIPS guys have done (and others, like
maybe SPARC?): 
syscall numbers 0 to 200-something are __NR_HP_syscall, and then the
Linux ones start at 1000.  HP-UX binary emulation is something that I
really really want early on, because it will give us a functioning
userland while we're trying to get compiler and linker and glibc ports
complete and working.

But maybe you're right -- maybe we use one gateway page address for
HP-UX compat, and another for native-Linux syscalls.  We have a lot more
flexibility in our system call mechanism than the other platforms did, I
think, so perhaps there's a better way.

It'd be nice to have hpux.o as a module for binary compatibility, when
we get there, but that's probably not so hard.  Ponder...

The checked-in unistd.h has appropriate syscall numbering to support the
current plan, if you'd like to peek.

Mike

-- 
78101.27 70129.77
