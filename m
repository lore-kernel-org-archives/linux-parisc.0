From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Mon, 22 Dec 2008 21:31:10 -0500 (EST)
Message-ID: <20081223023111.7D9D24EE8@hiauly1.hia.nrc.ca>
References: <1229985816.3345.43.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kyle@infradead.org, linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1229985816.3345.43.camel@localhost.localdomain> from "James Bottomley" at Dec 22, 2008 04:43:36 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Actually, it should bug more often.  This function:
> flush_user_cache_page_non_current() is very rarely called (which is
> hopefully why you don't see an increase in bugs).  However, this is a
> kernel function ... if you call load_context() here, you'll get the user
> protection IDs in the register and it will immediately fault when it
> returns to the kernel.  All it should be doing (which is what it
> currently does) is to set up sr3 to allow the kernel to poke into a user
> address space, which is the design of the function.

As things stand, the call is fully inlined.  Nothing can be poked into
the user address space without the protection ID register being correctly
set.  The cache flushes can trigger a non-access tlb miss fault.  At
the moment, I can't see how this function could cause a protection ID fault.
However, it still seems good practice to set cr8 consistently when the
user context is changed.

The kernel uses space register values of zero, so it shouldn't fault
because of the change to sr3 and cr8 for non current.  The values are
restored before flush_user_cache_page_non_current() exits.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
