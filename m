Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id D52E14A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 05:04:01 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA11226;
	Thu, 8 Feb 2001 23:03:42 +1100
Date: Thu, 8 Feb 2001 23:03:42 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Xavier Debacker <xavier.debacker@esiee.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problems building glibc
In-Reply-To: <3A8245E2.56628B1@esiee.net>
Message-ID: <Pine.LNX.4.21.0102082227570.9776-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 8 Feb 2001, Xavier Debacker wrote:

> ../sysdeps/generic/glob.c: In function `glob_in_dir':
> ../sysdeps/generic/glob.c:1446: Internal compiler error in
> eliminate_regs, at reload1.c:2505

Its a known bug with our mainline gcc, exposed by glibc now being
compiled at -O2 rather than -O1.  See
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-February/011609.html

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
