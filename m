Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from femail29.sdc1.sfba.home.com (femail29.sdc1.sfba.home.com [24.254.60.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDB59482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 23:50:15 -0600 (MDT)
Received: from nick ([65.12.82.119]) by femail29.sdc1.sfba.home.com
          (InterMail vM.4.01.03.20 201-229-121-120-20010223) with SMTP
          id <20011021055014.DOTW21044.femail29.sdc1.sfba.home.com@nick>
          for <parisc-linux@lists.parisc-linux.org>;
          Sat, 20 Oct 2001 22:50:14 -0700
Content-Type: text/plain;
  charset="iso-8859-1"
From: Nicholas Leippe <nick@byu.edu>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] how to use dpkg/dselect/apt-get ???
Date: Sat, 20 Oct 2001 22:50:15 -0700
References: <01102021292604.00166@nick> <20011020222042.G537@tausq.org>
In-Reply-To: <20011020222042.G537@tausq.org>
MIME-Version: 1.0
Message-Id: <01102022501505.00166@nick>
List-ID: <linux-parisc.vger.kernel.org>

On Saturday 20 October 2001 22:20, you wrote:
> You may want to try install deity-curses (aka console-apt). I'd like to
> think it's easier to use :-)

I'll have to try that

> > 3) How can I search the list so I can find, for example, 'X11'
> > to '+' it and let it figure out what else is needed and then
> > install it?
>
> in dselect, you can search using / (like vi)
> there's decent online help using 'h'.

I just barely noticed the '/' option.

[snip]
> well, many people find dselect easy to understand too, but i can see how
> it's daunting. do give deity a try and see if that's easier for you.
>
> > I am not against whatever debian uses considering all the wonderful
> > features it's supposed to have, just rather annoyed that it is such a
> > difficult/disgusting interface.
>
> most of us just install things from command-line. For example, you can
> do 'apt-get install x-window-system' from the command-line (as root)
> once your system is up and running. 'apt-get update' updates your
> "package sources" from the debian mirrors, and 'apt-get upgrade' will
> install the newest versions of what you have on your system.
>
> you can use 'apt-cache search <pattern>' to look at available packages.
> There's also a web interface, http://packages.debian.org/

This is exactly the kind of stuff that oughta be on the front page of
the install howto, there's no way I'd know it was called 'x-window-system',
nor how on earth I could possibly find out.  Thanks.

> to use apt you need to have a correct /etc/apt/sources.list file. If the
> installer didn't set one up for you, you can use something like this:
>
> =================
> deb http://http.us.debian.org/debian unstable main contrib non-free
> deb http://debian.yorku.ca/debian/non-US unstable non-US/main
> non-US/contrib deb-src http://http.us.debian.org/debian unstable main
> contrib non-free =================
>
> as for mixing i386 and hppa, it won't happen; the debian package tools
> are all arch-specific and will only look at the arch it's running on.

I noticed it was only getting *hppa.debs, so figure it must be smart enough.

> hope this helps.

Yes, it does.  Thanks.

Nick
