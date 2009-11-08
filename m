From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: gcj port to hppa...
Date: Sun, 8 Nov 2009 14:20:12 -0500 (EST)
Message-ID: <20091108192013.B2E2A4E38@hiauly1.hia.nrc.ca>
References: <119aab440911081059q435ca194va5f4df4e56c2033d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	dave.anglin@nrc-cnrc.gc.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440911081059q435ca194va5f4df4e56c2033d@mail.gmail.com> from "Carlos O'Donell" at Nov 8, 2009 01:59:47 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > There's similar code in libstdc++.
> 
> Where? I'll fix that case too.

config/cpu/hppa/atomicity.h.  On linux, we probably want to use
config/cpu/generic/atomicity_builtins/atomicity.h.  However, I'm
not sure the current configure checks work correctly for library
implementations.

On hpux, we probably should switch to using
config/cpu/generic/atomicity_mutex/atomicity.h and get rid of the hppa
specific implementation.  Originally, there wasn't any locking in the
generic code.

> BTW, the gcj problem looks like a missing _STACK_GROWS_UP case in boehm-gc.
> 
> >> Oh, that's a perefect idea, I wasn't sure that libjava could make use
> >> of those atomic builtins.
> >>
> >> Doesn't this restrict the gcc version you can use to rebuild libjava?
> >> Is that OK?
> >
> > In my opinion, yes.
> 
> Is that OK?

I can approve any change that is hppa specific.  There's also a precedent
in the arm implementation.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
