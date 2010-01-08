From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: futex wait failure
Date: Fri, 8 Jan 2010 17:33:36 -0500
Message-ID: <20100108223336.GI19179@bombadil.infradead.org>
References: <20100108215625.GH19179@bombadil.infradead.org> <20100108222858.D6CBA5160@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, carlos@systemhalted.org,
	deller@gmx.de, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100108222858.D6CBA5160@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 08, 2010 at 05:28:58PM -0500, John David Anglin wrote:
> > On Fri, Jan 08, 2010 at 04:44:51PM -0500, Carlos O'Donell wrote:
> > > >
> > > > However, I think Dave is on to something with the
> > > 
> > > ...kernel issue.
> > > 
> > > We might have *several* outstanding bugs :-)
> > > 
> > 
> > Hrm. We discussed this on IRC a while ago, I can't remember what we
> > decided was the best approach... there's probably many many dragons
> > here.
> > 
> > I wonder what would break if we set any EAGAIN returns to EWOULDBLOCK in
> > the exit path.
> 
> That seems reversed.  x86_64 translates the system's EWOULDBLOCK error
> into EAGAIN in sysdeps/unix/x86_64/sysdep.S.  However, don't know if this
> impacts the futex and sem_wait checks.

Yeah, you're right.

regards, Kyle
