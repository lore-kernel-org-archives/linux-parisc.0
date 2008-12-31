From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel modules (take 4)
Date: Wed, 31 Dec 2008 09:36:09 -0800
Message-ID: <ada63l0qmba.fsf@cisco.com>
References: <4959346E.7060600@gmx.de>
	<200812310915.41693.rusty@rustcorp.com.au> <495B5806.3080505@gmx.de>
	<alpine.LFD.2.00.0812310926450.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0812310926450.5086@localhost.localdomain> (Linus
	Torvalds's message of "Wed, 31 Dec 2008 09:29:36 -0800 (PST)")
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

 > Some gcc versions will inline weak functions if they are in scope - even 
 > if there is a non-weak function somewhere else. So you MUST NOT have the 
 > weak definition in the same file (or indirectly called through some inline 
 > functions in a header file) as the call. Because if you do, then any user 
 > with the wrong version of gcc will get the weak function semantics, even 
 > if it was meant to be overridden by something else.

Does this mean lib/swiotlb.c is broken now?  It has eg:

	void * __weak swiotlb_alloc_boot(size_t size, unsigned long nslabs)

and then

	void __init
	swiotlb_init_with_default_size(size_t default_size)
	{
...
		io_tlb_start = swiotlb_alloc_boot(bytes, io_tlb_nslabs);

later on in the same file.

(I just notice this because I saw the warning about swiotlb_alloc_boot()
not being __init but calling __alloc_bootmem_low and so I looked at the
code yesterday)

 - R.
