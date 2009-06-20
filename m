From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sat, 20 Jun 2009 18:25:20 -0400 (EDT)
Message-ID: <20090620222521.93CB44EF8@hiauly1.hia.nrc.ca>
References: <20090620215719.GA853@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kurt@roeckx.be, luk@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620215719.GA853@lackof.org> from "Grant Grundler" at Jun 20, 2009 03:57:19 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > I've never been able to file any (non-automated) bug report in
> > 5 minutes.  And if you don't even have direct access to the
> > hardware it takes longer.
> 
> I agree. I'm trying to build netgen here too and if the ICE is easy to
> reproduce, can make that available to danglin and add to the bugreport.  

There's no problem reproducing the ICE.

I've pretty much localized the problem.  It's a GCC middle-end bug.
The problem is in passing a complex double from a thunk.  The hppa
specification says that values larger than 64 bits are passed by
reference in the 32-bit runtime.  However, the value is in a pair
of registers and not copied to memory.  This doesn't happen in calls
from normal functions because the value gets copied to a stack slot.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
