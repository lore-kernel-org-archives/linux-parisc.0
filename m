Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA10298
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 16:58:07 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 5 Dec 2000 00:00:08 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA19909;
	Tue, 5 Dec 2000 10:59:45 +1100
Date: Tue, 5 Dec 2000 10:59:45 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: pa reload problem
In-Reply-To: <200012042308.SAA07602@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0012051014060.16721-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 4 Dec 2000, John David Anglin wrote:

> > On Mon, 4 Dec 2000, Richard Hirst wrote:
> > 
> > > > Note that all of the above applies to 32-bit modutils too.
> > > 
> > > Shouldn't be an issue with 32 bit, as kernel and modules all have
> > > the same dp there.
> > 
> > Yes, silly me.  32 bit is non-pic, so you don't need to worry about
> > it.  (%r19 in 32 bit case)
> 
> However, it may be an issue for 32 bit pic code under hpux.  It is not
> clear to me why this didn't show up before with 32 bit pic code.  For
> some reason, the circumstances which caused combine to delete the set
> restoring dp after function calls didn't seem to occur.

Hi Dave,
  Richard and I had wandered off-topic in the above exchange, and were
talking about modutils and stubs, in particular stub calls to millicode.

Getting back on topic, the reload problem _does_ affect 32 bit hppa code.
Compiling my testcase with -O2 -fPIC -S, gives

        copy %r19,%r4
        bl foo,%r2
        stw %r19,-32(%r30)
        addil LT'cpu_hz,%r4
        copy %r1,%r21
        addil LT'.LC0,%r19		! oops
        ldw RT'cpu_hz(%r21),%r21
        ldw RT'.LC0(%r1),%r1

Alan
-- 
Linuxcare.  Support for the Revolution.
