Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA09409
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Jun 2000 23:16:28 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 29 Jun 2000 05:17:39 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA17033;
	Thu, 29 Jun 2000 15:17:14 +1000
Date: Thu, 29 Jun 2000 15:17:13 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: chester@linux.org.tw
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] userland test failure
In-Reply-To: <Pine.LNX.4.10.10006291258380.19961-100000@localhost.localdomain>
Message-ID: <Pine.LNX.4.21.0006291506560.27908-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 29 Jun 2000 chester@linux.org.tw wrote:

> Could you give me a hint to fix that(Maybe from source code),

It needs more than just a hint and a tweak or two!  Support for -fPIC will
roughly double the amount of code in bfd/elf32-hppa.c  You will be much
better off compiling without -fPIC for the time being.  Expect a binutils
with -fPIC support in the next few weeks.

> On Thu, 29 Jun 2000, Alan Modra wrote:
> > -fPIC and -shared are not supported at the moment, even with the newer
> > binutils-2.10 module available from puffin CVS.  With binutils-2.10,

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
