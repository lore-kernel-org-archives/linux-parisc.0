Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA26374
	for <parisc-linux@puffin.external.hp.com>; Mon, 25 Sep 2000 22:32:17 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Sep 2000 04:32:56 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA18231;
	Tue, 26 Sep 2000 15:32:43 +1100
Date: Tue, 26 Sep 2000 15:32:43 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: Lazy linking issues
In-Reply-To: <87k8c0kmvp.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0009261356570.10967-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 25 Sep 2000, David Huggins-Daines wrote:

> This means that my old idea of storing the index of the IPLT
> relocation in each PLT slot in elf_machine_runtime_setup() was
> essentially correct, but then we have the problem of how to get at the
> reserved area of the GOT.  There is basically no way to do this that I
> can think of without adding another word to the PLT slot (which might
> not be a bad idea, actually).

The easiest thing would be to make PLTGOT always point to the start of
.got, which is what most other architectures do.  Having PLTGOT (and
hence the linkage table pointer) point elsewhere is just an optimisation
of dubious value.  At the moment we don't try to remove the addil's from
import stubs anyway, and in any case, positioning the LTP at the start of
the .got (which is also the end of the .plt) is a fairly good choice for
addressing both .plt and .got with 14-bit offsets.

Is this enough for lazy linking?  No, because each jump through a plt
entry needs to pass it's .got (struct link_map really) as well as pltrel
offset to the fixup routine.  I think the dynamic linker needs some help
from the linker.  Again stealing ideas from other architectures, let's
modify the linker to set up the .plt function pointers to point back to
the start of the plt.  We'll reserve some space at the start of the plt
for code to load any necessary pointers into registers.
elf_machine_runtime_setup will need to relocate the .plt function
pointers, and also the code at the start of the plt unless I can make it
PIC.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
