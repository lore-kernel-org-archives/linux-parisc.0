Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA05886
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 May 2000 19:23:01 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 24 May 2000 01:23:12 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA16934;
	Wed, 24 May 2000 11:21:37 +1000
Date: Wed, 24 May 2000 11:21:37 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] bad asm comments
In-Reply-To: <20000524010151.907CA37DA8@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0005241116300.13743-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 23 May 2000, Matt Taggart wrote:

> In building gcc/binutils-2.10 today I discovered a few asm files that are 
> still using ! as a comment character. They are,
> 
> ./gcc/gcc/config/pa/lib2funcs-elf.S
> ./glibc/csu/crti.S
> ./glibc/csu/crtn.S
> ./glibc/sysdeps/hppa/__longjmp.S
> ./glibc/sysdeps/hppa/setjmp.S
> 
> Which need to be changed?

Um, I only patched the kernel and palo, and was hoping someone else
would volunteer to do the rest of the tree.  I suppose I ought to fix
these too.

-- 
Linuxcare.  Support for the Revolution.
