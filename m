Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.hpl.hp.com (deimos.hpl.hp.com [192.6.19.190])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9233482A
	for <parisc-linux@parisc-linux.org>; Mon,  9 Apr 2001 11:20:51 -0600 (MDT)
Message-ID: <140D21516EC2D3119EE7009027876644049B5D42@hplex1.hpl.hp.com>
From: "Boehm, Hans" <hans_boehm@hp.com>
To: "'Matt Taggart'" <taggart@carmen.fc.hp.com>,
	parisc-linux@parisc-linux.org
Cc: whig@debian.org
Date: Mon, 9 Apr 2001 10:20:12 -0700 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] RE: hppa-linux support needed for libgc5
List-ID: <linux-parisc.vger.kernel.org>

If someone can get me an account on a Linux/PA machine, I'd be happy to see
if I can fix that in my current development version, which should make it
trivial to backport the right pieces to 5.3.

Is the Debian package normally built with thread support?  If so, is the
linuxthreads port to PA complete?

Are you trying to port the Java support in gcc?  If so, I believe we also
need a port of libffi to PA-RISC.  This is a more major project that would
be useful for both Linux/PA and HP/UX.  I'd be willing to help, but I don't
have the necessary PA experience.  (I did the libffi port for IA64.)

Hans

> -----Original Message-----
> From: Matt Taggart [mailto:taggart@carmen.fc.hp.com]
> Sent: Monday, April 09, 2001 9:32 AM
> To: parisc-linux@parisc-linux.org
> Cc: boehm@acm.org; whig@debian.org; taggart@carmen.fc.hp.com
> Subject: hppa-linux support needed for libgc5
> 
> 
> Hi HP_PA LINUX hackers,
> 
> The package libgc("a conservative garbage collector for C and 
> C++") needs some 
> hppa-linux specific changes. Right now it assumes that hppa 
> means HP-UX. The 
> upstream source is,
> 
> http://www.hpl.hp.com/personal/Hans_Boehm/gc/
> 
> and the debian package is named libgc5.
> 
> The build uses a program called if_mach to determine the 
> arch/os and it does 
> that by looking at the file "gcconfig.h".
> 
> In that file(version 5.3 of libgc) the lines 141-148, 
> 979-1016, 1320-1325 are 
> the ones we care about.  libgc5 is needed as a build/runtime 
> dependency for 
> several packages in Debian, most notably the gcc source 
> package. I will hack 
> it for now but we need to get real support added soon. Could 
> somebody with 
> more hppa experience take a look at it?
> 
> Thanks,
> 
> -- 
> Matt Taggart        Linux Development Lab
> taggart@fc.hp.com   HP Linux Systems Operation
> 
> 
