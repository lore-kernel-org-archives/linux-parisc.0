Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA11399
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Feb 2000 20:42:57 -0700
Sender: dhd@doppelbock.thepuffingroup.com
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Weekly News [2000/02/18]
References: <20000218212619.W9944@thepuffingroup.com>
From: David Huggins-Daines <dhuggins@linuxcare.com>
Date: 18 Feb 2000 21:43:37 -0500
In-Reply-To: willy@thepuffingroup.com's message of "Fri, 18 Feb 2000 21:26:19 -0500"
Message-ID: <ltaekxnc86.fsf@doppelbock.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

willy@thepuffingroup.com writes:

>  * The ELF toolchain has received some updates this week. Sammy
>    contributed initial support for Linux/PARISC ELF32. Matthew contributed
>    some build fixes for HP/UX and David H-D contributed Debian and Red
>    Hat build support for x86.

And Alpha - actually someone needs to build an i386 binary package for
Debian.  Note that the Debian build support is in CVS, so you can just
run 'debian/rules build && fakeroot debian/rules binary-arch' from
within a checked-out tree to get a binary package for your
architecture.

Sammy or some other toolchain hacker: can you look at the diff from
the SRPM?  I haven't checked it into CVS because it's a really bad
kludge, but it's needed to compile on Alpha.

As far as I can tell, BFD64 gets defined if either the target *or* the
host is 64-bit.  The assembler and linker code then expects that it is
being built for a 64-bit target, but the build system (rightly) obeys
the arch specification string and only builds elf32 targets in BFD.

-- 
David Huggins-Daines, Senior Linux Consultant, Linuxcare, Inc.
613.562.1239 tel
dhuggins@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
