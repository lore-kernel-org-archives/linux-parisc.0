Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA09054
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 21:42:13 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 3 Jan 2001 04:45:33 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA24877;
	Wed, 3 Jan 2001 15:44:58 +1100
Date: Wed, 3 Jan 2001 15:44:58 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jeffrey A Law <law@redhat.com>
cc: Paul Bame <bame@fc.hp.com>, John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
In-Reply-To: <2276.978495351@upchuck>
Message-ID: <Pine.LNX.4.21.0101031532370.24351-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 2 Jan 2001, Jeffrey A Law wrote:

>   In message <Pine.LNX.4.21.0101031509470.24351-100000@front.linuxcare.com.au>y
> ou write:
>   > Ah, but that's where the automagic linker search for libmilli come into
>   > play.  Effectively, libmilli is always mentioned on the "command line"
> Does this automagic search also happen when you build shared libraries?

Yes.  shared libs thus get their own copy of millicode routines.

> [ Yes, I'm very familiar with HP's automagic searching for libmilli.a.  I also
>   think it's a terrible mistake as a design decision. ]

I'm not particularly enthusiastic about the idea either.  It seemed to be
the best solution in the face of a number of packages that "know" libgcc
isn't needed when linking certain programs.  eg. linux kernel, binutils
testsuite.  The alternatives are
  a) fix all the affected packages
  b) modify linker scripts
  c) magic inbuilt linker behaviour.

a) has the unfortunate effect of making hppa seem like the ugly duckling,
at least until all affected packages on the planet are fixed.
b) doesn't work with custom linker scripts.

I'm all ears for a better solution.

Alan
-- 
Linuxcare.  Support for the Revolution.
