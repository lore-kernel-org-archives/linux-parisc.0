Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA10005
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Nov 2000 09:43:07 -0700
Message-Id: <200011261645.LAA13960@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] RPM and hppa
To: alan@linuxcare.com.au (Alan Modra)
Date: Sun, 26 Nov 2000 11:45:08 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@lxorguk.ukuu.org.uk, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0011261406240.15548-100000@front.linuxcare.com.au> from "Alan Modra" at Nov 26, 2000 11:01:50 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Sat, 25 Nov 2000, Alan Cox wrote:
> 
> > - g++ explodes trying to build groff after allocating about 400Mb of RAM.
> >   Building -O0 works
> 
> Yeah, this is a known issue.  I see on the gcc list that rth and others
> have been working on gcc fixes recently that should address the problem.
> I don't have the time/ability to fix it myself.

I think the above is a different problem.  The explosion is most likely
a problem with exception edges in the gcse pass.  Try `-fno-gcse'.  This
also appears in the tFile.cc libio test.

The pa port uses sjlj exceptions via __builtin_setjmp/longjmp.  A
nonlocal goto label is used for the target of the longjmp.  The flow
analysis assumes that an "exception" could jump to any label in the
procedure rather than just the label associated with the exception
region.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
