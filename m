From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: add ftrace (function and graph tracer) functionality
Date: Mon, 9 Feb 2009 21:48:21 -0500 (EST)
Message-ID: <20090210024822.61683505B@hiauly1.hia.nrc.ca>
References: <4990E566.3020500@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org, kyle@mcmartin.ca
To: randolph@tausq.org (Randolph Chung)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4990E566.3020500@tausq.org> from "Randolph Chung" at Feb 10, 2009 10:24:38 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The call to _mcount is done with a standard call pattern that will
generate a long call if necessary.  So, -ffunction-sections isn't
needed for profiling large objects.

There are two cases for the profile counters.  On linux,
NO_DEFERRED_PROFILE_COUNTERS is 1.  glibc allocates the profile counters.
On the other PA targets, the output of the profile counters is deferred
so that we don't have to do any section switching.

Dave

> My memory is fuzzy and I had to dig through the archives a bit, but I 
> seem to recall that it used to be that -pg will not work WITHOUT 
> -ffunction-sections on 32-bit, because the call to _mcount was done 
> using b,l. Dave and I fixed this in gcc in 2003 though.
> 
> I did find another thread about this here: 
> http://gcc.gnu.org/ml/gcc-help/2008-11/msg00128.html
> 
> The followup replies from Ian Taylor and Jeff Law concurs with what you 
> said below, but it looks like nothing has been done (yet?)
> 
> randolph
> 
> John David Anglin wrote:
> >> It will currently only work with 64bit kernels, because the gcc options -pg
> >> and -ffunction-sections can't be enabled at the same time and -ffunction-sections
> >> is still needed to be able to link 32bit kernels.
> >>     
> >
> > I have done some testing.  As far as I can tell, -pg works with
> > -ffunction-sections on hppa-unknown-linux-gnu and hppa64-hp-hpux11.
> > hppa2.0w-hp-hpux11 doesn't support -ffunction-sections.  So, I think
> > we should propose that the code that disables -ffunction-sections
> > with -pg be removed.
> >
> > Dave
> >   
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
