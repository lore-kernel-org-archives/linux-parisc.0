Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F062F482A
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 15:43:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 1532sL-0001BD-00; Thu, 24 May 2001 22:42:33 +0100
Date: Thu, 24 May 2001 22:42:33 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: LaMont Jones <lamont@hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] still getting $$dyncall refs in shlibs
Message-ID: <20010524224233.G23718@parcelfarce.linux.theplanet.co.uk>
References: <20010524213301.126241872C@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010524213301.126241872C@security.hp.com>; from lamont@hp.com on Thu, May 24, 2001 at 03:32:59PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, May 24, 2001 at 03:32:59PM -0600, LaMont Jones wrote:
> With the new toolchain, sipp still builds a libsipp.so.3.1 trips the
> bug checker.  Checking everything on the system doesn't find any bad
> libs.  Here is the build output for libsipp.so:

I dug up a machine with binutils 2.11.90.0.1 and tried the same thing..

ld --shared -o libsipp.so.3.1 rendering.o geometric.o lightsource.o objects.o smalloc.o transforms.o viewpoint.o basic_shader.o marble.o granite.o mask.o bozo.o bumpy.o planet.o noise.o bezier.o bezier_lex.o pixelbuf.o torus.o cone.o ellipsoid.o prism.o sipp_pixmap.o sipp_bitmap.o wood.o xalloca.o phong.o strauss.o teapot.o  -soname libsipp.so.3 -lc
make[2]: Leaving directory `/home/demo/sipp/sipp-3.1/libsipp'

$ ls -l libsipp.so.3.1
-rwxr-xr-x    1 demo     demo       128429 May 24 15:36 libsipp.so.3.1
$ nm --dynamic libsipp.so.3.1 |grep '\$\$'
         U $$dyncall

so is there some other bug at work here?

> I'm at a loss from here - and give it to those who have a clue...

Likewise, i wish merely to report a data point.

-- 
Revolutions do not require corporate support.
