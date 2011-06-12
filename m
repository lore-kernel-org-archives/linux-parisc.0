From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: eglibc_2.13-5 on hppa
Date: Sun, 12 Jun 2011 16:38:34 -0400 (EDT)
Message-ID: <20110612203835.A675F5372@hiauly1.hia.nrc.ca>
References: <BANLkTi=ntF31tACKcowCtLDL728N3hNcvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=ntF31tACKcowCtLDL728N3hNcvA@mail.gmail.com> from "Carlos O'Donell" at Jun 12, 2011 03:57:06 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, Jun 12, 2011 at 2:47 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> > There seems to be a problem with this futex call:
> > futex(0xfdffb2c8, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 1, NULL, 0) =
> > -1 EINVAL (Invalid argument)
> >
> > and the clock_gettime return seems wierd.
> 
> Thanks, can you construct a test case from this that I can use to
> debug the problem? If not, then I'll look at this after I look at the
> testsuite failures.

This is one of the testsuite failures (tst-timer4.c).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
