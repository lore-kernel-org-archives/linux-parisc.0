Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951C3FB.dip.t-dialin.net [217.81.195.251])
	by dsl2.external.hp.com (Postfix) with ESMTP id 052DC4856
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Mar 2002 03:06:21 -0700 (MST)
Date: Thu, 7 Mar 2002 11:03:39 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FB on c3k
Message-ID: <20020307110339.A1590@solo.franken.de>
References: <20020306080101.B6A874859@dsl2.external.hp.com> <20020307002239.A9224@solo.franken.de> <tsbogend@alpha.franken.de> <20020307073117.4C572482F@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020307073117.4C572482F@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Thu, Mar 07, 2002 at 12:31:16AM -0700
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

On Thu, Mar 07, 2002 at 12:31:16AM -0700, Grant Grundler wrote:
> Thomas Bogendoerfer wrote:
> > No jsm is right, the U bit doesn't matter, if we set the right
> > physical address in the TLB. I really don't understand why it's
> > needed to supply more than 40bit,
> 
> B2600 has PA-8600. Maybe PA-8600 needs 44 bits of physical address?
> PA-8000 only needed 40-bits, iirc.
> I thought N-class (PA-8500) used 44-bits.

after sleeping over the problem, I believe we were short just one bit. We
extracted 32 bits from the PTE. The lower 5 bits are zeroed and will
be the 4 size bits and the one 0 bit in the TLB. That leaves 27 bits for
the physical page number. Adding the 12 offset bits for 4k pages gives us
just 39 bits, but we need 40. So instead of the change 32 -> 52 a
change from 32 -> 33 should do the same. On the other side using all
bits shouldn't matter and we are prepared for 44 bit and more. BTW.
isn't our current PDC space expansion wrong for "odd" sized address
spaces ? It should work for 48 and 56, but not for anything else.
Or do I miss something ?

I'm packing for Cebit at the moment, and will be away for 2 weeks. So
I can't check my theory in the next days. I will have a J6700 at Cebit
to play with, but I don't think I'll get spare time in the next couple
of days.

> I tried it with 32-bit kernel on c3k.  That hpmc'd.
> (Vis-EG, 1600x1200 8bit).
> Are you using 64-bit kernel?

yes,  with your last ioctl32 changes. I need to recheck my first entry.S
hack for the narrow mode pa2.0 tlb handler. I think my assembler code
just sucks and setting up the tlbs the same way as for wide mode,
should get us X with 32-bit kernels, too.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
