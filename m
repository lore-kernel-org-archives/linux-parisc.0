Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA08260
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Nov 2000 04:59:56 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Nov 2000 12:02:16 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA22891;
	Sun, 26 Nov 2000 23:01:50 +1100
Date: Sun, 26 Nov 2000 23:01:50 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] RPM and hppa
In-Reply-To: <E13zmNf-0001KK-00@the-village.bc.nu>
Message-ID: <Pine.LNX.4.21.0011261406240.15548-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 25 Nov 2000, Alan Cox wrote:

> - g++ explodes trying to build groff after allocating about 400Mb of RAM.
>   Building -O0 works

Yeah, this is a known issue.  I see on the gcc list that rth and others
have been working on gcc fixes recently that should address the problem.
I don't have the time/ability to fix it myself.

> - the configure script for procmail tries to find the largest argument set
>   that works (by searching). It crashes the kernel in doing so 8)
> 
> - ldd is causing page faults in ld.so (kernel logged ones) and dying with
>   segv. Fortunately it outputs the library list first

How old are your glibc and binutils?  I made some changes late October
that should have fixed this problem.  See
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/10-Oct/0146.html
Does "readelf -d" on your hppa-linux ld.so show you have a DT_TEXTREL tag?

> - The linker appears to have a problem when resolving symbols between three
>   shared objects while doing a shared object link.
> 
>   [Example is rpm:
> 
> 	rpmlib is linked dynamically with -ldb3 -ldb
> 
> 	The linker emits messages about symbols being static and should be
> 	built -fPIC. If you dump the libraries they are -fPIC.
> 
> 	It looks as if its resolving a symbol between two shared libraries
> 	and making a static resolution that then blows up when the third
> 	library gets involved
> 
>    ]

Could you put all the objects involved in the link up for ftp
somewhere?  I've just built rpm-2.5.6 without seeing this problem, but I'm
sure my setup is different to yours...

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
