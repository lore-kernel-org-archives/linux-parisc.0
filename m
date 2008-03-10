From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Yet another ccio fix idea?
Date: Mon, 10 Mar 2008 16:37:12 -0400 (EDT)
Message-ID: <20080310203713.3A93D4E4A@hiauly1.hia.nrc.ca>
References: <1205179187.2941.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: soete.joel@scarlet.be, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, kyle@parisc-linux.org, matthew@wil.cx
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1205179187.2941.23.camel@localhost.localdomain> from "James Bottomley" at Mar 10, 2008 02:59:47 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[7]))
> 
> Flushing pdir_ptr may or may not work depending on the cache line width
> (pdr_ptr[7] is 28 bytes away, so if the line size is 16 it will fail;
> although I think almost every machine with a ccio has a 32 byte or
> higher cache line width).

Actually, pdr_ptr is a char *, so this is 7 bytes away.  However,
I think you are correct in saying that pdr_ptr[7] needs to be flushed.

The same issue would appear to apply to the other flush in the file.

The cache line alignment of pdir's isn't immediately apparent to
me.  If the pdir was defined as a two word array, it might span
two lines.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
