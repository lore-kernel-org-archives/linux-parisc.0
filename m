Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id HAA18098
	for <parisc-linux@puffin.external.hp.com>; Mon, 26 Jun 2000 07:53:35 -0600
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by palrel1.hp.com (Postfix) with SMTP id 3E21C86B
	for <parisc-linux@puffin.external.hp.com>; Mon, 26 Jun 2000 06:26:34 -0700 (PDT)
Date: Mon, 26 Jun 2000 09:20:39 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0006011600290.30171-100000@front.linuxcare.com.au>
Message-ID: <Pine.BSO.4.21.0006260907340.19112-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Recipe
List-ID: <linux-parisc.vger.kernel.org>


A couple questions about the recipe and the status of the 
cvs sources/snapshots -- for i386, my guess is you actually
don't want to specify --host=hppa-hpux, right?  It looks like
someone just cut and pasted the directions for compiling on hpux
without modifiying them at all.  

Secondly, either files are missing from the binutils cvs tree that
prevent libtool/automake from constructing bfd.h and a libbfd.la,
or I'm missing tools or one of my tools is a lower version than
needed.

I've been trying to get myself off the ground for a while now,
off and on (Ran out of disk on my HPUX box, which was 9.x anyway
so it was a pain, then found out cross-compile from ALPHA just wasn't
going to happen no matter how much I tried to fix binutils, and now I
finally have an i386 in here and I can't cross-compile there either.)  
I want to work on some of the input and video code, but I pretty much
can't make any contributions unless I can get the kernel to compile, 
a precompiled kernel doesn't have any development value.  (Although 
it would be nice to try a newer precompiled kernel just for the fun of
actually getting a working sash, so whoever was going to post one, please 
do.)

I think if you guys want more people participating in the project,
it's pretty important to make sure that the web pages are kept up
to date and the recipe works.  Including a list of last known
compiling/working snapshots and minimum versions of all tools required
would be a big plus.

--
Brian S. Julin
