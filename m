Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA07211
	for <parisc-linux@puffin.external.hp.com>; Sun, 9 Apr 2000 10:19:54 -0600
To: Bdale Garbee <bdale@gag.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] building a glibc-based tool chain
References: <20000409072731.14C0C1E9D6@rover.gag.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 09 Apr 2000 12:17:13 -0400
Message-ID: <87em8fjlkm.fsf@tarwebok.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Bdale Garbee <bdale@gag.com> writes:

> In article <20000409060602.269491E9D6@rover.gag.com> you wrote:
> 
> > We have the crt[1in].o in /opt/palinux/lib, but not crtbegin*.  I'm off to
> > see if I can figure that out now.
> 
> So, crtbegin/crtend are related to constructors and destructors for C++.  I
> see where they get defined as part of extra_parts in the gcc build for various
> architectures, but I confess to not understanding how they are being included
> in my builds... 

They aren't always needed.  I suspect they may be related to whether
you compile code as position-independent or not, as the spec file on
i386 seems to indicate that they get linked in if you link with
-shared:

    16  *endfile:
    17  %{!shared:crtend.o%s} %{shared:crtendS.o%s} crtn.o%s

    28  *startfile:
    29  %{!shared:      %{pg:gcrt1.o%s} %{!pg:%{p:gcrt1.o%s}                   %
    29  {!p:%{profile:gcrt1.o%s}                         %{!profile:crt1.o%s}}}}
    29      crti.o%s %{!shared:crtbegin.o%s} %{shared:crtbeginS.o%s}

On Alpha (actually 64-bit RISC architectures in general, I think - for
rather intuitive reasons related to the size of instructions vs. the
size of pointers :) all code is position-independent, which is
probably why they're part of the standard runtime environment there.

So, this is probably another side effect of gcc and binutils assuming
that PA-RISC ELF targets are always 64-bit targets.  However I'm not
up on the details of Sammy's ELF32 ABI ...

Needless to say we won't be compiling any C++ programs for a little
while at least (can we remove dselect from the dpkg sources? please?
pretty please? :)  So, you could probably just edit them out of your
spec file manually for the time being.

-- 
David Huggins-Daines, Senior Linux Consultant, Linuxcare, Inc.
613.562.1239 desk, 613.223.0225 mobile
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
