Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA25928
	for <parisc-linux@puffin.external.hp.com>; Sat, 10 Jun 2000 21:29:36 -0600
From: Steven Pritchard <steve@silug.org>
Message-Id: <200006110329.WAA05054@osiris.silug.org>
Subject: Re: [parisc-linux] hpux11 build problems.
In-Reply-To: <Pine.LNX.4.21.0006101047110.5101-100000@front.linuxcare.com.au>
 "from Alan Modra at Jun 10, 2000 11:20:55 am"
To: Alan Modra <alan@linuxcare.com.au>
Date: Sat, 10 Jun 2000 22:29:35 -0500 (CDT)
CC: =?US-ASCII?Q?SOETE_Jo=EBl?= <JSO@EUROPAY.COM>,
        parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra said:
> > > Would it be better to work with gcc-2.8.1-1 (on Software Porting And
> > > Archive Center for HPUX  (http://hpux.connect.org.uk/) it was no more
> > > available) or to prefer HPUX 10.20? Or is it requested to install also
> > > egcs-1.1.2-1?
> 
> You may be better off using the puffin gcc.

More specifically, I'd *avoid* the gcc in
puffin.external.hp.com/pub/parisc/binaries/depot/.  That's really only
there because a) I packaged it, and b) I thought it might be useful
for getting a better toolchain compiled.  It seemed to work for me,
but I never really tested it all that well.  I mostly used the egcs
that's also there to compile everything, although I'm pretty sure that
neither is suitable for compiling the kernel...

I guess I really need to get the CVS gcc packaged up for everyone...
Is it in a reasonably stable state at the moment?

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(618)398-7320             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
