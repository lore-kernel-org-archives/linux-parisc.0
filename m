Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA13523
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 21:09:14 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 23 Jun 2000 03:10:22 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA03558;
	Fri, 23 Jun 2000 11:45:16 +1000
Date: Fri, 23 Jun 2000 11:45:16 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Paul Bame <bame@fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs 
In-Reply-To: <E135Dev-0007ho-00@noam.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0006231116510.24137-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Paul,
   Thanks for testing this out for me.  Did you have any success stories
to report with the latest binutils patch?  eg. Does tar still run?

On Thu, 22 Jun 2000, Paul Bame wrote:

> Well the good news is I can (with some trouble) link a native
> binutils.  The bad news is that the kernel won't link.  To wit -
> 
> hppa1.1-linux-ld: fs/fs.o: cannot reach stub 080e89b4_00000000_printk
> hppa1.1-linux-ld: fs/fs.o: cannot handle relocation R_PARISC_PCREL17F for printk at 0x3fc98 in .text
> 
> This follows a 'make clean'.  I only re-built the new binutils and not
> gcc, if that matters.

No, gcc doesn't need to be rebuilt.  The problem here (I think - I'm going
to build a kernel in a the moment) is the silly use of "ld -r" in the
kernel build process.  This has the unfortunate effect of concatenating
all the .text sections, making some too large for a branch to reach its
stub section.  Of course this same thing can happen with very large object
files.

One fairly simple work-around is to use -ffunction-sections when compiling,
as then you need a truely enormous function (> 4*2**(17-1) bytes long)
before you'll get "cannot reach stub"  Also, gcc has support for handling
even these enormous functions.

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
