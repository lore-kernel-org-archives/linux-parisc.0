Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pilchuck.reedmedia.net (pilchuck.reedmedia.net [63.145.197.178])
	by dsl2.external.hp.com (Postfix) with ESMTP id D56FD482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Apr 2001 16:11:26 -0600 (MDT)
Date: Fri, 27 Apr 2001 15:11:12 -0700 (PDT)
From: "Jeremy C. Reed" <reed@reedmedia.net>
To: Brian Stewart <pdksh@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP 710 and miscellaneous questions ...
In-Reply-To: <OE25oryKFRJrzdDW6lC000046f5@hotmail.com>
Message-ID: <Pine.LNX.4.21.0104271500370.11174-100000@pilchuck.reedmedia.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 26 Apr 2001, Brian Stewart wrote:

> You will find the HP710 is not going to work for you at this moment. The 710

Okay.

> passes control to it. I would recommend using mklinux for the time being,

Okay, my brother gave me a drive with an OS:

MkLinux for HP PA-RISC
Release 1.1 (Linux 2.0.32-osfmach3 on a hp_pa)

[root@lakestevens /root]# uname -a
Linux lakestevens 2.0.32-osfmach3 #45 Fri Nov 28 11:35:33 MET 1997 hp_pa unknown

> ftp://ftp.cirr.com/pub/hppa/mklinux/

Since my kernel date is Nov. 28, 1997 -- I assume this is the same as the
mklinux from this site. Anything newer?

Maybe I need to build a newer one myself?

http://www.mklinux.org/using_mklinux/index.html seems to be for mklinux on
a Macintosh platform.

http://www.mklinux.org/using_mklinux/index.html and
ftp://ftp.cirr.com/pub/hppa/mklinux/mkpa-rel.html have some notes about
"Building MkLinux".

> I hope this helps

It sure does. Thank you Brian.

(My main goal with this box is to learn how to port a BSD operating
system.)

Now to setup my thinlan so I can talk to it over the network ...

   Jeremy C. Reed
   http://www.reedmedia.net/
