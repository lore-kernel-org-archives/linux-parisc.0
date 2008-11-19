From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Wed, 19 Nov 2008 10:12:21 -0500 (EST)
Message-ID: <20081119151221.AE1294EAE@hiauly1.hia.nrc.ca>
References: <1227104423.10371.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: cavokz@gmail.com, deller@gmx.de, linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1227104423.10371.18.camel@localhost.localdomain> from "James Bottomley" at Nov 19, 2008 11:20:23 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > > I'd be really dubious about that.  Our pa8900 ... the most mm unstable
> > > system we have ... is running -rc5 just fine.  The only warning before
> > > boot is the usual SMP one.
> > 
> > my j5600 is also running fine
> > 
> > > Linux ion 2.6.28-rc5 #20 SMP Tue Nov 18 18:16:35 PST 2008 parisc64
> > 
> > parisc64 SMP? have you all the cpu online?
> 
> Yes, all four (two sockets, two cores).

I haven't tried 2.6.28-rc5 but I have tried Kyle's last parisc tree.
While it boots on SMP PA8800 (Mako), it can't do a full GCC build
without a SEGV or some kind of file system issue.  There's an
occasional unexpected SEGV with 2.6.22.19, but otherwise it is stable.
It can successfully build GCC at -j4 most of the time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
