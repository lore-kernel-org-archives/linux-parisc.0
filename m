Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA24282
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Mar 2000 08:00:06 -0700
Date: Tue, 28 Mar 2000 10:00:00 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] gcc 2.9
In-Reply-To: <Pine.LNX.4.10.10003252208590.28525-100000@morph.net>
Message-ID: <Pine.BSO.4.21.0003271414330.24803-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


I'm also still having problems getting cross-gcc 2.9 compiled.

One of the problems is that I elected to actually package and install
binutils with the debian scripts.  For some reason (maybe it's a
reasonable default considering the nature of the packages, but you'd
think with autoconf and all...), the gcc script uses the directory you 
give it as the install prefix in order to find the binutils "build
tooldir", so unless you are installing gcc and binutils at the same
prefix, it won't find the hppa binary tools and won't assemble
libgcc1.null, even if you have e.g. hppa1.1-linux-as in your path.

However, even after an ln /usr/hppa1.1-linux/bin/
/usr/src/parisc/hppa1.1-linux/bin it still fails, this time with:

FATAL: Can't create dummy.o: Invalid bfd target

I think this is prior to where the recipe says it is supposed to
fail.  Mainly because a make install doesn't actually install 
a hppa1.1-linux-gcc binary (I have to cp it from the build directory).
I get a similar error if I then go on to try to compile
PALO, when creating crt0.o.

My guess is some ALPHA tool or lib is still getting mixed in 
with the parisc stuff, but what, and what variables do I set to
correct for it?

--
Brian S. Julin
