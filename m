Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FB on c3k 
In-Reply-To: Message from Thomas Bogendoerfer <tsbogend@alpha.franken.de>
   of "Thu, 07 Mar 2002 11:03:39 +0100." <20020307110339.A1590@solo.franken.de>
References: <20020306080101.B6A874859@dsl2.external.hp.com> <20020307002239.A9224@solo.franken.de> <tsbogend@alpha.franken.de> <20020307073117.4C572482F@dsl2.external.hp.com>  <20020307110339.A1590@solo.franken.de> 
Date: Sat, 09 Mar 2002 23:56:41 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020310065641.D8D3A48EB@dsl2.external.hp.com>
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

Thomas Bogendoerfer wrote:
> after sleeping over the problem, I believe we were short just one bit.
> We extracted 32 bits from the PTE. The lower 5 bits are zeroed and will
> be the 4 size bits and the one 0 bit in the TLB. That leaves 27 bits for
> the physical page number. Adding the 12 offset bits for 4k pages gives us
> just 39 bits, but we need 40. So instead of the change 32 -> 52 a
> change from 32 -> 33 should do the same. On the other side using all
> bits shouldn't matter and we are prepared for 44 bit and more.

ok. that all make sense now.
It made more sense when I read about extru and idtlbt in the 
PA 2.0 Arch book.

> BTW.
> isn't our current PDC space expansion wrong for "odd" sized address
> spaces ? It should work for 48 and 56, but not for anything else.
> Or do I miss something ?

I have no clue. jsm or willy know?

> I will have a J6700 at Cebit to play with, but I don't think I'll
> get spare time in the next couple of days.

Done! See ftp://ftp.p-l.o/patches/entry.S-diff

The 32-bit kernel with FB is working with 4 instances of the following
change to entry.S (all immediately preceed an idtlbt instruction):
-       extrd,u         pte,56,25,pte
+       extrd,s         pte,56,25,pte   /* bit 31:8 >> 8  */
+       depdi           0,3,4,pte       /* page_size = 4k (in case signed) */

CAVEAT: This is better than the brokeness we had before.
But it doesn't properly handle 0xf0xxxxxx addresses.
Those need to be "f-extended" with 0xf0f0f0... instead of all 1's.

> yes,  with your last ioctl32 changes. I need to recheck my first entry.S
> hack for the narrow mode pa2.0 tlb handler. I think my assembler code
> just sucks and setting up the tlbs the same way as for wide mode,
> should get us X with 32-bit kernels, too.

Done. patch on ftp.p-l.o/patches/entry.S-diff.
Can someone with VM cluefulness review this for me?

It seems to be working on my c3k with Vis-EG/PCI now though...wohoo! :^)

thanks,
grant
