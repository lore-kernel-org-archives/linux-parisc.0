From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel
 modules (take 4)
Date: Wed, 31 Dec 2008 09:47:19 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain>
References: <4959346E.7060600@gmx.de> <200812310915.41693.rusty@rustcorp.com.au> <495B5806.3080505@gmx.de> <alpine.LFD.2.00.0812310926450.5086@localhost.localdomain> <ada63l0qmba.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>,
	Ian Campbell <ian.campbell@citrix.com>,
	Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <ada63l0qmba.fsf@cisco.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Wed, 31 Dec 2008, Roland Dreier wrote:
> 
> Does this mean lib/swiotlb.c is broken now?

Yes it does.

> It has eg:
>
> 	void * __weak swiotlb_alloc_boot(size_t size, unsigned long nslabs)
> 
> and then
> 
> 	void __init
> 	swiotlb_init_with_default_size(size_t default_size)
> 	{
> ...
> 		io_tlb_start = swiotlb_alloc_boot(bytes, io_tlb_nslabs);
> 
> later on in the same file.

Good eyes. 

Ingo? This comes from commit b81ea27b2329bf44b30c427800954f845896d476, by 
Ian, through Jeremy.

> (I just notice this because I saw the warning about swiotlb_alloc_boot()
> not being __init but calling __alloc_bootmem_low and so I looked at the
> code yesterday)

Lucky us. What's nasty about this is that most developers probably have 
updated versions of gcc, and are then surprised when some odd user has 
insane behavior that doesn't match the source code - because the compiler 
did something unexpected.

I guess I could make a sparse rule for this, but nobody seems to run or 
care about sparse anyway. Sad.

		Linus
