From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Wed, 19 Nov 2008 23:20:23 +0900
Message-ID: <1227104423.10371.18.camel@localhost.localdomain>
References: <49231FD0.9040409@gmx.de>
	 <1227061902.10371.11.camel@localhost.localdomain>
	 <20081119091327.GB3270@tilt.dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Domenico Andreoli <cavokz@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081119091327.GB3270@tilt.dandreoli.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2008-11-19 at 10:13 +0100, Domenico Andreoli wrote:
> On Wed, Nov 19, 2008 at 11:31:42AM +0900, James Bottomley wrote:
> > On Tue, 2008-11-18 at 21:04 +0100, Helge Deller wrote:
> > > I've tried various -rc candidates in the last few weeks, and sadly the 
> > > parisc kernel is in pretty bad shape.
> > > 
> > > At the beginning I started to get problems only when I had USB 
> > > keyboard/mouse attached to the PA machine. This lead to bugzilla 
> > > http://bugzilla.kernel.org/show_bug.cgi?id=11913
> > > 
> > > Now, with -rc4 and -rc5 things got even worse.
> > > 
> > > Crashes happen often just directly at the beginning.
> > > I'm sure it's not USB related any more, and I assume we have some 
> > > strange mm-problem somewhere.
> > 
> > I'd be really dubious about that.  Our pa8900 ... the most mm unstable
> > system we have ... is running -rc5 just fine.  The only warning before
> > boot is the usual SMP one.
> 
> my j5600 is also running fine
> 
> > Linux ion 2.6.28-rc5 #20 SMP Tue Nov 18 18:16:35 PST 2008 parisc64
> 
> parisc64 SMP? have you all the cpu online?

Yes, all four (two sockets, two cores).

James


