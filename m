Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id CDD8E482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Aug 2001 21:53:52 -0600 (MDT)
Date: Mon, 27 Aug 2001 23:54:31 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010827235431.K28978@megatonmonkey.net>
References: <20010826162754.A10072@megatonmonkey.net> <20010827203849.H525@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Sr1nOIr3CvdE5hEN"
In-Reply-To: <20010827203849.H525@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Mon, Aug 27, 2001 at 08:38:49PM +0100
List-ID: <linux-parisc.vger.kernel.org>

--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> > I started by building the tools, as per the instructions on the website.
> > 
> > - Built binutils
> > - Partially build gcc
> > - Unpack and configure kernel
> > - Build glibc...
> 
> Where did you get glibc from?  The only place with current patches is the
> Debian package.  Our CVS is terribly out of date.
> 
> -- 
> Revolutions do not require corporate support.

M,

That explains things...

ftp://puffin.external.hp.com/pub/parisc/cvs <== Bad!

ftp://ftp.debian.org/debian/pool/main/g/glibc/ <== Good!?

Cheers,
Carlos.

p.s. Small diff to the toolchain index.html ?

--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="index.html.diff"

--- ./toolchain/index.html	Mon Aug 27 22:45:01 2001
+++ index.html	Mon Aug 27 23:47:33 2001
@@ -94,9 +94,23 @@
 <br>&nbsp;<br>
 The source trees of all of these are available through <A HREF="../tools/index.html">CVS</A> but we also make available nightly snapshots from <A HREF="ftp://puffin.external.hp.com/pub/parisc/cvs/">here</A>.  It is best to get a snapshot the first time you want to build a tree and update from CVS from then on. <BR>
 
-
 <OL>
 <strong><LI>Fetch GCC, Binutils, Glibc, Linux:</strong>
+<br>&nbsp;<BR>
+Note that the /pub/parisc/cvs snapshots may not be completely up
+to date for glibc. The most complete snapshots may be found at the debian
+pool <a href="ftp://ftp.debian.org/debian/pool/main">ftp://ftp.debian.org/debian/pool/main</a>. Although the example lists glibc 2.2.4, you will want to replace this with the latest available glibc version.
+<PRE>
+cd
+mkdir source
+mkdir build
+cd source
+wget ftp://ftp.debian.org/debian/pool/main/g/glibc/glibc_2.2.4.orig.tar.gz
+wget ftp://puffin.external.hp.com/pub/parisc/cvs/binutils-latest.tar.gz
+wget ftp://puffin.external.hp.com/pub/parisc/cvs/gcc-latest.tar.gz
+wget ftp://puffin.external.hp.com/pub/parisc/cvs/linux-latest.tar.gz
+</PRE>
+Or alternatively:
 <PRE>
 cd
 mkdir source
@@ -109,9 +123,15 @@
 get binutils-latest.tar.gz
 get gcc-latest.tar.gz
 get linux-latest.tar.gz
-get glibc-latest.tar.gz
+quit
+ftp ftp.debian.org
+user: anonymous
+password: you@your.email.address
+cd debian/pool/main/g/glibc
+get glibc_2.2.4.orig.tar.gz
 quit
 </PRE>
+
 
 <strong>Determine the host system setup:</strong>
 <br>&nbsp;<br>

--Sr1nOIr3CvdE5hEN--
