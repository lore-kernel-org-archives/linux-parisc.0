Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA09021
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 15:48:53 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 12 Sep 2000 21:49:18 -0000
To: Cary Coutant <cary@cup.hp.com>
Cc: <parisc-linux@thepuffingroup.com>, Alan Modra <alan@linuxcare.com.au>
Subject: Re: [parisc-linux] userspace function pointers in the kernel
References: <200009122054.NAA05612@adlmail.cup.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 12 Sep 2000 17:22:42 -0400
In-Reply-To: Cary Coutant's message of "Tue, 12 Sep 2000 13:54:42 -0700"
Message-ID: <878zsxmhjx.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Cary Coutant <cary@cup.hp.com> writes:

> I wrote:
> >Yes this is yet another side effect of the broken PA-RISC run time
> >architecture.

Hm.  As it turns out it is not the kernel that changed but rather the
linker.  We had previously been generating dynamic procedure
descriptors for PLABEL32 relocations only in shared libraries, but
switched to generating PLT entries for all functions (even in non-PIC
objects, which is a bug) and then pointing the PLABEL32 relocations at
these slots.  Hence I'm forwarding this to Alan.

Of course we would have had the same problem if a shared library had
tried to pass the address of a global function to signal(2), so I
guess it's a good thing we caught it now :-)

> I'm deeply troubled to learn that Linux is using $$sh_func_adrs, as I 
> will readily agree with you that it's seriously broken.
>
> For Linux, I strongly recommend that the dynamic loader guarantee that 
> there is a 1-1 mapping between function and function pointer. If you do 
> this, you won't need this silly special case when comparing function 
> pointers.

I agree that this is a valid goal.  Unfortunately I believe we are
falling short of it at the moment and we'll have to make some fairly
large changes to the toolchain.  If you don't mind I've got a few
questions about how this is done:

It looks like the IA-64 runtime achieves this by generating official
procedure descriptors for every defined function in an object and
placing them in the .opd section, then using these descriptors
whenever the address of a function is taken.  Presumably external
functions are compared using their .IA_64.pltoff entries?  I'm not
clear on how that works and don't have an IA-64 handy to experiment.

I'm also confused about how this interacts with dynamic linking in
another case - from what I've seen the descriptors in .opd are never
relocated, so if a function ends up being bound to another dynamic
object (in the case of weak symbols in shared libraries this can
happen, and we've had to make some adjustments to our linker and
assembler to handle this case since GNU libc relies on this behaviour
in some fundamental ways), it would appear that the .opd entries
become bogus and the pltoff entry (or whatever) should be used
instead.  How does the IA-64 runtime handle this case?

Also I've noticed that GNU libc doesn't actually use the .opd or
.pltoff entries to resolve dynamic FPTR64 relocations but rather
builds FPTRs dynamically when it encounters them.  So the 1-1 mapping
isn't really upheld at all in some cases.

But then HP/UX probably does something else entirely :-)

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
