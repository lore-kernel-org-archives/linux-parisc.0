Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA22111
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 20:39:58 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 21 Nov 2000 03:40:10 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA23321;
	Tue, 21 Nov 2000 14:22:53 +1100
Date: Tue, 21 Nov 2000 14:22:53 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: Paul Bame <bame@fc.hp.com>, mkp@mkp.net, parisc-linux@thepuffingroup.com
Subject: Re: A DT_INIT/DT_FINI glibc patch. 
In-Reply-To: <200011210207.SAA19600@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0011211314450.15623-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 20 Nov 2000, Grant Grundler wrote:

> I'm afraid we will break binary compatibility for elf32 hppa-linux again.
> I only raise this in case there is really a "right" way to fix the
> DT_INIT/DT_FINI problem.

The fix involves pruning out all the special handling in bfd/elf32-hppa.c
for DT_INIT,DT_FINI, and making some small changes to glibc.  H.J. Lu has
already made the necessary framework changes, and all we need to do is
something like

#define DL_FUNCTION_ADDRESS(map, addr) _dl_start_address (map, addr)
#define DL_DT_INIT_ADDRESS(map, addr) \
  ((addr) & 2 ? (addr) : DL_FUNCTION_ADDRESS (map, addr))

with similar defines for DT_FINI.  The test for (addr) & 2 is the
fairly innocuous fudge to support old binaries.


Another glibc issue (which is why I'm sending this back to the list) is
that there has been quite some discussion on the binutils list over the
use of the EI_OSABI field.  The conclusion being that it isn't really
correct to use this field to discern the intendend execution platform.
It's purpose is really to tell ELF tools that a file contains fields and
values that need to be interpreted in a non-standard way.  Since both
elf32-hppa and elf64-hppa follow the standards, I'm inclined to think that
the gnu tools should set EI_OSABI to zero for both HPUX and Linux targets.

Instead the .note.ABI-tag section should be examined to determine the
target, which sadly isn't set correctly at the moment.  :-(

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
