Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA10592
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Nov 2000 10:38:31 -0700
Message-ID: <007701c057d0$b0a94030$10f01618@ct44715a>
From: "Carl & Delores Walthall" <cwalthall@cwalthall.com>
To: "Alan Modra" <alan@linuxcare.com.au>,
        "Alan Cox" <alan@lxorguk.ukuu.org.uk>
Cc: <parisc-linux@thepuffingroup.com>
References: <Pine.LNX.4.21.0011261406240.15548-100000@front.linuxcare.com.au>
Subject: Re: [parisc-linux] RPM and hppa
Date: Sun, 26 Nov 2000 11:45:38 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Does anyone know where I can find the operating system
for the HP9000 J200 Server?

Thanks Carl Walthall

----- Original Message -----
From: "Alan Modra" <alan@linuxcare.com.au>
To: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
Cc: <parisc-linux@thepuffingroup.com>
Sent: Sunday, November 26, 2000 6:01 AM
Subject: Re: [parisc-linux] RPM and hppa


> On Sat, 25 Nov 2000, Alan Cox wrote:
>
> > - g++ explodes trying to build groff after allocating about 400Mb of
RAM.
> >   Building -O0 works
>
> Yeah, this is a known issue.  I see on the gcc list that rth and others
> have been working on gcc fixes recently that should address the problem.
> I don't have the time/ability to fix it myself.
>
> > - the configure script for procmail tries to find the largest argument
set
> >   that works (by searching). It crashes the kernel in doing so 8)
> >
> > - ldd is causing page faults in ld.so (kernel logged ones) and dying
with
> >   segv. Fortunately it outputs the library list first
>
> How old are your glibc and binutils?  I made some changes late October
> that should have fixed this problem.  See
>
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/10-Oct/0146.ht
ml
> Does "readelf -d" on your hppa-linux ld.so show you have a DT_TEXTREL tag?
>
> > - The linker appears to have a problem when resolving symbols between
three
> >   shared objects while doing a shared object link.
> >
> >   [Example is rpm:
> >
> > rpmlib is linked dynamically with -ldb3 -ldb
> >
> > The linker emits messages about symbols being static and should be
> > built -fPIC. If you dump the libraries they are -fPIC.
> >
> > It looks as if its resolving a symbol between two shared libraries
> > and making a static resolution that then blows up when the third
> > library gets involved
> >
> >    ]
>
> Could you put all the objects involved in the link up for ftp
> somewhere?  I've just built rpm-2.5.6 without seeing this problem, but I'm
> sure my setup is different to yours...
>
> Regards, Alan Modra
> --
> Linuxcare.  Support for the Revolution.
>
>
> --------------------------------------------------------------------------
-
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com
with
> `unsubscribe' as the subject.
>
