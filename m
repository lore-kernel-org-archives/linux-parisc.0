From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Use unshadowed index register for flush
 instructions in flush_dcache_page_asm and flush_icache_page_asm
Date: Sun, 02 Jun 2013 09:43:41 -0700
Message-ID: <1370191421.1977.6.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP62E4CC425407D88FFC0DF3979C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP62E4CC425407D88FFC0DF3979C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2013-06-02 at 12:21 -0400, John David Anglin wrote:
> The comment at the start of pacache.S states that the base and index  
> registers used for
> fdc,fic, and pdc instructions should not use shadowed registers.   
> Although this is probably
> unnecessary for tmpalias flushes, there is also no reason not to  
> comply.  The same
> index register (%r23) is used as in other routines.

Please don't do this, it's a misinterpretation of the comment.

What the comment is trying to say is that we use unshadowed registers to
pass information to the tmpalias handler in our tlb insertion
interruption.  It's the do_alias macro in entry.S.  The only actual
unshadowed registers it uses are %r23 and %r26.  Apart from these having
to have specific values, the rest of the routine is free to use any
other registers (either shadowed or unshadowed) as it sees fit.

If the comment is unclear, perhaps it needs fixing?

James


