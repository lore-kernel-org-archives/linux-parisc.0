Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA13045
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 22:11:49 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 13 Sep 2000 04:12:11 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA04733;
	Wed, 13 Sep 2000 15:06:16 +1100
Date: Wed, 13 Sep 2000 15:06:16 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: Cary Coutant <cary@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] userspace function pointers in the kernel
In-Reply-To: <87its1km3t.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0009131447590.613-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 12 Sep 2000, David Huggins-Daines wrote:

> Cary Coutant <cary@cup.hp.com> writes:
> 
> > One way of avoiding the dynamic allocation by the dynamic loader is for 
> > the linker to allocate OFDs statically for each exported function, and 
> > for each hidden or static function whose address is taken.
> 
> Hm.  I'm not nearly as familiar with the linker code as I am with the
> dynamic linker code, so I'm not sure what it does.  But, as noted
> above, GNU libc does dynamic allocation, so it's probably not relevant.

Well, I'm more familiar with the linker than the dynamic linker :)

The model I'm thinking of for elf32-hppa is along these lines:

o  The linker creates a plt entry for all plabel relocs.  plt entries for
   elf32-hppa are a function address, linkage table pointer pair, so
   there's no need for the dynamic linker to allocate fptrs.
o  A dynamic plabel reloc will have the function symbol, and an addend
   into the plt.  This is a rather unusual reloc because the function
   symbol value is ignored when calculating the final value.
o  The dynamic linker builds a list or hash table of function symbols
   versus plt offsets, and adjusts plabels so that only one plt entry is
   ever used per function.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
