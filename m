From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't find a register in class 'R1_REGS' while reloading 'asm'
Date: Sun, 7 Nov 2010 13:48:46 -0500 (EST)
Message-ID: <20101107184847.51F9F4E1C@hiauly1.hia.nrc.ca>
References: <20101107175042.627060c2@zombie>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, dave.anglin@nrc-cnrc.gc.ca, cavokz@gmail.com,
	linux-parisc@vger.kernel.org
To: gmsoft@tuxicoman.be (Guy Martin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101107175042.627060c2@zombie> from "Guy Martin" at Nov 7, 2010 05:50:42 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Not really.  The register allocator is shooting itself in the foot.
4.5/4.6 may be better but I think the work around should be applied
to resolve the problem.

Dave

> Any update on this ?
> 
> I'm still running into the issue with gcc 4.4.4 and linux 2.6.37-rc1.
> 
> Regards,
>   Guy
> 
> On Sun, 7 Feb 2010 22:20:34 -0500 (EST)
> "John David Anglin" <dave@hiauly1.hia.nrc.ca> wrote:
> 
> > > On Mon, Dec 07, 2009 at 10:01:14PM -0500, John David Anglin wrote:
> > > > -	volatile unsigned int *a;
> > > > +	volatile register unsigned int *a asm ("r20") =
> > > > __ldcw_align(x); 
> > > 
> > > I'm reticent about moving the assignment around the mb(), should I
> > > edit this to return the assignment and apply, or apply as is?
> > 
> > I don't believe the __ldcw_align operation involves a memory read or
> > write.  It's just adjusting a pointer.  Thus moving it past the mb()
> > shouldn't matter.  That said, I been wrong before...
> > 
> > Dave
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
