Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A0174866
	for <parisc-linux@parisc-linux.org>; Fri, 19 Sep 2003 10:02:46 -0600 (MDT)
Date: Fri, 19 Sep 2003 12:00:35 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <joel.soete@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] sched_clock implementation
Message-ID: <20030919160035.GG18225@systemhalted>
References: <20030918203510.GD21596@parcelfarce.linux.theplanet.co.uk> <3F6B2199.8050402@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F6B2199.8050402@tiscali.be>
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

On Fri, Sep 19, 2003 at 03:32:41PM +0000, Joel Soete wrote:
> Matthew Wilcox wrote:
> 
> >Anyone want to do better than the lame implementation?  ;-)
> >
> >----- Forwarded message from Andrew Morton <akpm@osdl.org> -----
> >
> >I'll be merging Ingo & Con's CPOU scheduler changes into Linus's tree soon.
> >
> >It does require that the architecture provides a new timing function:
> >
> >A lame implementation is:
> >
> >/*
> >* Returns nanoseconds
> >*/
> > 
> >
> Hi Willy,
> 
> (Certainly yet another stupid question but) to reach such accuracy we 
> would need to have access to some 'time device' with an accuracy better 
> then the nanosec (iirc 10^-9) (because it doesn't seems to me possible 
> to get enough accuracy with cpu clock < 10^9 ie 1Ghz: the most case for 
> parisc systems). Does it exist such device and where to start to read 
> some doc?

We could use cr16 to get better accuracy. See list discussions about
fast gettimeofday.

c.
