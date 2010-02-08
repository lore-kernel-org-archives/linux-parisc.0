From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't find a register in class 'R1_REGS' while reloading 'asm'
Date: Sun, 7 Feb 2010 22:20:34 -0500 (EST)
Message-ID: <20100208032035.645A14EF1@hiauly1.hia.nrc.ca>
References: <20100207002335.GP24051@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, cavokz@gmail.com,
	linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100207002335.GP24051@bombadil.infradead.org> from "Kyle McMartin" at Feb 6, 2010 07:23:35 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Mon, Dec 07, 2009 at 10:01:14PM -0500, John David Anglin wrote:
> > -	volatile unsigned int *a;
> > +	volatile register unsigned int *a asm ("r20") = __ldcw_align(x);
> >  
> 
> I'm reticent about moving the assignment around the mb(), should I edit
> this to return the assignment and apply, or apply as is?

I don't believe the __ldcw_align operation involves a memory read or
write.  It's just adjusting a pointer.  Thus moving it past the mb()
shouldn't matter.  That said, I been wrong before...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
