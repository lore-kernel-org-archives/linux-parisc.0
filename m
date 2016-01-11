From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: strange commit in the parisc-hd tree
Date: Tue, 12 Jan 2016 09:32:57 +1100
Message-ID: <20160112093257.015545ec@canb.auug.org.au>
References: <20160111092822.4b4c0233@canb.auug.org.au>
	<569422C8.4000706@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <569422C8.4000706@gmx.de>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

On Mon, 11 Jan 2016 22:46:48 +0100 Helge Deller <deller@gmx.de> wrote:
>
> On 10.01.2016 23:28, Stephen Rothwell wrote:
> > I noticed the following commit in the parisc-hd tree today:
> > 
> >   43122681dd75 ("Fix __ARCH_SI_PREAMBLE_SIZE on parisc")
> > 
> > which among other things says:
> > 
> >   This patch is not planned to be committed as it currently is.  
> 
> Right, I split it up into two.

Good idea.

> > [...] Please remove it from linux-next inclusion until it is ready.  
> 
> Sure, I just removed it now.

Thanks.

> > Delibeately introducing a patch to linux-next that may well cause build breakage
> > in other architectures just before the merge window opens is a bit antisocial.  
> 
> That was in no way my intention.
> In contrary, I wanted to see if other platforms are affected by the same bug without knowing.
> Do you by any chance know if it broke some of the existing platforms?
> If yes, that would be valuable info...

No, because I took it out of linux-next yesterday.  It is more a timing
thing, if you had done that a few weeks ago, I would have just reported
any build errors and continued on, but just before the merge window
opens we don;t need the distraction.  Also, if you can create another
branch and give it to the zero day build farm, you should get better
feed back.

Also, linux-next is not supposed to contain patches without a
Signed-off-by ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
