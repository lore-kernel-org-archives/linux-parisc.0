Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA10578
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Dec 2000 01:40:57 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 12 Dec 2000 08:43:42 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA12042;
	Tue, 12 Dec 2000 19:37:39 +1100
Date: Tue, 12 Dec 2000 19:37:39 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 32-bit xc-20001206.tar.gz is foobar 
In-Reply-To: <20001212082835.698F337CA1@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0012121934480.27939-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 12 Dec 2000, Matt Taggart wrote:

> Alan Modra writes...
> 
> 
> I just built a new cross-compiler (xc-20001211.tar.gz) and am still getting 
> similar errors when building the kernel. It doesn't seem to matter if I have 
> -ffunction-sections in the kernel Makefile or not.
> 
> > On a good fs.o, "hppa-linux-readelf -h fs.o" ought to show lots of .text.*
> > sections.

Oops, sorry.  "hppa-linux-objdump -h" or "hppa-linux-readelf -S"

> $ hppa-linux-readelf -h fs.o
> ELF Header:

-- 
Linuxcare.  Support for the Revolution.
