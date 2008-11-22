From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] parisc: fix kernel crash when unwinding a userspace
	process (v2)
Date: Fri, 21 Nov 2008 22:53:01 -0700
Message-ID: <20081122055301.GA12724@colo.lackof.org>
References: <200811202258.56561.deller@gmx.de> <200811211516.50750.deller@gmx.de> <20081121111705.dc03a465.akpm@linux-foundation.org> <49272F66.1010702@gmx.de> <20081121142013.f8d59b3f.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	kyle@hera.kernel.org, randolph@tausq.org, stable@kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081121142013.f8d59b3f.akpm@linux-foundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Nov 21, 2008 at 02:20:13PM -0800, Andrew Morton wrote:
...
> > > Why has a fix for such a severe bug been floating around unmerged for
> > > such a long time?

Three people are listed for parisc-linux in MAINTAINERS.
My understanding was Kyle would integrate and push patches.
Willy and I would help by reviewing code, testing and misc crap.

I asked if I should ACK parisc specific patches and was told in general
I didn't need to. I will start sending "Reviewed By:" when I feel
I understand what a patch fixes and that it's correct (even if not perfect).

> > I've tried to push it upstream a few times...
> 
> OK, well I'll merge it next week unless someone stops me.

I won't stop you. :)
Based on this posting:
    http://marc.info/?l=linux-parisc&m=122726233324164&w=2

you can add:
   Review-by: Randolph Chung <randolph@tausq.org>

I trust Randolph - he used to have commit access to the parisc-linux.org
CVS tree when we still used one.

And Helge has been great about fixing stuff - much better than the three
listed maintainers lately.
Kyle, willy, any objection to adding Helge to the MAINTAINERS list
for PARISC port?
I'd rather allow Helge to make a few small mistakes occasionally rather
than watch his parisc specific patches fall on the floor.

thanks,
grant
