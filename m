Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C61A4A18
	for <parisc-linux@parisc-linux.org>; Fri,  2 Feb 2001 04:48:17 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA02147;
	Fri, 2 Feb 2001 22:48:11 +1100
Date: Fri, 2 Feb 2001 22:48:11 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problems building glibc
In-Reply-To: <01020212173801.05589@P100.helgenet.de>
Message-ID: <Pine.LNX.4.21.0102022244540.708-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 2 Feb 2001, Helge Deller wrote:

> ../sysdeps/generic/glob.c: In function `glob_in_dir':
> ../sysdeps/generic/glob.c:1446: Internal compiler error in eliminate_regs, at 
> reload1.c:2505

It's a known bug with our mainline gcc.  Fixed on the devel branch, but
that has other problems at the moment.  For the time beingg, compile this
file at -O1.

Alan
