From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Tue, 5 May 2009 15:46:57 -0400 (EDT)
Message-ID: <20090505194658.07D074EDA@hiauly1.hia.nrc.ca>
References: <20090505191845.GD3094@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, matthew@wil.cx, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090505191845.GD3094@bombadil.infradead.org> from "Kyle McMartin" at May 5, 2009 03:18:45 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, May 05, 2009 at 03:09:50PM -0400, John David Anglin wrote:
> > Probably, the cast should be to int.  __canonicalize_funcptr_for_compare
> > isn't used in the 64-bit runtime.
> > 
> > Still, I'm not sure why this fixed the problem as
> > __canonicalize_funcptr_for_compare checks for -1.
> > 
> 
> If we cast both sides to int, then we don't generate a call there...

That will certainly fix the problem but I'd really like to know
why we get a segv.  I suspect we are not handling a deferred function
pointer correctly.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
