Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA03553
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Jul 2000 18:36:47 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 5 Jul 2000 00:38:07 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA31546;
	Wed, 5 Jul 2000 10:38:02 +1000
Date: Wed, 5 Jul 2000 10:38:02 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: willy@thepuffingroup.com
cc: Paul Bame <bame@fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs
In-Reply-To: <20000704102154.Q12436@vodka.thepuffingroup.com>
Message-ID: <Pine.LNX.4.21.0007051036190.31061-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 4 Jul 2000 willy@thepuffingroup.com wrote:

> On Fri, Jun 23, 2000 at 11:45:16AM +1000, Alan Modra wrote:
> > One fairly simple work-around is to use -ffunction-sections when compiling,
> > as then you need a truely enormous function (> 4*2**(17-1) bytes long)
> > before you'll get "cannot reach stub"  Also, gcc has support for handling
> > even these enormous functions.
> 
> how about 
>   --split-by-reloc COUNT      Split output sections every COUNT relocs
> would that help?

No.  It would lead to the same problem as seen with the .init section.

-- 
Linuxcare.  Support for the Revolution.
