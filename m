Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA02551
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Nov 2000 21:58:20 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 28 Nov 2000 05:00:25 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA13306;
	Tue, 28 Nov 2000 15:59:54 +1100
Date: Tue, 28 Nov 2000 15:59:54 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Thomas Marteau <marteaut@esiee.fr>
cc: Puffin Group <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Include trouble
In-Reply-To: <3A22C48D.F5F85405@esiee.fr>
Message-ID: <Pine.LNX.4.21.0011281521520.7628-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 27 Nov 2000, Thomas Marteau wrote:

> Can we have your point of view?

Your version of gcc expects the size_t parameter to all these functions to
be "unsigned int", whereas the 2000/11/18 changes to
linux/include/asm-parisc/posix_types.h made __kernel_size_t
"unsigned long".

As far as I understand, gcc's cpp has a built-in definition of size_t,
__SIZE_TYPE__, and it ultimately gets it's idea of the definition from the
kernel includes on the machine where gcc was compiled.  ie. recompile gcc
with the new kernel headers installed, and the problem should go away.

For 32-bit hppa-linux, sizeof(int) == sizeof(long) so there shouldn't be
any practical consequence other than these warning messages.  There might
be some "interesting" problems on hppa64-linux - I'm not sure.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
