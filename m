Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7ADEC482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 23:20:54 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id mwweiaaa for parisc-linux@lists.parisc-linux.org; Sat, 20 Oct 2001 22:16:11 -0700
Date: Sat, 20 Oct 2001 22:20:42 -0700
From: Randolph Chung <randolph@tausq.org>
To: Nicholas Leippe <nick@byu.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] how to use dpkg/dselect/apt-get ???
Message-ID: <20011020222042.G537@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <01102021292604.00166@nick>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01102021292604.00166@nick>
List-ID: <linux-parisc.vger.kernel.org>

You may want to try install deity-curses (aka console-apt). I'd like to
think it's easier to use :-)

> 3) How can I search the list so I can find, for example, 'X11'
> to '+' it and let it figure out what else is needed and then
> install it?

in dselect, you can search using / (like vi)
there's decent online help using 'h'.

> 4) Is there a better package interface than dselect?
> (rh/caldera/mdk's glint is 3+ yrs old and is still far superior
> to dselect--you can actually _understand_ what you're looking at)

well, many people find dselect easy to understand too, but i can see how
it's daunting. do give deity a try and see if that's easier for you.
 
> I am not against whatever debian uses considering all the wonderful
> features it's supposed to have, just rather annoyed that it is such a
> difficult/disgusting interface.

most of us just install things from command-line. For example, you can
do 'apt-get install x-window-system' from the command-line (as root)
once your system is up and running. 'apt-get update' updates your
"package sources" from the debian mirrors, and 'apt-get upgrade' will
install the newest versions of what you have on your system.

you can use 'apt-cache search <pattern>' to look at available packages.
There's also a web interface, http://packages.debian.org/

to use apt you need to have a correct /etc/apt/sources.list file. If the
installer didn't set one up for you, you can use something like this:

=================
deb http://http.us.debian.org/debian unstable main contrib non-free
deb http://debian.yorku.ca/debian/non-US unstable non-US/main non-US/contrib 
deb-src http://http.us.debian.org/debian unstable main contrib non-free
=================

as for mixing i386 and hppa, it won't happen; the debian package tools
are all arch-specific and will only look at the arch it's running on.

hope this helps.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
