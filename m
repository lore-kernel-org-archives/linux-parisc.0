From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sat, 20 Jun 2009 19:25:45 -0400 (EDT)
Message-ID: <20090620232546.162BC4EF8@hiauly1.hia.nrc.ca>
References: <20090620230751.GC853@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, kurt@roeckx.be, luk@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620230751.GC853@lackof.org> from "Grant Grundler" at Jun 20, 2009 05:07:51 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > I've pretty much localized the problem.  It's a GCC middle-end bug.
> > The problem is in passing a complex double from a thunk.  The hppa
> > specification says that values larger than 64 bits are passed by
> > reference in the 32-bit runtime.  However, the value is in a pair
> > of registers and not copied to memory.  This doesn't happen in calls
> > from normal functions because the value gets copied to a stack slot.
> 
> I'm slightly confused about "stack slot". Could the "pass by reference"
> refer to the address in the stack?

The reference can refer to a location on the stack (region allocated
for locals).  However, values larger than 64 bits can't be passed in the
argument slots.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
