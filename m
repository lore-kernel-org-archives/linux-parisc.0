Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA10842
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Nov 2000 10:40:17 -0700
Message-ID: <008601c057d0$efcd5800$10f01618@ct44715a>
From: "Carl & Delores Walthall" <cwalthall@cwalthall.com>
To: "Alan Modra" <alan@linuxcare.com.au>,
        "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: <alan@lxorguk.ukuu.org.uk>, <parisc-linux@thepuffingroup.com>
References: <200011261645.LAA13960@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] RPM and hppa
Date: Sun, 26 Nov 2000 11:47:24 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi All

 I have a HP9000 J200 server and would like to find the operating system
software for it. Can you tell me where to look on the internet or who I may
call?
The server has a OS installed but no one can remember the user or password
information.
So they gave it to me to take home, is there a way to boot it on a floppy
and change this
information?

Thanks for any information you can give me!

Carl walthall

----- Original Message -----
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
To: "Alan Modra" <alan@linuxcare.com.au>
Cc: <alan@lxorguk.ukuu.org.uk>; <parisc-linux@thepuffingroup.com>
Sent: Sunday, November 26, 2000 10:45 AM
Subject: Re: [parisc-linux] RPM and hppa


> > On Sat, 25 Nov 2000, Alan Cox wrote:
> >
> > > - g++ explodes trying to build groff after allocating about 400Mb of
RAM.
> > >   Building -O0 works
> >
> > Yeah, this is a known issue.  I see on the gcc list that rth and others
> > have been working on gcc fixes recently that should address the problem.
> > I don't have the time/ability to fix it myself.
>
> I think the above is a different problem.  The explosion is most likely
> a problem with exception edges in the gcse pass.  Try `-fno-gcse'.  This
> also appears in the tFile.cc libio test.
>
> The pa port uses sjlj exceptions via __builtin_setjmp/longjmp.  A
> nonlocal goto label is used for the target of the longjmp.  The flow
> analysis assumes that an "exception" could jump to any label in the
> procedure rather than just the label associated with the exception
> region.
>
> Dave
> --
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 990-0752 (FAX:
952-6605)
>
> --------------------------------------------------------------------------
-
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com
with
> `unsubscribe' as the subject.
>
