From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPPA and Squeeze
Date: Sat, 20 Jun 2009 17:07:51 -0600
Message-ID: <20090620230751.GC853@lackof.org>
References: <20090620215719.GA853@lackof.org> <20090620222521.93CB44EF8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>, kurt@roeckx.be,
	luk@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620222521.93CB44EF8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 20, 2009 at 06:25:20PM -0400, John David Anglin wrote:
> > > I've never been able to file any (non-automated) bug report in
> > > 5 minutes.  And if you don't even have direct access to the
> > > hardware it takes longer.
> > 
> > I agree. I'm trying to build netgen here too and if the ICE is easy to
> > reproduce, can make that available to danglin and add to the bugreport.  
> 
> There's no problem reproducing the ICE.

Indeed...already failed for me.

> I've pretty much localized the problem.  It's a GCC middle-end bug.
> The problem is in passing a complex double from a thunk.  The hppa
> specification says that values larger than 64 bits are passed by
> reference in the 32-bit runtime.  However, the value is in a pair
> of registers and not copied to memory.  This doesn't happen in calls
> from normal functions because the value gets copied to a stack slot.

I'm slightly confused about "stack slot". Could the "pass by reference"
refer to the address in the stack?

Anyway, thanks for quickly tracking this down.

grant

> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
