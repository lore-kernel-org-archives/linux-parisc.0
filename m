From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Wierd code in Entry.S
Date: Fri, 10 Jul 2009 09:36:20 -0600
Message-ID: <20090710153620.GB28778@lackof.org>
References: <20090709225511.GE10979@lackof.org> <20090710001506.A2C43507E@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090710001506.A2C43507E@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 09, 2009 at 08:15:04PM -0400, John David Anglin wrote:
...
> > > The DEPI instruction on a 64-bit machine sets bit 44=32+12,
> > > whereas we use the value as the argument to IDTLBT, which expects bit 12  
> > > to be used instead.
> > >
> > > Does it mean that the U-bit is never set and the  
> > > authorization id gets corrupted???
> > 
> > U-bit will get set only if _PAGE_NO_CACHE_BIT+32 is also set.
...
> To me, it looks like the instruction should be a depdi.  See the preceding
> deposit of PAGE_USER.  According to the IDTLBT description, the U bit is
> bit 12 in r2, not bit 44.

Yes - I see it now too. Excellent catch.

But I'm still wondering what the effect of this bug will be.
The first order (not setting U-bit) should only affect ZX1 (pa8800/pa8900)
machines. Those have uncacheable IO space between 2GB-4GB physical address.
My guess is the machines should HPMC since the CPU would attempt to access
those ranges as a cacheline read/write instead of sub-cacheline transactions.

It's not clear from the arch manual what happens if bit 44 is set in R2.
I didn't look far enough to see where the auth ID gets corrupted.

thanks,
grant

> 
> rp3440 boots with the depdi change.  Building gcc...
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
