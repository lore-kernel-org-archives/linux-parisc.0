Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA19377
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Aug 2000 16:07:52 -0600
Message-Id: <200008121607.MAA08061@hiauly1.hia.nrc.ca>
Subject: Re: Millicode calls, GP register, ld -r
To: dhd@linuxcare.com (David Huggins-Daines)
Date: Sat, 12 Aug 2000 12:07:56 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, parisc-linux@thepuffingroup.com,
        parisc@lists.linuxcare.com
In-Reply-To: <87punemrk8.fsf@linuxcare.com> from "David Huggins-Daines" at Aug 12, 2000 11:23:35 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Alan Modra <alan@linuxcare.com.au> writes:
> 
> > I'll install a slightly modified version of your patch.  The other PLABEL
> > relocs should be handled as for PLABEL32, not that it matters for gcc
> > output as I've never caught gcc generating code that used PLABEL14R and
> > PLABEL21L.  A pity, because current gcc PIC code for handling function
> > pointers is rather inefficient.  Typically, you get something like:
> > 
> > .LC1:
> >         .word P'bar
> > .
> > .
> >         addil LT'.LC1,%r19
> >         ldw RT'.LC1(%r1),%r22
> >         ldw 0(%r22),%r22
> > 
> > which could all be replaced with
> > 
> > 	ldil LP'bar,%r22
> > 	ldo RP'bar(%r22),%r22
> > 
> > saving on code size, memory accesses, and relocs.
> 
> Interesting.  It would be trivial to hack that into GCC, I just wonder
> if there's some good reason it hasn't been done before.

The HP linker `-O' option eliminates unnecessary ADDIL instructions and
dead procedures.  Probably, it wasn't deemed necessary.  However, not
many remember to include -Wl,-O in their link flags.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
