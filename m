From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: gcj port to hppa...
Date: Sun, 8 Nov 2009 13:58:34 -0500 (EST)
Message-ID: <20091108185835.17A394FC6@hiauly1.hia.nrc.ca>
References: <119aab440911081045j32cf37base2aa9d08f713effc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	dave.anglin@nrc-cnrc.gc.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440911081045j32cf37base2aa9d08f713effc@mail.gmail.com> from "Carlos O'Donell" at Nov 8, 2009 01:45:10 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, Nov 8, 2009 at 1:40 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> >> The gcj port to hppa uses a locking implementation
> >> (libjava/sysdeps/pa/locks.h) which is not signal safe.
> >
> > Yes. =A0Is this the gcj problem that you were seeing with nptl?
> 
> No it is not, but I noticed this during my investigations. I might as
> well fix it while I'm poking about.

There's similar code in libstdc++.

> Oh, that's a perefect idea, I wasn't sure that libjava could make use
> of those atomic builtins.
> 
> Doesn't this restrict the gcc version you can use to rebuild libjava?
> Is that OK?

In my opinion, yes.

> >> Does locks.h also need to work for HPUX?
> >
> > Yes.
> 
> OK, how do I write conditional code for HPUX vs. Linux?

Check __linux and/or __hpux.  Look at the arm code.  It looks
like they have done this.  So, you should just be able to copy
what they have done.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
