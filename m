Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA15126
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Oct 2000 19:09:59 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Oct 2000 00:59:17 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA01306;
	Thu, 26 Oct 2000 11:55:32 +1100
Date: Thu, 26 Oct 2000 11:55:32 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: Matt Taggart <taggart@fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: xc-20001025.tar.gz
In-Reply-To: <200010252231.PAA21269@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0010261108450.31251-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 25 Oct 2000, Grant Grundler wrote:

> hppa-linux-ld dies with no error msg.
> Make complains with "make: *** [vmlinux] Error 1".
> 
> I reverted to the previous toolchain, 20001016, and make clean/vmlinux
> produced a vmlinux. Something is broken.

It sure is.  vmlinux.lds is putting .PARISC.unwind into the .text section
which badly confused the linker, and renders the unwind data useless.  The
unwind sections need to be put into a .PARISC.unwind output section.
Which is not an excuse for the linker bombing of course...  Fixing it.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
